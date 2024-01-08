FROM herydj/laravel-render-php

WORKDIR /app

RUN apt-get update
RUN apt-get install nodejs -y
RUN apt-get install npm -y

COPY . .

RUN chmod +x ./start.prod.sh

RUN npm install
RUN npm run build

# uncomment if you use database
# RUN php artisan migrate -n
RUN php artisan storage:link

EXPOSE 8000

CMD ["./start.prod.sh"]