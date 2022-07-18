<?php 

	include 'database.php';

	$nom = $_POST['nom'];
	$prenom = $_POST['prenom'];
	$pseudo = $_POST['pseudo'];
	$dateDeNaissance = $_POST['dateDeNaissance'];
	$eMail = $_POST['eMail'];
	$motDePasse = $_POST['motDePasse'];

	$link->query("INSERT INTO user(nom,prenom,pseudo,dateDeNaissance,eMail,motDePasse)VALUES
	('".$nom."','".$prenom."','".$pseudo."','".$dateDeNaissance."','".$eMail."','".$motDePasse."')");













































	// include 'database.php';

	// $fistname = $_POST['fistname'];
	// $lastname = $_POST['lastname'];
	// $phone = $_POST['phone'];
	// $address = $_POST['address'];

	// $link->query("INSERT INTO person(fistname,lastname,phone,address)VALUES('".$fistname."','".$lastname."','".$phone."','".$address."')");

