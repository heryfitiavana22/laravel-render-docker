FROM herydj/laravel-render-php

WORKDIR /app

# RUN apt-get install mysql-server

COPY . .

COPY start.prod.sh /app

RUN chmod +x ./start.prod.sh


# uncomment if you use database
RUN php artisan migrate -n
RUN php artisan storage:link

EXPOSE 8000

CMD ["./start.prod.sh"]