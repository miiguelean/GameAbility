<?php
// Datos de conexión a la base de datos
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

// Obtener valores de los filtros
@$marca = $_GET['marca'];
@$categoria = $_GET['categoria'];
@$precio = $_GET['precio'];

// Consulta SQL base
$sql = "SELECT * FROM productos";

// Agregar condiciones según los filtros seleccionados
if ($marca != 'todas') {
    $sql .= " WHERE marca_id = '$marca'";
}
if ($categoria != 'todas') {
    if (strpos($sql, 'WHERE') !== false) {
        $sql .= " AND categoria_id = '$categoria'";
    } else {
        $sql .= " WHERE categoria_id = '$categoria'";
    }
}
if ($precio != 'todas') {
    if (strpos($sql, 'WHERE') !== false) {
        if ($precio == 'precio1') {
            $sql .= " AND precio BETWEEN 0 AND 25";
        } elseif ($precio == 'precio2') {
            $sql .= " AND precio BETWEEN 26 AND 50";
        } elseif ($precio == 'precio3') {
            $sql .= " AND precio BETWEEN 51 AND 100";
        } elseif ($precio == 'precio4') {
            $sql .= " AND precio > 101";
        }
    } else {
        if ($precio == 'precio1') {
            $sql .= " WHERE precio BETWEEN 0 AND 25";
        } elseif ($precio == 'precio2') {
            $sql .= " WHERE precio BETWEEN 26 AND 50";
        } elseif ($precio == 'precio3') {
            $sql .= " WHERE precio BETWEEN 51 AND 100";
        } elseif ($precio == 'precio4') {
            $sql .= " WHERE precio > 101";
        }
    }
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Mostrar cada producto en un div con la clase "producto"
    while($row = $result->fetch_assoc()) {
        echo '<div class="producto">';
        echo '<img src="img/' . $row["imagen"] . '" alt="' . $row["nombre"] . '">';
        echo '<h3>' . $row["nombre"] . '</h3>';
        echo '<p>' . $row["descripcion"] . '</p>';
        echo '<p> $' . $row["precio"] . ' USD</p>';
        echo '<button>Ver detalles</button>';
        echo '</div>';
    }
} else {
    echo "No se encontraron productos.";
}

// Cerrar conexión
$conn->close();
?>
