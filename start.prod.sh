rm public/hot

# if using sqlite
touch database/database.sqlite
php artisan migrate -n

php artisan serve --host=0.0.0.0 --port=8000