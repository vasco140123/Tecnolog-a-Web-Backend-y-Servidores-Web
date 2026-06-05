<?php
require_once 'config.php';

// Validamos que la petición sea POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Obtenemos y saneamos los datos de entrada
    // Se usa filter_input y htmlspecialchars como indica la guía
    $nombre_raw = filter_input(INPUT_POST, 'nombre');
    $email_raw = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    
    $nombre = htmlspecialchars($nombre_raw, ENT_QUOTES, 'UTF-8');
    $email = htmlspecialchars($email_raw, ENT_QUOTES, 'UTF-8');

    /* IA: [Manejo de variables no definidas o vacías causando advertencias] → Solución manual: [Se agrega validación básica !empty para comprobar que los campos obligatorios no estén vacíos antes de mostrar la respuesta] */
    if (!empty($nombre) && !empty($email)) {
        echo "<h2>" . APP_NAME . "</h2>";
        echo "<h3>Datos recibidos correctamente:</h3>";
        echo "<p><strong>Nombre:</strong> " . $nombre . "</p>";
        echo "<p><strong>Email:</strong> " . $email . "</p>";
    } else {
        echo "<h3>Error: Todos los campos son obligatorios.</h3>";
        echo '<a href="index.html">Volver</a>';
    }
} else {
    // Si no es POST, se puede redirigir o mostrar error
    /* IA: [Manejo de acceso directo por URL (GET)] → Solución manual: [Se agrega respuesta de Error: Método no permitido para respetar el stateless HTTP] */
    echo "<h3>Error: Método no permitido. Use el formulario.</h3>";
}
?>
