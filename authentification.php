<!doctype html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Site Internet</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		
		<div class="cadre cadre2 police">
				<div class="cadrebody police">
				
					<h1>Authentification</h1>

					<form action="traitement_authentification.php" method="post">
    					<label for="identifiant">Identifiant : </label>
    					<input type="text" name="identifiant" id="identifiant" required/>
					
						<br/>
					
						<label for="mdp">Mot de passe : </label>
    					<input type="password" name="mdp" id="mdp" required/>
					
						<br/>
					<input type="submit" value="Valider">
					<input type="reset" value="Effacer">
					</form>
				</div>

			<footer>
				<p>Pas de compte ? <a href="inscription.php">Cliquez ici.</a></p>
			</footer>
		</div>
	</body>
</html>
