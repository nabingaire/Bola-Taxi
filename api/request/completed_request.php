<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';

    /*
        Get data

        {
            "t_id": "",
            "request_id":"",
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
    $request_id = $json_obj->request_id;
    

    $completedRequestQuery="INSERT INTO completed_request(t_id,u_id,origin,destination) VALUES ('$t_id','$u_id','$origin','$destination')";
    //Remove from accepted requests
    $deleteFormAcceptedRequestsQuery = "DELETE FROM accepted_requests WHERE request_id='$request_id'";
    
    //Delete from request table
    $deleteFromRequestQuery = "DELETE FROM request WHERE request_id='$request_id'";

    $responseArray;
    if($runQuery = mysqli_query($conn,$completedRequestQuery)){
        echo($deleteFromRequestQuery);
        $deleteFromAcceptedRequests = mysqli_query($conn,$deleteFormAcceptedRequestsQuery);
        $deleteRecord = mysqli_query($conn,$deleteFromRequestQuery);

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Added succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>