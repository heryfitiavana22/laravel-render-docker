# Laravel-render-docker

## Dockerize laravel on render

This repository provides instructions for deploying a Laravel application on [Render](https://render.com/). You can see this example [here](https://laravel-react-render-docker-example.onrender.com).

## Requirements

-   [Docker](https://docs.docker.com/) installed on your machine
-   [render](https://render.com/) account
-   [Laravel breeze and choose react](https://bootcamp.laravel.com/inertia/installation#installing-laravel-breeze)

### Dockerfile

The `Dockerfile` contains instructions for building the Docker image of your application. You can find the Dockerfile for my image `herydj/laravel-render-php` in the `.dockerfile` folder.

```dockerfile
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
```

### Command start

Create file `start.prod.sh` in the project root and paste the content below :

```bash
rm public/hot
php artisan serve --host=0.0.0.0 --port=8000
```

### Deployment on render

-   Create account if you don't have : [render](https://render.com/)
-   Go to the dashboard and create a new web service : `New + ` > ` Web Service` > And connect the repository
-   In the configuration, make runtime to `Docker`

![App Screenshot](./runtime.png)

-   Finally, create your web service with the button `Create Web Service`

## Related

Here are some related link

-   [Laravel](https://laravel.com/)
-   [Docker](https://www.docker.com/)
