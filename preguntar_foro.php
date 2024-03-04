<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foro de Discusión - Preguntas</title>
    <link rel="stylesheet" href="css/foro.css">
</head>

<body>
    <header>
        <h1>GameAbility</h1>
        <nav>
            <ul>
                <li><a href="#">Quiero preguntar</a></li>
                <li><a href="foro_discusion.php">Ver preguntas</a></li>
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
                    echo '<li><a href="login.php">Iniciar Sesion</a></li>';
                }
                ?>
            </ul>
        </nav>
    </header>
    <h2>Crear Pregunta</h2>
    <form action="crear_pregunta.php" method="post">
        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" required>

        <label for="contenido">Contenido:</label>
        <textarea id="contenido" name="contenido" rows="4" required></textarea>

        <input type="hidden" id="id_usuario" name="id_usuario" value="<?php echo $_SESSION['id_usuario']; ?>">

        <button type="submit">Crear Pregunta</button>
    </form>

    <footer class="footer-down">
        <p>&copy; 2024 Foro de Discusión. Todos los derechos reservados.</p>
    </footer>
</body>

</html>