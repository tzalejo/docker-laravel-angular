# Docker Angular y Laravel

Un flujo de trabajo bastante simplificado de composición acoplable que configura una red de contenedores LEMP para el desarrollo local.

## Uso

Para comenzar, asegúrese de tener Docker instalado en su sistema y luego clone este repositorio.

Primero agregue todo su proyecto Laravel a la carpeta src, luego abra una terminal y desde la raíz de este repositorio clonado ejecute `docker-compose up -d --build`. Abra su navegador de elección en `http://localhost:8088` y debería ver que su aplicación Laravel se ejecuta según lo previsto. Su aplicación Laravel debe estar en el directorio src primero antes de abrir los contenedores, de lo contrario, el contenedor artesanal no se compilará, ya que le falta el archivo apropiado.

Nuevo: Se han agregado tres nuevos contenedores que manejan los comandos Composer, NPM y Artisan sin tener que tener estas plataformas instaladas en su computadora local. Use las siguientes plantillas de comando de la raíz de su proyecto, modificándolas para que se ajusten a su caso de uso particular:

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate`

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

## Por algun motivo de persmiso storage ejecutar:

- `docker-compose exec php chmod -R gu+w storage`
- `docker-compose exec php chmod -R guo+w storage`
- `docker-compose run --rm artisan cache:clear`

- `docker-compose -f docker-compose.prod.yml up -d --build` ejecutamos docker-compose production
- `docker-compose run --rm artisan (composer, npm) comando` ejecuta composer, npm, artisan dentro del contenedor
- `docker-compose exec {container_name} /bin/sh`
