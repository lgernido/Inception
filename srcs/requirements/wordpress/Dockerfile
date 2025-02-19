FROM debian:bullseye

RUN apt-get update -y 

RUN apt-get upgrade -y

RUN apt-get -y install wget

RUN apt-get install -y php7.4\
    php-fpm\
    php-mysql\
    mariadb-client

WORKDIR /var/www

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY conf/auto_config.sh /etc/wordpress/auto_config.sh

RUN chmod +x /etc/wordpress/auto_config.sh

EXPOSE 9000

CMD ["/etc/wordpress/auto_config.sh"]
