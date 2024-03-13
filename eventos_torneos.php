<?php

// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gameability";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Consulta SQL para obtener eventos
$sql_eventos = "SELECT * FROM eventos WHERE fecha > '2024-04-01'";
$result_eventos = $conn->query($sql_eventos);

// Consulta SQL para obtener torneos
$sql_torneos = "SELECT * FROM torneos WHERE fecha > '2024-04-01'";
$result_torneos = $conn->query($sql_torneos);

$conn->close();


?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GameAbility - Eventos y Torneos</title>
    <link rel="stylesheet" href="css/eventos_torneos.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/cc355c966a.js" crossorigin="anonymous"></script>
</head>

<body>
    <header>
        <a href="index.php" class="logo-name">
            <h1>GameAbility</h1>
        </a>
        <nav>
            <!-- Barra de navegación -->
            <ul>
                <li><a href="index.php">Inicio</a></li>
                <li><a href="productos.php">Productos</a></li>
                <li><a href="comunidad.php">Comunidad</a></li>
                <li><a href="juegos.php">Juegos Accesibles</a></li>
                <li><a href="contacto.php">Contacto</a></li>
                <?php
                session_start();
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

    <section id="eventos">
        <h2>Eventos</h2>
        <div class="grid">
            <?php
            while ($row = $result_eventos->fetch_assoc()) {
                echo "<div class='card'>";
                echo "<h3>{$row['titulo']}</h3>";
                echo "<p>Fecha: {$row['fecha']}</p>";
                echo "<p>{$row['descripcion']}</p>";
                echo "<a href='#' class='btn'>Registrarse</a>";
                echo "</div>";
            }
            ?>
        </div>
    </section>

    <section id="torneos">
        <h2>Torneos</h2>
        <div class="grid">
            <?php
            while ($row = $result_torneos->fetch_assoc()) {
                echo "<div class='card'>";
                echo "<h3>{$row['titulo']}</h3>";
                echo "<p>Fecha: {$row['fecha']}</p>";
                echo "<p>{$row['descripcion']}</p>";
                echo "<a href='#' class='btn'>Registrarse</a>";
                echo "</div>";
            }
            ?>
        </div>
    </section>


    <footer>
        <p>&copy; 2024 GameAbility - Todos los derechos reservados</p>
    </footer>

    <script src="js/script.js"></script>
</body>

</html>