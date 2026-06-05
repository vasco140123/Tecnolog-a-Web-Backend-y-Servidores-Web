<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Configuración para el manejo de caracteres
    request.setCharacterEncoding("UTF-8");

    // Obtenemos los parámetros del request
    String nombre = request.getParameter("nombre");
    String email = request.getParameter("email");

    /* IA: [Los datos pueden ser nulos si se accede directamente por GET (NPE)] → Solución manual: [Se añade una validación para asegurar que nombre y email no sean nulos y no estén vacíos, simulando el stateless HTTP y asegurando que haya datos antes de procesarlos en el servlet container] */
    if (nombre != null && email != null && !nombre.trim().isEmpty() && !email.trim().isEmpty()) {
        
        // Guardamos los datos en la sesión como indica la guía
        session.setAttribute("usuario_nombre", nombre);
        session.setAttribute("usuario_email", email);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Procesamiento JSP</title>
</head>
<body>
    <h2>Laboratorio 09 - JSP</h2>
    <h3>Datos recibidos y guardados en sesión:</h3>
    <p><strong>Nombre:</strong> <%= session.getAttribute("usuario_nombre") %></p>
    <p><strong>Email:</strong> <%= session.getAttribute("usuario_email") %></p>
</body>
</html>
<%
    } else {
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error JSP</title>
</head>
<body>
    <h3>Error: Faltan datos o método incorrecto.</h3>
    <a href="index.jsp">Volver al formulario</a>
</body>
</html>
<%
    }
%>
