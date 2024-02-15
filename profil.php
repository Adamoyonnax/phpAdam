
<?php
session_start();
if(empty($_SESSION["identifiant"])){
    header("Location: authentification.php?ErrorSession");
    session_destroy();
    exit();
}

$bd = new PDO("mysql:host=127.0.0.1;dbname=netflux_adam;charset=utf8", "root", "");


if(isset($_GET["genre"])) {

    $genre = $_GET["genre"];
    $sqlGenre = "SELECT * FROM video JOIN appartient ON video.IdVideo = appartient.FkVideo JOIN genre ON genre.IdGenre = appartient.FkGenre WHERE Libelle = :genre;";
    $requeteSelect = $bd->prepare($sqlGenre);
    $requeteSelect ->bindParam(":genre", $genre, PDO::PARAM_STR); 
    $requeteSelect->execute();
    $data = $requeteSelect->fetchAll();
}
else{
    $sql = "SELECT * FROM Video LIMIT 3;";
    $requete = $bd->prepare($sql);
    $requete->execute();
    $data = $requete->fetchAll();
}

if(isset($_GET['deconnecter'])) {
    session_destroy();
    header("Location: authentification.php");
    exit(); 
}

?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Netflux</title>
        <link rel="stylesheet" href="style_netflux.css">
    </head>

    <body>
        <form action="profil.php" method="get">
            <div class="bannière">


                <header>


                    <nav>

                        <ul>
                            <li id="accueil"><a href="profil.php">Accueil</a></li>
                            <li><a href="profil.php">Séries</a></li>
                            <li id="film"><a href="profil.php">Films</a></li>
                            <li><a href="profil.php">Ma liste</a></li>
                            <li id="liste">
                                <select name="genre" id="genre">
                                <option value="Action">Action</option>
                                <option value="Aventure">Aventure</option>
                                <option value="Super-héros">Super-héros</option>
                                <option value="Fantasy">Fantasy</option>
                                <option value="Comédie">Comédie</option>
                                <option value="Science-fiction">Science-Fiction</option>
                                <option value="Policier">Policier</option>
                                <option value="Drame">Drame</option>
                                <option value="Thriller">Thriller</option>
                                </select>
                                <input type="submit" value="valider">
                            </li>
                            <li><button type="submit" name="deconnecter" value="deconnecter">Déconnecter</button></li>

                        </ul>
                    </nav>
                </header>
            </div>
        

            <div>

                <h2>Tendances actuelles</h2>

                <ul class="list">           
                <?php 
                    foreach($data as $element){           
                        $img = "./images/".$element["Image"].".jpg";
                        echo '<li id="video' . $element["IdVideo"] . '" >';
                        echo '<img  id="image'. $element["IdVideo"].'" class="video" src="' . $img . '" alt="">';
                        echo '<div class="text-under-image">';
                        echo '<p>' . $element["Titre"] . "</p>";
                        echo '<p> Date de Sortie : ' . $element["Date_Sortie"] . "</p>";
                        echo '<p> Durée : ' . $element["Duree"] . "</p>";
                        echo '</div>';
                        echo '</li>';
                    };       
                ?></ul>
            </div>
        </form>
        <script src="image.js"></script>
    </body>
</html>

