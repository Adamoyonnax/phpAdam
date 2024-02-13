<?php 
$bdd = new PDO('mysql:host=localhost;dbname=netflux_adam;charset=utf8', 'root', '');

if (isset($_POST["identifiant"])) {

$identifiant = $_POST["identifiant"];

$sqlCheck = "SELECT COUNT(*) AS count FROM utilisateur WHERE Identifiant = :identifiant";
$requeteCheck = $bdd->prepare($sqlCheck);
$requeteCheck->bindParam(":identifiant", $identifiant, PDO::PARAM_STR);
$requeteCheck->execute();
$resultatCheck = $requeteCheck->fetch(PDO::FETCH_ASSOC);

if ($resultatCheck['count'] > 0){
    echo "1";  
    die();
}
else {
    echo "0";  
    die();
}
}
?>