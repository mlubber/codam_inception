#!/bin/bash

# Create necessary directory
mkdir -p /var/www/html/wordpress

# Configure WordPress if not already present
if [ ! -f wp-config.php ]; then

	# Install WP-CLI (wp command)
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	
	cd /var/www/html/wordpress
	
	# Downloading WordPress
	wp core download \
			--path="/var/www/html/wordpress/" \
			--allow-root

	# Setting up WordPress configuration
	wp config create \
			--path="/var/www/html/wordpress/" \
			--dbname="${WP_DATABASE_NAME}" \
			--dbuser="${DB_USER}" \
			--dbpass="${DB_USER_PASSWORD}" \
			--dbhost="${WP_DATABASE_HOST}" \
			--allow-root

	# Creating Wordpress Admin
	wp core install \
			--path="/var/www/html/wordpress/" \
			--url="${DOMAIN_NAME}" \
			--title="Inception" \
			--admin_user="${WP_ADMIN}" \
			--admin_password="${WP_ADMIN_PASSWORD}" \
			--admin_email="${WP_ADMIN_EMAIL}" \
			--allow-root

	# Creating Wordpress User
	wp user create ${WP_USER} ${WP_USER_EMAIL} \
			--path="/var/www/html/wordpress/" \
			--user_pass="${WP_USER_PASSWORD}" \
			--role=editor \
			--allow-root

	echo "WordPress setup complete"
else
	echo "WordPress is already present"
fi

exec php-fpm7.4 -F