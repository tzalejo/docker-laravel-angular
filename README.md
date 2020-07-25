# Docker Angular y Laravel

## Crear proyecto laravel
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .

## Crear proyecto angular
docker-compose run --rm npm ng new frontend --directory=.

## Para dar persmiso para modificar:

- `docker-compose exec php chmod -R gu+w .`
- `docker-compose exec php chmod -R guo+w .`

- `docker-compose exec npm chmod -R gu+w .`
- `docker-compose exec npm chmod -R guo+w .`

- `docker-compose run --rm artisan cache:clear`


Los contenedores creados y sus puertos (si se usan) son los siguientes:

- `nginx - :8088`
- `mysql - :4306`
- `php - :9000`
- `angular -:4200`

## Persistent MySQL Storage

Por defecto, cada vez que derribe la red de compilación acoplable, sus datos MySQL se eliminarán después de que se destruyan los contenedores. Si desea tener datos persistentes que permanecen después de bajar y volver a colocar los contenedores, haga lo siguiente:

Cree una carpeta mysql en la raíz del proyecto, junto con las carpetas nginx y src. Bajo el servicio mysql en su archivo `docker-compose.yml`, agregue las siguientes líneas: volumes:

`./mysql:/var/lib/mysql`


## Comando adicionales:

- `npm run install-dependencies` ejecutamos la instalaciones de todas las dependencias del backend y frontend
- `docker-compose -f docker-compose.prod.yml up -d --build` ejecutamos docker-compose production
- `docker-compose run --rm artisan (composer, npm) comando` ejecuta composer, npm, artisan dentro del contenedor
- `docker-compose exec {container_name} /bin/sh`
