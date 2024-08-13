# ベースイメージとしてNode.js 20-alpineを使用
FROM node:20-alpine

# 作業ディレクトリを設定
WORKDIR /app

# 必要なライブラリをインストール
RUN apk add --no-cache zip aws-cli jq git docker

# Terraformをインストール
ENV TERRAFORM_VERSION 1.9.3

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform.zip -d /usr/local/bin && \
  rm -f terraform.zip

# Terraformファイルをコンテナにコピー
COPY dev_terraform/ ./dev_terraform/

COPY config/id_rsa.pub /root/.ssh/id_rsa.pub
COPY config/id_rsa /root/.ssh/id_rsa

# 作業ディレクトリをTerraformのディレクトリに変更
WORKDIR /app/dev_terraform

# デフォルトのコマンド
CMD ["sh"]
