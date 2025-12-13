<?php
$dsn = 'mysql:host=MariaDB-11.8:3306;dbname=Cinema;charset=utf8mb4';
try {
    $pdo = new PDO($dsn, 'root', '');
    // Установка режима ошибок
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Ошибка подключения: " . $e->getMessage());
}
?>