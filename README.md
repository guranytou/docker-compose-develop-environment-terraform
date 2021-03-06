# docker-compose-develop-environment-terraform
Terraform（tfenv）とaws-cliとtfmigrateが利用可能です。

# Requirement Software
- Docker
- Docker-compose
- aws-vault

# Operation confirmed
- Docker
    - Version 20.10.2
- Docker-compose
    - Version 1.27.4
- aws-vault
    - Version 6.2.0

# How to use
## 事前準備
- `${WORK_DIR}`へTerraformを使いたいディレクトリを設定してください
- `${AWS_DEFAULT_REGION}`へ使いたいリージョンを設定してください
    - defaultのリージョンは東京になっています。

- 上記が完了したら、下記コマンドを叩いてしばらくお待ちください
```
aws-vault exec xxxxx -- docker-compose up -d
```

## 使い方
- コンテナに入ります。
```
docker exec -it terraform bash
```

- ホスト側の好きなエディタで各種terraform関連ファイルを編集します。  
編集後にコンテナで各種terraformコマンドを実行します。

## terraformのversion
このコンテナでは以下のバージョンが予めインストールされています。  
- 0.15.4 (default)
- 0.14.11
- 0.13.7
- 0.12.31
