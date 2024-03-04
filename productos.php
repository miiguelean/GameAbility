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

// Consulta SQL para obtener las marcas
$sql_marcas = "SELECT id, nombre FROM marcas";
$result_marcas = $conn->query($sql_marcas);

// Consulta SQL para obtener las categorías
$sql_categorias = "SELECT id, nombre FROM categorias";
$result_categorias = $conn->query($sql_categorias);
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>GameAbility - Tienda de Productos Gamers Inclusivos</title>
  <link rel="stylesheet" href="css/productos.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous" />
  <script src="https://kit.fontawesome.com/cc355c966a.js" crossorigin="anonymous"></script>
</head>

<body>
  <header>
    <a href="index.php" class="logo-name">
      <h1>GameAbility</h1>
    </a>
    <!-- <img src="img/GameAbility.png" width="250" alt="Logo de GameAbility"> -->
    <nav>
      <ul>
        <li><a href="#productos">Productos</a></li>
        <li><a href="#comunidad">Comunidad</a></li>
        <li><a href="#juegos">Juegos Accesibles</a></li>
        <li><a href="#contacto">Contacto</a></li>
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

  <section id="productos">
    <aside id="filtro">
      <h2>Filtrar por:</h2>
      <form action="#" method="GET">
        <label for="marca">Marca:</label>
        <select id="marca" name="marca">
          <option value="todas">Todas</option>
          <?php while ($row = $result_marcas->fetch_assoc()) { ?>
            <option value="<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></option>
          <?php } ?>
        </select><br><br>
        <label for="categoria">Categoría:</label>
        <select id="categoria" name="categoria">
          <option value="todas">Todas</option>
          <?php while ($row = $result_categorias->fetch_assoc()) { ?>
            <option value="<?php echo $row['id']; ?>"><?php echo $row['nombre']; ?></option>
          <?php } ?>
        </select><br><br>
        <label for="precio">Precio:</label>
        <select name="precio" id="precio">
          <option value="todas">Todas</option>
          <option value="precio1">Hasta $25</option>
          <option value="precio2">$25 a $50</option>
          <option value="precio3">$50 a $100</option>
          <option value="precio4">$100 y Mas</option>
        </select>
        <input type="submit" value="Filtrar">
      </form>
    </aside>
    <div id="listado-productos">
      <?php include 'Read.php'; ?>
    </div>
  </section>


  <footer>
    <p>&copy; 2024 GameAbility - Todos los derechos reservados</p>
  </footer>

  <script src="js/script.js"></script>
</body>

</html>