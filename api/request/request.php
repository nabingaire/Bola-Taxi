<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';

    /*
        Get data

        {
            "u-id": "",
            "origin": "",
            "destination" : "",
            "status" : ""

        }



    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);

    $u_id =$json_obj->u_id;
    $origin=$json_obj->origin;
    $destination=$json_obj->destination;
    $status=$json_obj->status;

    $requestQuery="INSERT INTO request(u_id,origin,destination,status) VALUES ('$u_id','$origin','$destination','$status');";
    $getRequestIdQuery = "SELECT LAST_INSERT_ID() AS request_id;"; 
    $responseArray;
    $getRequestId;
    if($runQuery = mysqli_query($conn,$requestQuery)){

        $getRequestIdResult = mysqli_query($conn,$getRequestIdQuery);
        $getRequestId = mysqli_fetch_assoc($getRequestIdResult);

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Added succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }

    $responseArray["request_id"] = $getRequestId["request_id"]; 



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>