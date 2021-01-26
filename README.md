# docker-compose-develop-environment-terraform
Terraform（tfenv）とaws-cliが利用可能です。

# How to use
## 事前準備
- /aws/config配下にcredentialsというファイルを作成してください
```credentials
[default]
aws_access_key_id=AKIAYEXAMPLEKEYID
aws_secret_access_key=EXAMPLESECRETKEYVALUE
```

- docker-compose.ymlのvolumesを編集してください
```yaml: docker-compose.yml
volumes:
# /host/terraform/workdirを作業したいホスト側ディレクトリに修正してください
    - /host/terraform/workdir:/terraform
```

- 上記が完了したら、下記コマンドを叩いてしばらくお待ちください
```
docker-compose up -d
```

## 使い方
- コンテナに入ります。
```
docker exec -it terraform /bin/bash
```

- ホスト側の好きなエディタで各種terraform関連ファイルを編集します。  
編集後にコンテナで各種terraformコマンドを実行します。

## terraformのversion
このコンテナでは以下のバージョンが予めインストールされています。  
利用したいバージョンが別にある場合はDockerfileを修正してください。
- 0.14.5 (default)
- 0.13.6
- 0.12.30