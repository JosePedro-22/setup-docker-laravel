#!/bin/bash

chown -R www-data:www-data /var/www/storage
rm -r /var/www/vendor /var/www/composer.lock
composer install
# # composer install --no-dev

exec "$@"
