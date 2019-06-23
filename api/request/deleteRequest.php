<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';

    /*
        Get data

        {
            "u-id": "",

        }



    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);

    $u_id =$json_obj->u_id;

    $requestQuery="DELETE FROM request WHERE u_id = '$u_id'";

    $responseArray;
    if($runQuery = mysqli_query($conn,$requestQuery)){

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Removed succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>