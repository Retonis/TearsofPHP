<?php
$connect = mysqli_connect ('localhost', 'root', '', 'internet_market');
if (!$connect) {
    die('Error connect to database');
}