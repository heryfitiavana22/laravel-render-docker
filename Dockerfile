FROM herydj/laravel-php-render

WORKDIR /app

RUN apt-get update
RUN apt-get install nodejs -y
RUN apt-get install npm -y

COPY . .

RUN chmod +x ./start.prod.sh

RUN composer install
RUN npm install
RUN npm run build

RUN php artisan key:generate

EXPOSE 8000

CMD ["./start.prod.sh"]