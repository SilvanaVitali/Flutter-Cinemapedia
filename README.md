# Cinemapedia

El objetivo de esta aplicación es  crear código reutilizable, estructurado y con la posibilidad de expandirlo desde el inicio, de esta manera será más simple poder añadir nuevas funcionalidades a futuro.

## Librerias utilizadas
```
go_router
flutter_dotenv
dio
flutter_riverpod
card_swiper
animate_do
intl
```
> Para intalar las dependencias del proyecto ejecutar: ```flutter pub get```

## Dev
1. Copiar el .env.template y renombrarlo a .env
2. Cambiar las variables de entorno (The MovieDB)
## Desarrollo de la aplicación

### Primera parte
El objetivo de la sección es poder establecer los cimientos ordenados de nuestra arquitectura para reforzarlos y verlos en la práctica.

1. Datasources
    - Implementaciones
    - Abastracciones
2. Repositorios
    - Implementaciones
    - Abstracciones
3. Modelos
4. Entidades
5. Riverpod
    - Provider
    - StateNotifierProvider
    - Notifiers
6. Mappers

### Segunda parte

- Consultas a TheMovieDB para obtener:
    - Películas populares
    - Películas en cines
    - Películas mejor calificadas
    - Películas que próximamente estarán en cines
- Scroll horizontal infinito
- Slivers

### Tercera parte

Esta sección está dedicada al diseño de la pantalla de película de forma individual, contempla pasar parámetros, loaders y slivers.

### Cuarta parte

En esta sección se añade un motor de búsqueda completo y robusto para que nuestros usuarios puedan buscar sus películas ahí y preservar búsquedas anteriores para mejorar el rendimiento del mismo.

- SearchDelegate
- Datasources
- Repositorios
- Búsquedas contra TheMovieDB
- Debouncer
- Streams
- Builders
- DRY
- Providers

## Screenshot
<p align="center">
<h3>Home</h3>
  <img src="./assets/screenshots/0-home.png" alt="Screenshot" width="30%">

</p>
