<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';

    /*
        Get data

        {
            "t_id": "",
            "u_id": "",
            "origin": "",
            "destination" : ""
        

        }



    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
     
    $t_id =$json_obj->t_id;
    $u_id =$json_obj->u_id;
    $origin=$json_obj->origin;
    $destination=$json_obj->destination;
    

    $completedRequestQuery="INSERT INTO completed_request(t_id,u_id,origin,destination) VALUES ('$t_id','$u_id','$origin','$destination')";

    $responseArray;
    if($runQuery = mysqli_query($conn,$completedRequestQuery)){

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Added succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>