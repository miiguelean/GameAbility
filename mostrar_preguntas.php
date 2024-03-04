<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gameability";
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Consulta SQL para obtener todas las preguntas ordenadas por fecha
/* $sql = "SELECT * FROM preguntas ORDER BY fecha DESC"; */
$sql = "SELECT preguntas.*, usuarios.username as nombre_usuario 
        FROM preguntas 
        INNER JOIN usuarios ON preguntas.id_usuario = usuarios.id 
        ORDER BY preguntas.fecha DESC";
$result = $conn->query($sql);

// Mostrar las preguntas
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<div class='pregunta'>";
        echo "<h3>" . $row['titulo'] . "</h3>";
        echo "<p>" . $row['contenido'] . "</p>";
        echo "<p>Publicado por: " . $row['nombre_usuario'] . " el " . $row['fecha'] . "</p>";
        echo "</div>";
    }
} else {
    echo "No se encontraron preguntas.";
}

// Cerrar la conexión
$conn->close();
?>
