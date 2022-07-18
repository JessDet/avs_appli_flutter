<?php 

	include 'database.php';

	$Message = $_POST['Message'];
	$dateMess = $_POST['dateMess'];
	
	

	$link->query("INSERT INTO message('Message, dateMess')VALUES
	('".$Message."','".$dateMess."')");


