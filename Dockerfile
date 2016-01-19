FROM php:fpm

MAINTAINER webfatorial <webfatorial@webfatorial.com>

RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install libpcre3-dev
RUN apt-get -y install libmcrypt-dev
RUN apt-get -y install libfreetype6-dev
RUN apt-get -y install libjpeg62-turbo-dev
RUN apt-get -y install libjpeg-progs
RUN apt-get -y install libpng12-dev
RUN apt-get -y install libmagickwand-dev
RUN apt-get -y install php5-common
RUN apt-get -y install php5-gd
RUN apt-get -y install php5-mcrypt
RUN apt-get -y install php5-mysql
RUN apt-get -y install pngquant
RUN apt-get -y install sendmail


RUN docker-php-ext-install gd
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install mysqli

RUN pecl install apcu

RUN docker-php-ext-enable apcu

ADD etc /etc

RUN wget http://static.jonof.id.au/dl/kenutils/pngout-20130221-linux.tar.gz
RUN tar xvf pngout-20130221-linux.tar.gz
RUN mv pngout-20130221-linux/x86_64/pngout /usr/bin
RUN rm -rf pngout-20130221-linux

WORKDIR /var/www

RUN getent group www-data || groupadd www-data -g 33
RUN id -u www-data &>/dev/null || useradd -u 1000  --no-create-home --system --no-user-group www-data

RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

RUN chown -R www-data:www-data /var/www

CMD php-fpm
