# dev_terraform

## 概要
開発環境構築用のTerraformです。

## デプロイ
FYI: https://developer.hashicorp.com/terraform/cli/commands

```sh
# 初期化
$ docker compose run --rm backend terraform init

# 構文チェック
$ docker compose run --rm backend terraform validate

# 実行計画
$ docker compose run --rm backend terraform plan

# デプロイ
$ docker compose run --rm backend terraform apply -auto-approve
```
