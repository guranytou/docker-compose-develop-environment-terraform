# docker-compose-develop-environment-terraform
Terraform（tfenv）とaws-cliが利用可能です。

## 使い方
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