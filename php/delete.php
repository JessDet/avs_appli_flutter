<?php 

	include 'database.php';

	$idUser = $_POST['idUser'];

	$link->query("DELETE FROM user WHERE idUser = '".$idUser."'");