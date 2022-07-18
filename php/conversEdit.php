<?php 

	include 'database.php';

	$idUser = $_POST['idUser'];
	$pseudo = $_POST['pseudo'];
	$image = $_POST['image'];
	$Message = $_POST['Message'];
	$dateDeNaissance = $_POST['dateMess'];

	$link->query("UPDATE message SET nom = '".$nom."',prenom = '".$prenom."',
	pseudo = '".$pseudo."',dateDeNaissance = '".$dateDeNaissance."',eMail = '".$eMail."',
	motDePasse = '".$motDePasse."' WHERE idUser = '".$idUser."'");


?>