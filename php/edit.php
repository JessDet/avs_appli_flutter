<?php 

	include 'database.php';

	$idUser = $_POST['idUser'];
	$nom = $_POST['nom'];
	$prenom = $_POST['prenom'];
	$pseudo = $_POST['pseudo'];
	$dateDeNaissance = $_POST['dateDeNaissance'];
	$eMail = $_POST['eMail'];
	$motDePasse = $_POST['motDePasse'];

	$link->query("UPDATE user SET nom = '".$nom."',prenom = '".$prenom."',
	pseudo = '".$pseudo."',dateDeNaissance = '".$dateDeNaissance."',eMail = '".$eMail."',
	motDePasse = '".$motDePasse."' WHERE idUser = '".$idUser."'");


?>