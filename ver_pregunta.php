<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gameability";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Obtener el ID de la pregunta de la URL
if (isset($_GET['id'])) {
    $id_pregunta = $_GET['id'];

    // Consultar la pregunta y sus respuestas
    $sql_pregunta = "SELECT * FROM preguntas WHERE id = $id_pregunta";
    $result_pregunta = $conn->query($sql_pregunta);

    if ($result_pregunta->num_rows > 0) {
        $row_pregunta = $result_pregunta->fetch_assoc();
        $titulo_pregunta = $row_pregunta['titulo'];
        $contenido_pregunta = $row_pregunta['contenido'];
        $fecha = $row_pregunta['fecha'];
        $id_usuario_pregunta = $row_pregunta['id_usuario'];

        // Consultar el nombre del usuario que hizo la pregunta
        $sql_usuario_pregunta = "SELECT username FROM usuarios WHERE id = $id_usuario_pregunta";
        $result_usuario_pregunta = $conn->query($sql_usuario_pregunta);

        if ($result_usuario_pregunta->num_rows > 0) {
            $row_usuario_pregunta = $result_usuario_pregunta->fetch_assoc();
            $username_pregunta = $row_usuario_pregunta['username'];
        }

        // Consultar las respuestas asociadas a la pregunta
        $sql_respuestas = "SELECT respuestas.*, usuarios.username AS nombre_usuario 
                    FROM respuestas 
                    INNER JOIN usuarios ON respuestas.id_usuario = usuarios.id
                    WHERE id_pregunta = $id_pregunta";
        $result_respuestas = $conn->query($sql_respuestas);
    } else {
        echo "No se encontró la pregunta.";
    }
} else {
    echo "No se especificó una pregunta.";
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles de la Pregunta</title>
    <link rel="stylesheet" href="css/foro.css">
</head>

<body>
    <header>
        <h1>GameAbility</h1>
        <nav>
            <ul>
                <li><a href="foro_discusion.php">Volver al Foro</a></li>
                <?php
                if (isset($_SESSION['username'])) {
                    echo '<li class="dropdown">';
                    echo '<a href="#" class="dropbtn">' . $_SESSION['username'] . '</a>';
                    echo '<div class="dropdown-content">';
                    echo '<a href="logout.php">Cerrar sesión</a>';
                    echo '<a href="perfil.php">Perfil</a>';
                    echo '</div>';
                    echo '</li>';
                } else {
                    echo '<li><a href="login.php">Iniciar Sesión</a></li>';
                }
                ?>
            </ul>
        </nav>
    </header>

    <div class="pregunta">
        <h2><?php echo $titulo_pregunta; ?></h2>
        <p><?php echo $contenido_pregunta; ?></p>
        <p>Publicado por: <?php echo $username_pregunta; ?> el <?php echo $fecha; ?></p>
        <?php
        echo "<div class='responder'>";
        echo "<a href='responder_pregunta.php?id=" . $id_pregunta . "'>Responder a esta pregunta</a>";
        echo "</div>";
        ?>
    </div>

    <div class="respuestas">
        <h3>Respuestas:</h3>
        <?php
        if ($result_respuestas->num_rows > 0) {
            while ($row_respuesta = $result_respuestas->fetch_assoc()) {
                echo "<div class='respuesta'>";
                echo "<p>" . $row_respuesta['contenido'] . "</p>";
                echo "<p>Respuesta por " . $row_respuesta['nombre_usuario']."</p>";
                echo "</div>";
            }
        } else {
            echo "No hay respuestas para esta pregunta.";
        }
        ?>
    </div>

    <footer>
        <p>&copy; 2024 Foro de Discusión. Todos los derechos reservados.</p>
    </footer>
</body>

</html>