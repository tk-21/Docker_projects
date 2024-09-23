準備が整ったら、以下の手順で Docker イメージをビルドし、コンテナを起動します。

Docker イメージのビルド
docker-compose build

コンテナの起動
コンテナをデタッチドモード（バックグラウンド）で起動します。
docker-compose up -d

6. コンテナへのアクセス
起動したコンテナのシェルにアクセスします。
docker-compose exec ubuntu-dev /bin/bash
シェルに入った後、設定したエイリアスが有効になっていることを確認できます。

# エイリアスの確認
alias

# 例: ll エイリアスの使用
ll

# Apache のステータス確認
apache-status

# MySQL のステータス確認
mysql-status

7. 確認と動作テスト
Apache の確認
ホストのブラウザで http://localhost:8080 にアクセスし、Apache のデフォルトページが表示されることを確認します。

MySQL の確認
コンテナ内で MySQL に接続してみます。
mysqlc
# パスワード: rootpassword
正常に接続できれば設定は完了です。

8. コンテナの停止と削除
作業が終了したら、以下のコマンドでコンテナを停止および削除できます。
docker-compose down