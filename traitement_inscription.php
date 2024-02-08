
<?php 

// Recupere les données dans "inscription.php" 
$identifiant = $_POST["identifiant"];
$mdp = $_POST["mdp"];
$mdpc = $_POST["mdpc"];
$date_N = $_POST["date"];
$adresse = $_POST["mail"];
$genre = $_POST["genre"];

// Verifie si la saisie dans MDP et MDP Confirmation sont les memes. 
if ($mdp != $mdpc) {
    header("Location: Inscription.php?MdPError");
    exit();
};

$bdd = new PDO( 
    'mysql:host=localhost;dbname=utilisateur;charset=utf8', 
    'root',
    ''
);

/* var_dump($identifiant);
var_dump($mdp);
var_dump($date_N);
var_dump($adresse);
var_dump($genre); */

$sqlVerif = "SELECT COUNT(*) AS count FROM utilisateur WHERE Identifiant = :identifiant";
$requeteVerif = $bdd ->prepare($sqlVerif);
$requeteVerif->bindParam(":identifiant", $identifiant, PDO::PARAM_STR);
$requeteVerif->execute();
$resultatVerif = $requeteVerif->fetch();

if ($resultatVerif['count'] > 0) {
    header("Location: Inscription.php?IdentifiantDejaExistant");
    exit();
};


$sql = "INSERT INTO utilisateur(Identifiant, Mdp, Date_Naissance, Adresse, Genre) VALUES (:identifiant,:mdp,:date_N, :adresse, :genre);";
$requete = $bdd ->prepare($sql); 
$requete ->bindParam(":identifiant", $identifiant, PDO::PARAM_STR); 
$requete ->bindParam(":mdp", $mdp, PDO::PARAM_STR);
$requete ->bindParam(":date_N", $date_N, PDO::PARAM_STR);
$requete ->bindParam(":adresse", $adresse, PDO::PARAM_STR);
$requete ->bindParam(":genre", $genre, PDO::PARAM_STR);
$requete ->execute();

header("Location: Authentification.php");
?>

