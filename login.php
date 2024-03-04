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

    $sql = "SELECT * FROM usuarios WHERE username='$username' AND pwd='$pwd'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        session_start();
        $_SESSION['username'] = $username;
    
        // Obtener el ID del usuario
        $row = $result->fetch_assoc();
        $_SESSION['id_usuario'] = $row['id']; // Suponiendo que el ID del usuario está en una columna llamada 'id'
        
        header("Location: index.php");
    } else {
        $error = "Usuario o contraseña incorrectos";
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
    <title>Iniciar sesión</title>
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <div class="form-container">
        <h2>Iniciar sesión</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <label for="username">Nombre de usuario:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="pwd">Contraseña:</label>
            <input type="password" id="pwd" name="pwd" required><br><br>
            <input type="submit" value="Iniciar sesión">
        </form>
        <p>¿No tienes una cuenta? <a href="signin.php">Regístrate aquí</a></p>
        <?php if (isset($error)) echo $error; ?>
    </div>
</body>
</html>