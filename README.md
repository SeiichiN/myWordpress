# myWordpress
Wordpress

Docker で WordPress 環境をつくるためのひな型。

### 以下のフォルダを作成する。

$ mkdir themes plugins uploads db_data

### php.ini

php.ini は /usr/loca/etc/php/php.ini-development をコピーして、それを
ローカルの php ディレクトリに置いた。
それに、以下の内容を書き足した。

``` php
410 memory_limit = 512M
483 display_errors = On
696 post_max_size = 512M
849 upload_max_filesize = 512M
965 date.timezone = Asia/Tokyo
```

### 始め方

$ docker-compose up -d

### 注意点

Dockerコンテナ内の /var/www/html の wp-content 以下が、すべての
ディレクトリが www-data:www-data になっていないかもしれない。。

そうすると、プラグインの更新などで失敗する。(権限エラー)

その場合は、以下のようにする。

``` bash
$ docker exec -it wp-nuk /bin/bash
root@XXXXXXXXXXXX:/var/www/html# chown -R www-data:www-data wp-content
```




 <!-- 修正時刻: Fri 2022/05/13 20:54:21 -->
