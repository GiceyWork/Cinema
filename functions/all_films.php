<?php
require("connect.php");

$stmt = $pdo->query("SELECT * FROM film");
$films = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo(json_encode($films));
?>