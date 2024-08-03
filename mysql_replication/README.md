### Docker Compose を使用して環境を立ち上げる

以下のコマンドを実行して、Docker Composeで環境を立ち上げます。

```
docker-compose up -d

```

### Master の設定を確認

マスターのコンテナに入り、レプリケーションのステータスを確認します。

```bash
docker exec -it mysql_master mysql -uroot -p -e "SHOW MASTER STATUS\G"
```

出力例：

```
*************************** 1. row ***************************
             File: binlog.000002
         Position: 157
     Binlog_Do_DB:
 Binlog_Ignore_DB:
Executed_Gtid_Set:

```

この情報を元に、スレーブの設定を行います。

### Slave MySQL の設定

### スレーブのI/Oスレッドを停止

まず、スレーブのI/Oスレッドを停止します。

```
docker exec -it mysql_slave mysql -uroot -p -e "STOP SLAVE IO_THREAD;"
```

### マスター設定を変更してレプリケーションを開始

次に、`CHANGE MASTER TO`コマンドを実行して、マスターの設定を変更し、レプリケーションを開始します。

```
docker exec -it mysql_slave mysql -uroot -p -e "CHANGE MASTER TO MASTER_HOST='mysql_master', MASTER_USER='repluser', MASTER_PASSWORD='replpassword', MASTER_LOG_FILE='binlog.000002', MASTER_LOG_POS=157; START SLAVE;"
```

ここで、`MASTER_LOG_FILE`と`MASTER_LOG_POS`の値は、前のステップで確認したマスターのステータスに応じて変更します。

### レプリケーションのステータスを確認

最後に、レプリケーションが正常に動作しているかどうかを確認します。

```
docker exec -it mysql_slave mysql -uroot -p -e "SHOW SLAVE STATUS\G"
```

`Slave_IO_Running`と`Slave_SQL_Running`が`Yes`になっていれば、レプリケーションが正常に動作しています。

これで、Dockerを使用したMySQLのレプリケーション環境が構築できました。追加の設定や調整が必要な場合は、適宜設定ファイルや初期化スクリプトを変更してください。