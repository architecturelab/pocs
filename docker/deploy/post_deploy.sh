#!/bin/sh
chmod -R 777 /var/www/storage/logs/

# update application cache
# php artisan optimize
# php artisan cache:clear
# php artisan config:clear
# php artisan route:clear
# php artisan view:clear
# php artisan clear-compiled
#php artisan queue:restart
#php artisan queue:flush

# start the application
# /etc/init.d/nginx restart
php-fpm -D &&  nginx -g "daemon off;"
# php -r "echo ini_get('memory_limit').PHP_EOL;"
# php -r "echo ini_get('max_execution_time').PHP_EOL;"

#php artisan config:cache