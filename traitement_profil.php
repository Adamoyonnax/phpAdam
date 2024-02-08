<?php
$bd = new PDO("mysql:host=127.0.0.1;dbname=netflux;charset=utf8", "root", "");

if (isset($_GET["id"])) {
    $id = $_GET["id"];
    $sql = "SELECT * FROM video WHERE IdVideo = :id";
    $requete = $bd->prepare($sql);
    $requete->bindParam(":id", $id, PDO::PARAM_INT);
    $requete->execute();
    $filmInfo = $requete->fetch(PDO::FETCH_ASSOC);

    // Retournez les informations du film au format JSON
    header('Content-Type: application/json');
    echo json_encode($filmInfo);
} else {
    echo "ID non fourni";
}
?>
