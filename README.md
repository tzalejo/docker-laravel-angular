# Docker Angular y Laravel

## Definir las variables de entorno
.env-ejemplo cambiar a .env primero debemos seleccionar que base de datos usaremos, mysql o postgres y luego definir las variable de esta. Luego las variable del backend deben indicar que version de php y composer( tener en cuanta a la hora de que version de laravel vamos a usar) y del frontend seria con angular.

### Variable de base de datos: msyql
- `MYSQL_DATABASE=`
- `MYSQL_USER=`
- `MYSQL_PASSWORD=`
- `MYSQL_ROOT_PASSWORD=`
- `MYSQL_SERVICE_NAME=`
- `MYSQL_SERVICE_TAGS=`
- `MYSQL_PORT=`
- `MYSQL_PORT_CONTAINER=`
- `MYSQL_VOLUMEN=`
- `MYSQL_VERSION=`
### Variable de base de datos: postgres
- `POSTGRES_VERSION=`
- `POSTGRES_DB=`
- `POSTGRES_USER=`
- `POSTGRES_PASSWORD=`
- `POSTGRES_PORT=`
- `POSTGRES_ENTRYPOINT_INITDB=`
- `POSTGRES_VOLUMEN_PATH=`

### Variable Backend(laravel)
- `APP_VOLUMEN=`
- `APP_PORT=`
- `APP_PHP_VERSION=7.4`
- `APP_PHP_VARIANTE=fpm-alpine`
- `COMPOSER_VERSION=2.0`

### Variable Frontend(Angular)
- `NPM_VOLUMEN=`
- `NPM_PORT=`
- `NPM_PORT_CONTAINER=`
- `NPM_NODE_VERSION=14.5.0`
- `NPM_NODE_VARIANTE=alpine`

Una vez definido todas las variables de entorno, debemos crear el entorno con el comando:
- `docker-compose up -d --build `
Con esto ya estaria para continuar creando los proyectos de laravel y angular. Algo que hay que saber es que hay dos contenedores, artisan y composer, que son contenedores que utilizaremos para ejecutar comandos.

## Crear proyecto laravel
`docker-compose run --rm composer create-project --prefer-dist laravel/laravel .`
`docker-compose run --rm composer create-project --prefer-dist laravel/laravel:^7.0 .` Si quiero especificar una version 

## Crear proyecto angular
`docker-compose run --rm npm ng new frontend --directory=.`

## Para dar persmiso para modificar:(solo si tiene problema de permiso pero ya fue solucionado por lo tanto este paso no es necesario)

- `docker-compose exec php chmod -R gu+w .`
- `docker-compose exec php chmod -R guo+w .`

- `docker-compose exec npm chmod -R gu+w .`
- `docker-compose exec npm chmod -R guo+w .`

- `docker-compose run --rm artisan cache:clear`

## Los contenedores creados y sus puertos (si se usan) son los siguientes:

- `nginx - :${APP_VOLUMEN}`
- `mysql - :${MYSQL_PORT}`
- `pgsql - :${POSTGRES_PORT}`
- `php - :9000`
- `angular -:${NPM_PORT}`

## Comando adicionales:

- `npm run install-dependencies` ejecutamos la instalaciones de todas las dependencias del backend y frontend
- `docker-compose -f docker-compose.prod.yml up -d --build` ejecutamos docker-compose production
- `docker-compose run --rm artisan (composer, npm) comando` ejecuta composer, npm, artisan dentro del contenedor
- `docker-compose exec {container_name} /bin/sh`
- `psql -U admin -d postgres -h localhost`

## Ngrok

- `./ngrok http APP_PORT -host-header="localhost:APP_PORT"`
- `./ngrok http --host-header=rewrite APP_PORT`

# Donaciones
- BTC: bc1q4je0jjmycfrfum4cgut48qdprvm02ahfshwwga
- ETH: 0x4804c6B390fC55BB6E6684216D1aDeD6B83e1198