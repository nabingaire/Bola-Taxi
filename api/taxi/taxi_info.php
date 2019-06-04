<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';

    /*
        Get data

        {
            "taxi_no": "",
            "status": ""
        }



    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
     
  
   
    $taxi_no=$json_obj->taxi_no;
    $status=$json_obj->status;
    

    $taxiInfoQuery="INSERT INTO taxi_info(taxi_no,status) VALUES ('$taxi_no','$status')";

    $responseArray;
    if($runQuery = mysqli_query($conn,$taxiInfoQuery)){

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Added succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>