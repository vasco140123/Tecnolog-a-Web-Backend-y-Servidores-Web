# Informe de Laboratorio: Semana 09 - Tecnología Web Backend y Servidores Web

**Asignatura:** Desarrollo de Aplicaciones Web (IS093A)  
**Tema:** Tecnología Web Backend, Arquitectura Cliente-Servidor, Servidores Web, PHP & JSP, Ciclo de Vida y Despliegue  

## 1. Objetivo de la Práctica
Implementar y desplegar aplicaciones web del lado del servidor utilizando PHP y JSP. Se comprendió la arquitectura cliente-servidor, el ciclo de solicitud-respuesta HTTP, la configuración de entornos de ejecución (XAMPP para PHP, Apache Tomcat para JSP) y se validó el despliegue local aplicando prácticas básicas de seguridad y manejo de sesiones.

## 2. Desarrollo Paso a Paso (Evidencias)

### Paso 1: Inicialización de Servidores
Se procedió a levantar los entornos de ejecución necesarios en modo local (localhost).
- Se inició el servidor web Apache mediante el panel de control de XAMPP (puerto 80/443).
- Se inició el contenedor de servlets Apache Tomcat (puerto 8080).

### Paso 2: Creación y Despliegue de Estructura PHP
Se desarrolló un formulario en HTML que envía información mediante el método POST a un procesador PHP.
- **Archivos creados:** `index.html` (interfaz), `config.php` (constantes) y `procesar.php` (lógica).
- **Lógica de Procesamiento:** Se utilizaron variables superglobales (`$_POST`), y se protegió la información utilizando las funciones de saneamiento `filter_input()` y `htmlspecialchars()`.
- **Despliegue:** La carpeta `lab09` se ubicó en el directorio `htdocs` de XAMPP.

### Paso 3: Creación y Despliegue de Estructura JSP
De manera equivalente, se replicó la funcionalidad utilizando tecnología Java Server Pages (JSP).
- **Archivos creados:** `index.jsp` (formulario), `procesar.jsp` (lógica y sesiones) y `web.xml` (descriptor de despliegue).
- **Lógica de Procesamiento:** Se recuperaron los datos con `request.getParameter()`. Al validar que no sean nulos, se guardaron simulando un estado con `session.setAttribute()`.
- **Despliegue:** El proyecto se empaquetó como carpeta en el directorio `webapps` de Tomcat.

### Paso 4: Pruebas y Análisis del Ciclo Request/Response (DevTools y Logs)
Se comprobó el correcto flujo de las cabeceras HTTP mediante las herramientas de desarrollador del navegador.
- Al enviar el formulario, se detectó un código de estado `200 OK`, confirmando que el servidor procesó y respondió la solicitud correctamente.
- Se inspeccionaron los métodos HTTP asegurando el uso exclusivo de `POST` para el envío.
- **Revisión de Logs del Servidor:** Se verificó el registro de accesos del servidor comprobando los archivos `access.log` generados.

## 3. Comparación de Arquitecturas: PHP vs JSP

| Característica | PHP | JSP (Java Server Pages) |
| :--- | :--- | :--- |
| **Ciclo de Vida** | *Stateless y efímero.* En cada petición, el script se ejecuta y muere, liberando la memoria. | *Servlet Lifecycle.* Se traduce, compila y se instancia en memoria para peticiones futuras. |
| **Gestión de Memoria** | Memoria liberada tras cada solicitud. Seguro pero sobrecarga el inicio. | Mantiene los hilos en memoria. Optimiza rendimiento pero vulnerable a fugas de memoria. |
| **Despliegue** | Dinámico y veloz (Hot Reloading) con solo copiar archivos. | Requiere un Descriptor de Despliegue (`web.xml`). A veces requiere reiniciar el Tomcat. |
| **Escalabilidad** | Escala horizontalmente de manera sencilla (no guarda estado). | Requiere arquitecturas complejas como *Session Clustering*. |

## 4. Uso de Inteligencia Artificial (Reporte de Regla)

Durante el laboratorio se empleó IA bajo las restricciones indicadas para resolver aspectos lógicos, comentando cada intervención en el código:

1. `/* IA: [Posible falta de conexión a BD] -> Solución manual: [Se deja config.php preparado] */`
2. `/* IA: [Manejo de variables vacías causando advertencias] -> Solución manual: [Se agrega validación !empty] */`
3. `/* IA: [Manejo de acceso por GET] -> Solución manual: [Respuesta de Error] */`
4. `/* IA: [Datos nulos en JSP] -> Solución manual: [Se añade validación simulando stateless] */`
5. `/* IA: [Inicio por defecto] -> Solución manual: [Se configura welcome-file-list en web.xml] */`
