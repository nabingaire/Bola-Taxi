<?php 

if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';


    //Get Data
    /* 
    {
        "phone" : "",
        "password" : ""
      
    }
    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);

    
    $phone = $json_obj->phone;
    $password = $json_obj->password;
   


    $passengerssLoginQuery = "SELECT  * from users where phone='$phone' AND password= '$password'";

    $loginResult = mysqli_query($conn,$passengerssLoginQuery);
    
    $responseArray;
    if(mysqli_num_rows($loginResult) == 0){
       $responseArray = array('response_code'=>NOT_FOUND,'message'=>'User Not Found');
    }else{
      $responseArray = array('response_code'=>STATUS_OK,'message'=>'Login Successfull');
    }

    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}

?>