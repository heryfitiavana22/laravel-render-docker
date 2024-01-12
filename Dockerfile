FROM herydj/laravel-php-render

WORKDIR /app

# RUN apt-get install mysql-server

RUN apt-get install nodejs -y
RUN apt-get install npm -y

COPY . .

COPY start.prod.sh /app

RUN chmod +x ./start.prod.sh

RUN composer install
RUN npm install
RUN npm run build
# uncomment if you use database
RUN php artisan migrate -n
RUN php artisan storage:link

EXPOSE 8000

CMD ["./start.prod.sh"]