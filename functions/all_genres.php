<?php
require("connect.php");

$stmt = $pdo->query("SELECT * FROM genre");
$genres = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>