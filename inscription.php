<!doctype html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Inscription</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<div class="cadre cadre2 police">
			<div class="cadrebody police">
				<h1>Inscription</h1>

				<form action="traitement_ajax.php" method="post">
					<button type= "button" id="verifier">Verifier</button>	
				</form>
				<form action="traitement_inscription.php" method="post">
					<label for="identifiant">Identifiant : </label> 
					<input type="text" name="identifiant" id="identifiant" required />	
					<br/>
					
					<label for="mdp">Mot de passe :</label>
					<input type="password" name="mdp" id="mdp" minlength="8" required />

					<br/>

					<label for="mdpc">Validation du mot de passe :</label>
					<input type="password" name="mdpc" id="mdpc" minlength="8" required />

					<br/>

					<label for="date">Date de naissance</label>
					<input type="date" name="date" id="date" value="2023-09-01" min="1950-01-01" max="2023-09-01" required />

					<br/>

					<label for="mail">Adresse </label>
					<input type="email" name="mail" id="mail" required />

					<br/>
				
					<label for="femme">Femme</label>
					<input type="radio" id="femme" name="genre" value="femme" required checked />
					<label for="Homme">Homme</label>
					<input type="radio" id="Homme" name="genre" value="Homme" />
					<label for="Autres">Autres</label>
					<input type="radio" id="Autres" name="genre" value="Autres" />
					
					<br/>
					
					<label for="Utilisation">J'accepte les conditions d'utilisation de ce site</label>
					<input type="checkbox" id="Utilisation" name="Utilisation" required />
					
					
					<br/>
					
					<label for="info">J'accepte de recevoir des mails d'informations</label>
					<input type="checkbox" id="info" name="info" />
					

					<br/>
					
					<input type="submit" value="Valider">
				</form>
			</div>

			<footer>
				<p><a href="authentification.php">Retour à la page de connexion.</a></p>
			</footer>
		</div>
		<script type="text/javascript" src="monscript.js"></script>
	</body>
</html>
