<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario JSP - Semana 09</title>
</head>
<body>
    <h2>Registro de Usuario (JSP)</h2>
    <form action="procesar.jsp" method="POST">
        <label for="nombre">Nombre:</label><br>
        <input type="text" id="nombre" name="nombre" required><br><br>
        
        <label for="email">Correo Electrónico:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        
        <button type="submit">Enviar</button>
    </form>
</body>
</html>
