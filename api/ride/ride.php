<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';

    /*
        Get data

        {
            "d_id": "",
            "t_id": "",
            "origin": "",
            "destination" : ""
        

        }



    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
     
    $d_id =$json_obj->d_id;
    $t_id =$json_obj->t_id;
    $origin=$json_obj->origin;
    $destination=$json_obj->destination;
    

    $rideQuery="INSERT INTO ride(d_id,t_id,origin,destination) VALUES ('$d_id','$t_id','$origin','$destination')";

    $responseArray;
    if($runQuery = mysqli_query($conn,$rideQuery)){

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Added succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>