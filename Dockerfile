FROM herydj/laravel-render-php

WORKDIR /app

RUN apt-get install curl

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash 

# RUN apt-get install nodejs -y
# RUN apt-get install npm -y

COPY . .

COPY start.prod.sh /app

RUN chmod +x ./start.prod.sh

# RUN npm install
# RUN npm run build
# RUN php artisan migrate -n
RUN php artisan storage:link

EXPOSE 8000

CMD ["./start.prod.sh"]