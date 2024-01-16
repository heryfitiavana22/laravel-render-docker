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

RUN composer install
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

# if using sqlite
touch database/database.sqlite
php artisan migrate -n

php artisan serve --host=0.0.0.0 --port=8000
```

### Deployment on render

-   Create account if you don't have : [render](https://render.com/)
-   Go to the dashboard and create a new web service : `New + ` > ` Web Service` > And connect the repository
-   In the configuration, make runtime to `Docker`

![App Screenshot](./runtime.png)

-   Create your web service with the button `Create Web Service`
-   Setup environment, go to `Environment` > click the button `Add Secret File`

![App Screenshot](./secret.png)

-   Make filename to `.env`, paste the `.env` file content and change the `APP_ENV` and `APP_URL` value like this :

![App Screenshot](./env.png)

-   Finally, click `Done` > `Save Changes`. Wait deploying and see your app 


## Troubleshooting

    - Mixed Content: The page at 'https://laravel-react-render-docker-example.onrender.com/' was loaded over HTTPS, but requested an insecure script 'http://laravel-react-render-docker-example.onrender.com/build/assets/app-wUJ-_bob.js'. This request has been blocked; the content must be served over HTTPS.

Go to `app` > `Providers` > `AppServiceProvider.php` file and :
```php
<?php

namespace App\Providers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if(env('APP_ENV') !== 'local')
        {
            URL::forceScheme('https');
        }
    }
}

```
😎😉

## Related

Here are some related link

-   [Laravel](https://laravel.com/)
-   [Docker](https://www.docker.com/)
