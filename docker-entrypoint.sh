#!/bin/bash

echo $TIMEZONE > /etc/timezone;
dpkg-reconfigure -f noninteractive tzdata

dpkg-reconfigure -f noninteractive locales
locale-gen C.UTF-8
/usr/sbin/update-locale LANG=C.UTF-8
echo $LOCALE 'UTF-8' >> /etc/locale.gen
locale-gen
export LC_ALL=C.UTF-8
export LANG=$LOCALE
export LANGUAGE=$LOCALE

exec php-fpm