<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';

    /*
        Get data

        {
            
            "latitude": "",
            "longitude": ""
        }



    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
     
  
   
    $latitude=$json_obj->latitude;
    $longitude=$json_obj->longitude;
    

    $locationQuery="INSERT INTO location(latitude,longitude) VALUES ('$latitude','$longitude')";

    $responseArray;
    if($runQuery = mysqli_query($conn,$locationQuery)){

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Added succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>