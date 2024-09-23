# 公式の Ubuntu ベースイメージを使用
FROM ubuntu:22.04

# 環境変数を非対話モードに設定（自動ビルド時に役立ちます）
ENV DEBIAN_FRONTEND=noninteractive

# パッケージリストを更新し、必要なツールとサービスをインストール
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        vim \
        wget \
        build-essential \
        net-tools \
        iputils-ping \
        software-properties-common \
        apache2 \
        mysql-server \
        supervisor \
        && rm -rf /var/lib/apt/lists/*

# MySQL の root パスワードを事前に設定
RUN echo "mysql-server mysql-server/root_password password rootpassword" | debconf-set-selections && \
    echo "mysql-server mysql-server/root_password_again password rootpassword" | debconf-set-selections

# MySQL の初期設定と root ユーザーの認証方法変更
RUN service mysql start && \
    mysql -u root -prootpassword -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rootpassword';" && \
    mysql -u root -prootpassword -e "FLUSH PRIVILEGES;" && \
    service mysql stop

# Apache の設定（必要に応じて設定を追加）
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# supervisord の設定ファイルをコピー
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# エイリアススクリプトをコピー
COPY config/aliases.sh /root/aliases.sh

# .bashrc にエイリアススクリプトをソースする行を追加
RUN echo "source /root/aliases.sh" >> /root/.bashrc

# ログディレクトリの作成
RUN mkdir -p /var/log/apache2 /var/log/mysql

# ポートの公開
EXPOSE 80 3306

# supervisord を使用して Apache と MySQL を起動
CMD ["/usr/bin/supervisord"]
