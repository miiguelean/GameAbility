<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $servername = "localhost";
    $username_db = "root";
    $password_db = "";
    $dbname = "gameability";

    // Crear conexión
    $conn = new mysqli($servername, $username_db, $password_db, $dbname);

    // Verificar conexión
    if ($conn->connect_error) {
        die("Error de conexión: " . $conn->connect_error);
    }

    $username = $_POST['username'];
    $pwd = $_POST['pwd'];
    $email = $_POST['email'];
    $fecha_nacimiento = $_POST['fecha_nacimiento'];

    $sql = "INSERT INTO usuarios (username, pwd, email, fecha_nacimiento) VALUES ('$username', '$pwd', '$email', '$fecha_nacimiento')";

    if ($conn->query($sql) === TRUE) {
        // Usuario registrado correctamente, iniciar sesión automáticamente
        session_start();
        $_SESSION['username'] = $username;
        header("Location: index.php");
        exit();
    } else {
        echo "Error al registrar el usuario: " . $conn->error;
    }

    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <div class="form-container">
        <h2>Registrarse</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <label for="username">Nombre de usuario:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="pwd">Contraseña:</label>
            <input type="password" id="pwd" name="pwd" required><br>
            <label for="email">Correo electrónico:</label>
            <input type="email" id="email" name="email" required><br>
            <label for="fecha_nacimiento">Fecha de nacimiento:</label>
            <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required><br>
            <input type="submit" value="Registrarse">
        </form>
        <p>¿Ya tienes una cuenta? <a href="login.php">Inicia sesion aquí</a></p>
    </div>
</body>

</html>