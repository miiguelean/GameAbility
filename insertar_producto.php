<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gameability";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Obtener datos del formulario
@$nombre = $_POST['nombre'];
@$descripcion = $_POST['descripcion'];
@$imagen = $_POST['imagen'];
@$precio = $_POST['precio'];
@$categoria = $_POST['categoria'];
@$marca = $_POST['marca'];

// Consulta SQL para insertar un nuevo producto
$sql = "INSERT INTO productos (nombre, descripcion, imagen, precio, marca_id, categoria_id) VALUES ('$nombre', '$descripcion', '$imagen', '$precio', '$marca', '$categoria')";

if (mysqli_query($conn, $sql)) {
    echo '<script>alert("Producto insertado correctamente"); window.location.href = "create.php";</script>';
    exit();
} else {
    echo "Error al insertar el producto: " . mysqli_error($conn);
}


// Cerrar conexión
mysqli_close($conn);
?>