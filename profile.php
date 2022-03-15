<?php
require 'vendor/connect.php';
session_start();
if (!$_SESSION['user']) {
    header('Location: /');
}
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Авторизация и регистрация</title>
    <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
<!-- Профиль -->

<form>
    <h2 style="margin: 10px 0;"><?= $_SESSION['user']['full_name'] ?></h2>
    <a href="#"><?= $_SESSION['user']['email'] ?></a>
    <a href="vendor/logout.php" class="logout">Выход</a>
</form>

<table>
    <div>Наименование <br>товара</br></div>
    <tr>
        <th>ID</th>
        <th>ID_Категория</th>
        <th>Наименование</th>
        <th>Вес</th>
        <th>Цена</th>
    </tr>
    <?php
    $item= mysqli_query($connect, "SELECT * FROM `item`");
    $item = mysqli_fetch_all($item);
    foreach ($item as $items)
    ?>
    <tr>
        <td><?= $items[0] ?></td>
        <td><?= $items[1] ?></td>
        <td><?= $items[2] ?></td>
        <td><?= $items[3] ?></td>
        <td><?= $items[4] ?></td>
        <td><a style="color: red;" href="delete.php?id=<?= $items[0] ?>">Удалить</a></td></tr>
</table>
<div>Добавить <br>наименование</br></div>
<form action="create.php" method="post">
    <p>Номер категории</p>
    <input type="number" name="id_category">
    <p>Имя</p>
    <input type="text" name="name">
    <p>Вес</p>
    <input type="number" name="weight">
    <p>Цена</p>
    <input type="number" name="price">
    <br> <br>
    <button type="submit">Добавить в базу
</form>
</body>
</html>