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
        <a href="index.php" class="logo-name">
            <h1>GameAbility</h1>
        </a>
        <nav>
            <ul>
                <li><a href="preguntar_foro.php">Quiero preguntar!</a></li>
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
    <main>
        <section>
            <h2>Preguntas</h2>
            <div class="preguntas">
                <?php
                include 'mostrar_preguntas.php';
                ?>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Foro de Discusión. Todos los derechos reservados.</p>
    </footer>
</body>

</html>