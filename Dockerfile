FROM herydj/laravel-php-render

WORKDIR /app

# uncomment if you want to use nodejs
# RUN apt-get install nodejs -y
# RUN apt-get install npm -y

COPY . .

RUN chmod +x ./start.prod.sh

RUN composer install

# if using nodejs
# RUN npm install
# RUN npm run build

# uncomment if using a database other than sqlite
# RUN php artisan migrate -n

RUN php artisan storage:link
RUN php artisan key:generate

EXPOSE 8000

CMD ["./start.prod.sh"]