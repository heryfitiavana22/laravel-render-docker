rm public/hot
touch database/database.sqlite
RUN php artisan migrate -n

php artisan serve --host=0.0.0.0 --port=8001