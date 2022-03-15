<?php
require_once 'vendor/connect.php';

$id= $_POST['id'];
$id_category = $_POST['id_category'];
$name = $_POST['name'];
$weight = $_POST['weight'];
$price = $_POST['price'];

mysqli_query($connect,"INSERT INTO `item` (`id`, `id_category`, `name`, `weight`, `price`) VALUES (NULL, '$id_category', '$name', '$weight', '$price')");

header('Location: /');