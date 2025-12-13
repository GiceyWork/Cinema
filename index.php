<?php
require("functions/connect.php");
require("functions/all_genres.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/3.0.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="scripts/javascript.js"></script>
    <script src="scripts/bootstrap.js"></script>
</head>
<body>
<header class="block-search d-flex gap-2 justify-content-left align-items-center">
            <input class="search-input" type="text">
            <button class="search-button" type="button"><i class="fi fi-rr-search"></i></button>
        </header>
        
        <main>
            <aside class="block-filter">
                <?php
                foreach($genres as $genre){
                    ?>
                    <p class="genre-text"><?= $genre['title'] ?></div>
                    <?php
                }
                ?>
            </aside>
            <section class="block-films">
                
            </section>
        </main>
    <footer>

    </footer>
</body>
</html>