<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<meta name="robots" content="noindex">
	<title>MAGAM manager - Aide</title>
	<link rel="icon" type="image/png" href="images/favicon.png" />
</head>
<body>
	
	<?php
	$pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
	$bdd = new PDO('mysql:host=localhost;dbname=mfa', 'root', '', $pdo_options);
	
	session_start();
	$_SESSION['page'] = "aide";
	include "functions.php";
	include "menu.php";
	?>
	
	<?php 
		include "aide.operations.php";
	?>
	
	<fieldset>
		<legend> A propos </legend>
	
		<strong>MAGAM</strong> (<i>Multi-Aspect Generic Adaptation Model</i>) est un modèle permettant la recommandation d'activités à des utilisateurs. <br/>
		Pour en savoir plus, rendez-vous ici (ajouter lien vers article ORPHEE lorsqu'il sera publié). <br/>
		<br/>
		<strong> MAGAM manager </strong> est une application permettant de gérer des recommandations basées sur MAGAM. <br/>
		Pour cela vous devez : <br/>
		<ol>
			<li> Créer une base de données en lui donnant un nom de six caractères. Bien conserver ce nom en mémoire. </li>
			<li> Définir vos <strong>Utilisateurs</strong>, <strong>Activités</strong> et les <strong>Propriétés</strong> s'appliquant à eux. <br/>
				Les activités et utilisateurs sont définis dans des groupes. Les propriétés sont regroupées par aspects. </li>
			<li> Définir les <strong>Valeurs</strong> qui lient les propriétés aux utilisateurs et aux activités. </li>
			<li> Choisir -pour chaque aspect- le <strong>Calcul</strong> qui exprimera au mieux les valeurs de recommandations. </li>
			<li> Choisir les <strong>Fusions</strong> qui feront émerger de votre système une recommandation unique pour chaque utilisateur. </li>
			<li> Choisir le mode de <strong>Sélection</strong> qui prendra l'activité la mieux recommandée d'après les valeurs de recommandation. </li>
			<li> Lire le <strong>Résultat</strong> donné par le système de recommandation et le communiquer à vos utilisateurs. </li>
		</ol>
		
	</fieldset>
	<br>
	
</body>
</html>
