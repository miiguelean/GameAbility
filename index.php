<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>GameAbility - Tienda de Productos Gamers Inclusivos</title>
  <link rel="stylesheet" href="css/styles.css" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" crossorigin="anonymous" />
  <script src="https://kit.fontawesome.com/cc355c966a.js" crossorigin="anonymous"></script>
</head>

<body>
  <header>
    <h1>GameAbility</h1>
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

  <section id="quienes-somos">
    <div class="card-quienes-somos">
      <div class="container">
        <div class="texto">
          <h2>¿Quiénes Somos?</h2>
          <p>
            Somos GameAbility, una tienda en línea comprometida con la
            accesibilidad en el mundo de los videojuegos. Nuestro objetivo es
            proporcionar productos y recursos inclusivos para gamers de todas
            las habilidades y capacidades.
          </p>
          <p>
            Con una amplia selección de productos diseñados pensando en la
            comodidad, la accesibilidad y la diversión, queremos asegurarnos
            de que todos los jugadores puedan disfrutar plenamente de su
            experiencia de juego sin barreras.
          </p>
        </div>
        <div class="imagen">
          <img src="img/quienes-somos.jpg" alt="Imagen Quiénes Somos" />
        </div>
      </div>
    </div>
  </section>

  <section id="productos">
    <!-- <h2>Productos</h2> -->
    <div class="destacados">
      <div class="producto">
        <img src="img/Control-Access-PS5.png" alt="Control Access de Play Station 5" />
        <h3>Control Access PS5</h3>
        <p>
          Un kit de control de PlayStation®5 altamente personalizable diseñado para hacer que los juegos sean más accesibles.
        </p>
        <a href="#" class="btn">Comprar ahora</a>
      </div>
      <div class="producto">
        <img src="img/logitech-g435.png" alt="Audifonos Inalambricos Logitech G435" />
        <h3>Logitech G435</h3>
        <p>
          Disfruta de juegos y música con confort ligero y sonido potente y
          limpio. Dos micrófonos con formación de haces reducen el ruido de
          fondo.
        </p>
        <a href="#" class="btn">Comprar ahora</a>
      </div>
    </div>
    <a href="productos.php?marca=todas&categoria=todas&precio=todas" class="btn-ver-mas">Ver más productos</a>
  </section>

  <section id="comunidad">
    <h2>Nuestra comunidad</h2>
    <div class="cards">
      <div class="foro">
        <img src="img/foro-discusion.jpeg" alt="Grupo de gamers platicando sobre un Videojuego" />
        <h3>Foro de Discusión</h3>
        <p>
          Únete a nuestra comunidad en línea y participa en discusiones sobre
          videojuegos y accesibilidad.
        </p>
        <a href="foro_discusion.php" class="btn">Ir al Foro</a>
      </div>
      <div class="eventos">
        <img src="img/eventos-torneos.jpg" alt="Grupo de gamers en un evento jugando videojuegos" />
        <h3>Eventos y Torneos</h3>
        <p>
          Participa en nuestros eventos y torneos inclusivos diseñados para
          gamers con discapacidad.
        </p>
        <a href="#" class="btn">Ver Próximos Eventos</a>
      </div>
      <div class="historias">
        <img src="img/historias.jpg" alt="Dos gamers dandose un saludo con el puño" />
        <h3>Historias Inspiradoras</h3>
        <p>
          Lee las historias y testimonios de gamers con discapacidad que han
          superado desafíos y logrado éxito.
        </p>
        <a href="#" class="btn">Leer Más Historias</a>
      </div>
    </div>
  </section>

  <section id="juegos">
    <h2>Juegos Accesibles</h2>
    <p>
      Descubre juegos con características de accesibilidad para todos los
      gamers.
    </p>
    <div class="destacados">
      <div class="producto">
        <img src="img/A-Blind-Legend.png" alt="Videojuego A Blind Legend" />
        <h3>A Blind Legend</h3>
        <p>
          Es un proyecto de colaboración de un juego de acción y aventura solo
          para audio para teléfonos móviles. Se basa en una tecnología de
          sonido binaural.
        </p>
        <a href="#" class="btn">Comprar ahora</a>
      </div>
      <div class="producto">
        <img src="img/Talking-Word-Puzzles.jpg" alt="Videojuego Talking Word Puzzles" />
        <h3>Talking Word Puzzles</h3>
        <p>
          Este juego de computadora permite al usuario crear o resolver
          crucigramas y palabras ocultas en letra grande y con respuesta de
          voz de alta calidad.
        </p>
        <a href="#" class="btn">Comprar ahora</a>
      </div>
    </div>
    <a href="#" class="btn-ver-mas">Ver más productos</a>
  </section>

  <section id="contacto">
    <h2>Contacto</h2>
    <div class="container">
      <div class="formulario card">
        <h3>¡Contáctanos!</h3>
        <form action="#" method="POST">
          <label for="nombre">Nombre:</label>
          <input type="text" id="nombre" name="nombre" required />
          <label for="email">Correo electrónico:</label>
          <input type="email" id="email" name="email" required />
          <label for="mensaje">Mensaje:</label>
          <textarea id="mensaje" name="mensaje" required></textarea>
          <button type="submit">Enviar mensaje</button>
        </form>
      </div>
      <div class="informacion-contacto card">
        <h3>Información de contacto</h3>
        <p><strong>Correo electrónico:</strong> contacto@gameability.com</p>
        <p><strong>Teléfono:</strong> +52 8781234567</p>
        <p>
          <strong>Dirección:</strong> Calle Russ St, Piedras Negras, Mexico
        </p>
        <div class="redes-sociales">
          <h3>Síguenos en redes sociales</h3>
          <a href="#" target="_blank" class="icon-facebook"><i class="fa-brands fa-square-facebook"></i></a>
          <a href="#" target="_blank" class="icon-twitter"><i class="fa-brands fa-twitter"></i></a>
          <a href="#" target="_blank" class="icon-instagram"><i class="fa-brands fa-instagram"></i></a>
        </div>
      </div>
      <div class="mapa card">
        <h3>Ubicación</h3>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3182.685514421416!2d-122.40525018469964!3d37.778415079759464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80858083e4f3a5e7%3A0xf5424e10b77adfc5!2sGolden%20Gate%20Bridge!5e0!3m2!1sen!2sus!4v1630478675299!5m2!1sen!2sus" width="400" height="300" style="border: 0" allowfullscreen="" loading="lazy"></iframe>
      </div>
    </div>
  </section>

  <footer>
    <p>&copy; 2024 GameAbility - Todos los derechos reservados</p>
  </footer>

  <script src="js/script.js"></script>
</body>

</html>