<?php 
include 'database.php';


if(isset($_POST['eMail'],$_POST['motDePasse'])) {
    $eMail = $_POST['eMail'];
    $motDePasse = $_POST['motDePasse'];


$query = "SELECT * from user where eMail='$eMail' and motDePasse = '$motDePasse' ";

        $result = mysqli_query($link, $query);
        
        if(mysqli_num_rows($result) > 0){
                $json['message'] = 'success';
            }else{
                $json['message'] = 'Adresse mail et/ou mot de passe incorrects';
            }
            echo json_encode($json);
            mysqli_close($link);

}

?>