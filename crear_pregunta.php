<?php
session_start();

if (!isset($_SESSION['id_usuario'])) {
    die("Debes iniciar sesión para poder hacer una pregunta.");
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gameability";
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Obtener los datos del formulario
$titulo = $_POST['titulo'];
$contenido = $_POST['contenido'];
$id_usuario = $_POST['id_usuario'];

// Validar los datos (puedes agregar más validaciones según tus necesidades)
if (empty($titulo) || empty($contenido)) {
    die("Por favor, completa todos los campos.");
}

// Insertar la pregunta en la base de datos
$sql = "INSERT INTO preguntas (titulo, contenido, id_usuario, fecha) VALUES ('$titulo', '$contenido', $id_usuario, NOW())";

if ($conn->query($sql) === TRUE) {
    header("Location: foro_discusion.php");
    exit();
} else {
    echo "Error al crear la pregunta: " . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>
