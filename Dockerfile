FROM herydj/laravel-php-render

WORKDIR /app

RUN apt-get install nodejs -y
RUN apt-get install npm -y

COPY . .

RUN composer install
RUN npm install
RUN npm run build

# uncomment if using a database other than sqlite
# RUN php artisan migrate -n

RUN php artisan storage:link
RUN php artisan key:generate

EXPOSE 8000

CMD ["./start.prod.sh"]