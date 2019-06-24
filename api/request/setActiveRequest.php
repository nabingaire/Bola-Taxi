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
     
    $driver_id =$json_obj->driver_id;
    $request_id =$json_obj->request_id;

    

    $rideQuery="INSERT INTO accepted_requests(driver_id,request_id) VALUES ('$driver_id','$request_id')";
    //Change status to pending
    $requestPendingQuery = "UPDATE request SET status='active' WHERE request_id='$request_id'";

    $responseArray;
    if($runQuery = mysqli_query($conn,$rideQuery)){

        mysqli_query($conn,$requestPendingQuery);

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Added succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>