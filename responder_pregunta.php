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

if (!isset($_SESSION['id_usuario'])) {
    header("Location: login.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_pregunta = $_POST['id_pregunta'];
    $contenido = $_POST['contenido'];
    $id_usuario = $_SESSION['id_usuario'];

    $sql = "INSERT INTO respuestas (id_pregunta, id_usuario, contenido, fecha) VALUES ('$id_pregunta', '$id_usuario', '$contenido', NOW())";

    if ($conn->query($sql) === TRUE) {
        // Mostrar ventana emergente
        echo "<script>alert('Tu respuesta ha sido registrada.');</script>";
        // Redirigir a la página de la pregunta
        echo "<script>window.location.href = 'ver_pregunta.php?id=$id_pregunta';</script>";
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responder a una pregunta</title>
    <link rel="stylesheet" href="css/foro.css">
</head>

<body style="display: flex; min-height: 100vh; flex-direction: column;">
    <header>
        <h1>GameAbility</h1>
        <nav>
            <ul>
                <li><a href="index.php">Inicio</a></li>
                <li><a href="#">Quiero preguntar!</a></li>
                <?php
                if (isset($_SESSION['id_usuario'])) {
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

    <div class="form-container">
        <h2>Responder a una pregunta</h2>
        <?php
        // Obtener el ID de la pregunta de la URL
        if (isset($_GET['id'])) {
            $id_pregunta = $_GET['id'];

            // Consultar la pregunta
            $sql_pregunta = "SELECT * FROM preguntas WHERE id = $id_pregunta";
            $result_pregunta = $conn->query($sql_pregunta);

            if ($result_pregunta->num_rows > 0) {
                $row_pregunta = $result_pregunta->fetch_assoc();
                $titulo_pregunta = $row_pregunta['titulo'];
                $contenido_pregunta = $row_pregunta['contenido'];

                // Mostrar el título de la pregunta
                echo "<p class='mostrar-pregunta-Enrespuesta'>$titulo_pregunta</p>";
                echo "<p class='mostrar-contenido-Enrespuesta'>$contenido_pregunta</p>";
            } else {
                echo "No se encontró la pregunta.";
            }
        } else {
            echo "No se especificó una pregunta.";
        }
        ?>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <input type="hidden" name="id_pregunta" value="<?php echo $_GET['id']; ?>">
            <label for="contenido">Respuesta:</label>
            <textarea id="contenido" name="contenido" rows="4" required></textarea>
            <button type="submit">Responder</button>
        </form>
    </div>

    <footer style="margin-top: auto;">
        <p>&copy; 2024 Foro de Discusión. Todos los derechos reservados.</p>
    </footer>
</body>

</html>