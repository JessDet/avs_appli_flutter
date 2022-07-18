<?php

include 'database.php';

if(isset($_POST['eMail'])) {
    $eMail = $_POST['eMail'];



    $query = $link->query("SELECT * FROM user WHERE idUser = 8");
    // $query = $link->query("SELECT * FROM user WHERE eMail='$eMail'");
    $result = array();

    while ($rowData = $query->fetch_assoc()) {
        $result[] = $rowData;
    }


    echo json_encode($result);
}
