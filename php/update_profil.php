<?php

include 'database.php';

    $query = $link->query("UPDATE * FROM user");
    // $result = array();

    while ($rowData = $query->fetch_assoc()) {
        $result[] = $rowData;
    }


    echo json_encode($result);
