<?php 

	
include 'database.php';

if(isset($_POST['eMail'])) {
    $eMail = $_POST['eMail'];
   

	$query = $link->query("SELECT * FROM user WHERE eMail='$eMail'");
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);

}








































// include 'database.php';

// 	$query = $link->query('SELECT * FROM person');
// 	$result = array();

// 	while ($rowdata = $query->fetch_assoc()) {
// 		$result[] = $rowdata;
// 	}
// 	echo json_encode($result);