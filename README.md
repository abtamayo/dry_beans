# Dry Beans API - Desafío Backend Drivin

API RESTful desarrollada para la gestión y trazabilidad de rutas logísticas, viajes y entregas.

## Stack Tecnológico
* **Ruby:** 3.1.0
* **Ruby on Rails:** 7.0.8.1 (API-only mode)
* **Base de Datos:** PostgreSQL
* **Testing:** RSpec

## Configuración y Ejecución local
1. Instalar dependencias: `bundle install`
2. Crear base de datos y correr migraciones: `rails db:create db:migrate`
3. Levantar el servidor: `rails server`
4. Ejecutar la suite de pruebas: `bundle exec rspec`

## Modelado de Datos: Modelo Delivery
Para complementar el modelo de paradas y asegurar la trazabilidad completa de la operación logística, se agregaron los siguientes campos a la tabla `deliveries`:

* **`action_type` (integer / enum):** Define si la parada es un `pickup` (retiro) o `dropoff` (entrega). Se implementó como un Enum para optimizar el almacenamiento en BD manteniendo un código legible.
* **`status` (integer / enum):** Permite conocer el estado del paquete (`pending`, `completed`, `failed`). Vital para la visibilidad en tiempo real de la operación.
* **`recipient_name` (string):** Nombre de la persona que entrega o recibe el paquete. Crítico como prueba de interacción (Proof of Delivery).
* **`address` (string):** Dirección física de la parada. Indispensable para la geolocalización y el enrutamiento.
* **`resolved_at` (datetime):** Marca de tiempo exacta en la que el conductor completó o falló la acción. Necesario para medir métricas de rendimiento y SLAs.

## Decisiones de Arquitectura y Buenas Prácticas Aplicadas
* **Optimización de Consultas (N+1):** En el `RoutesController#show` se implementó `.includes(trips: :deliveries)` para precargar las asociaciones en una sola consulta SQL, garantizando respuestas eficientes y escalables de la API.
* **Strong Parameters:** Se filtraron los datos de entrada en la creación de entregas para proteger la integridad de la base de datos.
* **Validaciones a nivel de Modelo:** El modelo `Delivery` restringe el guardado de registros inconsistentes (ej. entregas sin dirección o tipo de acción).

---
**Desarrollado por:** Alejandra Tamayo