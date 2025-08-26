#!/bin/bash

WP_PATH="/var/www/html/wordpress"

if [ ! -f ${WP_PATH}/wp-config.php ]; then

	wp core download \
		--path="${WP_PATH}" \
		--allow-root

	wp config create \
		--path="${WP_PATH}" \
		--dbname="${WP_DATABASE_NAME}" \
		--dbuser="${DB_USER}" \
		--dbpass="${DB_USER_PASSWORD}" \
		--dbhost="${WP_DATABASE_HOST}" \
		--allow-root

	wp core install \
		--path="${WP_PATH}" \
		--url="${DOMAIN_NAME}" \
		--title="Inception" \
		--admin_user="${WP_ADMIN}" \
		--admin_password="${WP_ADMIN_PASSWORD}" \
		--admin_email="${WP_ADMIN_EMAIL}" \
		--allow-root

	wp user create ${WP_USER} ${WP_USER_EMAIL} \
		--path="${WP_PATH}" \
		--user_pass="${WP_USER_PASSWORD}" \
		--role=editor \
		--allow-root

fi

exec php-fpm7.4 -F