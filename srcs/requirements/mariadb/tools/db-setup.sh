#!/bin/bash

# Moving the configuration file to the right location
mv /db-config.cnf /etc/mysql/mariadb.conf.d/db-config.cnf

# Setting permissions
chmod 644 /etc/mysql/mariadb.conf.d/db-config.cnf

# Creating directories and setting permissions
mkdir -p /run/mysqld 
mkdir -p /var/log/mysql
mkdir -p /var/lib/mysql
chown -R mysql:mysql /run/mysqld 
chown -R mysql:mysql /var/log/mysql
chown -R mysql:mysql /var/lib/mysql

# Setting up the database, user, and permissions in bootstrap mode.
# bootstrap runs MariaDB in a lightweight, non-networked mode.
{
	echo "FLUSH PRIVILEGES;"
	echo "CREATE DATABASE IF NOT EXISTS \`$WP_DATABASE_NAME\`;"
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
	echo "GRANT ALL PRIVILEGES ON \`$WP_DATABASE_NAME\`.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
	echo "FLUSH PRIVILEGES;"
} | mysqld --bootstrap

exec mysqld