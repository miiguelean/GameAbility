<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insertar Producto</title>
    <link rel="stylesheet" href="css/create.css">
</head>
<body>
    <h2>Insertar Producto</h2>
    <form action="insertar_producto.php" method="POST">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br><br>
        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion" required></textarea><br><br>
        <label for="imagen">Imagen:</label>
        <input type="file" name="imagen" id="imagen" class="imagen">
        <label for="precio">Precio:</label>
        <input type="text" id="precio" name="precio" required><br><br>
        <label for="marca">Marca:</label>
        <select id="marca" name="marca" required>
            <option value="1">Logitech</option>
            <option value="2">Razer</option>
            <option value="3">PlayStation</option>
            <option value="4">Xbox</option>
            <option value="5">HyperX</option>
        </select><br><br>
        <select id="categoria" name="categoria" required>
            <option value="1">Mouse</option>
            <option value="2">Teclado Mecanico</option>
            <option value="3">Teclado Membrana</option>
            <option value="4">Audifonos</option>
            <option value="5">Controles Personalizados</option>
        </select><br><br>
        <input type="submit" value="Insertar Producto">
    </form>
</body>
</html>
