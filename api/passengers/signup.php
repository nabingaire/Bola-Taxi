<?php 

if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';


    //Get Data
    /* 
    {
        "name" : "",
        "phone" : "",
        "password" : "",
        "gender" : ""
    }
    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);

    $name = $json_obj->name;
    $phone = $json_obj->phone;
    $password = $json_obj->password;
    $gender = $json_obj->gender;


    $sql = "INSERT INTO users(name,phone,password,gender) VALUES ('$name', '$phone','$password','$gender')";
    $responseArray;
    if(mysqli_query($conn,$sql)){
        $responseArray = array('response_code'=>STATUS_OK,'message'=>'Added succesfully');
    }else{
        $responseArray = array('response_code'=>NOT_FOUND,'message'=>'Connection Not Found');;
    }
    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}

?>