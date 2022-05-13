FROM wordpress:latest

MAINTAINER Seiichi Nukayama <billie175@gmail.com>

# 必要なツール類
RUN apt-get update
RUN apt-get -y install wget unzip vim less tzdata

# wpプラグイン(zip) ダウンロード
WORKDIR /tmp/wp-plugins
RUN wget https://downloads.wordpress.org/plugin/wp-multibyte-patch.2.8.1.zip

# php.ini のコピー
COPY ./php/php.ini /usr/local/etc/php/ 

# zipファイルの解凍とインストール
RUN unzip './*.zip' -d /usr/src/wordpress/wp-content/plugins

# 不要になった一時ファイルを削除
RUN apt-get clean
RUN rm -rf /tmp/*

# サーバが読めるように wp-content 以下の所有権を変更
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content

WORKDIR /var/www/html
