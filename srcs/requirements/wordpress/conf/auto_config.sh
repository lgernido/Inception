#!/bin/bash

sleep 10;

wp core download --allow-root

wp core config		--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress';

wp core install		--allow-root \
					--admin_user=$ADMIN_USER \
					--admin_password=$ADMIN_PASSWORD \
					--admin_email=$ADMIN_EMAIL \
					--url=$SITE_URL \
					--title="$SITE_TITLE" \
					--path='/var/www/wordpress';

 
wp user create		${USER_FIRST_NAME} ${USER_MAIL} --role=author \
					--user_pass=${USER_PASSWORD} \
					--allow-root \
					--path='/var/www/wordpress'; 

wp plugin list --allow-root --path='/var/www/wordpress'; 

exec php-fpm7.4 -F;