<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $identifiant = $_POST["identifiant"];
    $mdp = $_POST["mdp"];
    $mdpc = $_POST["mdpc"];
    $date_N = $_POST["date"];
    $adresse = $_POST["mail"];
    $genre = $_POST["genre"];


    if ($mdp != $mdpc) {
        header("Location: Inscription.php?MdPError");
        exit();
    }


    $hashedPassword = password_hash($mdp, PASSWORD_DEFAULT);


    $bdd = new PDO('mysql:host=localhost;dbname=netflux;charset=utf8', 'root', '');

    $sqlCheck = "SELECT COUNT(*) AS count FROM utilisateur WHERE Identifiant = :identifiant";
    $requeteCheck = $bdd->prepare($sqlCheck);
    $requeteCheck->bindParam(":identifiant", $identifiant, PDO::PARAM_STR);
    $requeteCheck->execute();
    $resultatCheck = $requeteCheck->fetch(PDO::FETCH_ASSOC);

    if ($resultatCheck['count'] > 0) {

        header("Location: inscription.php?dejaexistant");
    } 
    else {
        $sqlInsert = "INSERT INTO utilisateur(Identifiant, Mdp, Date_Naissance, Adresse, Genre) VALUES (:identifiant, :mdp, :date_N, :adresse, :genre)";
        $requeteInsert = $bdd->prepare($sqlInsert);
        $requeteInsert->bindParam(":identifiant", $identifiant, PDO::PARAM_STR);
        $requeteInsert->bindParam(":mdp", $hashedPassword, PDO::PARAM_STR);
        $requeteInsert->bindParam(":date_N", $date_N, PDO::PARAM_STR);
        $requeteInsert->bindParam(":adresse", $adresse, PDO::PARAM_STR);
        $requeteInsert->bindParam(":genre", $genre, PDO::PARAM_STR);

        try {
            $requeteInsert->execute();
            echo "Inscription réussie !";
            header("Location: Authentification.php");
        } catch (PDOException $e) {
            echo "Erreur d'inscription : " . $e->getMessage();
        }
    }
}
?>













