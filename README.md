# DAM2023-Evaluacion
Primeramente, lo que se desarrollo son dos tablas tomada de la base de datos que orginalemten se tiene como proyecto final de la clase, esta dos tablas son InventarioAnimales el cual esta relacionado de muchos a uno con especieanimal, principalmente se desarrollo tanto en el backend como en le frontend lo que de la tabla Especieanimal. mientrsa que por el momento, solamente se desarrollo a nivel de backend respecto a la tabla de Inventario animal.
Cabe recalcar que si se logro el proposito de realizar la evaluacion de desarrollo una de las tablas del proyecto, tambien seguir el patrón Bloc conforme a lo desarrollado en clases.

Configuración del Backend:

Abrir la carpeta asistenciaupeu-backend.
Dirígete a src - resources - application.properties.
En el archivo application.properties:
Configura el servidor cambiando el puerto: server.port=9090 (puede ser otro puerto si se prefiere).
Asegúrate de que la línea spring.datasource.url=jdbc:mysql://localhost:3308 refleje el puerto de tu gestor de base de datos (XAMPP, Laragon, etc.). Modifica el puerto si es diferente.
Ejecuta el backend.
Crea una base de datos con el nombre pruebabadostres.
Agrega en global-rol: ROLE_ADMIN, ROLE_USER.
Crea un usuario en la base de datos.


Configuración del Frontend:

Abre la carpeta asistenciaupeu_frontend.
Busca el archivo lib - util - UrlApi.dart.
En el archivo UrlApi.dart, cambia la IP por la dirección de tu máquina junto con el puerto en el que está funcionando el backend. Por ejemplo, si se usó el puerto 9090, modifica la dirección IP y el puerto a http://tu_direccion_ip:9090.
Realiza cambios similares en los archivos que se encuentran en lib - apis - que terminan en api_g con la dirección IP correspondiente al backend.
Una vez que hayas seguido estos pasos, el frontend debería estar configurado para funcionar correctamente con el backend. Recuerda que estos pasos son un resumen basado en las indicaciones que has proporcionado. Asegúrate de realizar ajustes adicionales si hay más configuraciones necesarias según las dependencias y requerimientos del proyecto. Además, es importante tener en cuenta la compatibilidad y la correcta conexión entre el backend y el frontend para que funcionen adecuadamente.