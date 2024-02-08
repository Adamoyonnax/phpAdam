
<?php 

$identifiant = $_POST["identifiant"];
$mdp = $_POST["mdp"];

$bdd = new PDO( 
    'mysql:host=localhost;dbname=utilisateur;charset=utf8', 
    'root',
    ''
);

$sql = "SELECT * FROM utilisateur WHERE Identifiant = :identifiant AND Mdp = :mdp";

$requete = $bdd->prepare($sql);
$requete ->bindParam(":identifiant", $identifiant, PDO::PARAM_STR); 
$requete ->bindParam(":mdp", $mdp, PDO::PARAM_STR);
$requete->execute();
$resultat = $requete->fetch();

if ($resultat) {
    header("Location: Site.php");
} 
else {
    header("Location: Authentification.php?erreur=Incorrect");
}
?>