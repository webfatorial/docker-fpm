# webfatorial/docker-fpm

PHP extended version: provides a version of php-fpm with some php modules.
This fpm is configured to execute with user/group www-data

## PHP Modules

* apcu
* gd
* mcrypt
* mysqli

## Extras

* libfreetype6-dev
* libjpeg-progs
* libjpeg62-turbo-dev
* libmagickwand-dev
* libpng12-dev
* pngout
* sendmail

## Docker Compose example

```
fpm:
    image: webfatorial/fpm
    restart: 'yes'
    ports:
        - "9000:9000"
    volumes:
        - ./app:/var/www
        - ./php-config:/etc/php5/fpm
        - ./php-fpm-config:/etc/init.d
    links:
        - mysql
```