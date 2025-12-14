<?php
require("connect.php");

$film_id = isset($_POST['film_id']) ? (int)$_POST['film_id'] : 0;

$stmt = $pdo->query("SELECT * FROM `seans` WHERE `film_id`=$film_id;");
$seanses = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo(json_encode($seanses));
?>