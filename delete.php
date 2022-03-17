<?php
require_once 'auth/connect.php';
$id = $_GET['id'];
mysqli_query($connect, "DELETE FROM `item` WHERE `item`.`id` = '$id'");
header('Location: /');