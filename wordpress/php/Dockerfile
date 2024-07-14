FROM php:7.4-fpm

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    zip \
    unzip

# Docker PHPの拡張機能をインストール
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install mysqli pdo pdo_mysql zip

# 不要なパッケージとキャッシュを削除
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

