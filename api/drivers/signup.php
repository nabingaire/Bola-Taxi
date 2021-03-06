<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    require '../config/database.php';
    require '../config/response_codes.php';


    //Get Data
    /* 
    {
        "name" : "",
        "phone" : "",
        "password" : "",
        "gender" : "",
        "taxi_no" : ""
    }
    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);

    $name = $json_obj->name;
    $phone = $json_obj->phone;
    $password = $json_obj->password;
    $gender = $json_obj->gender;
    $taxi_no = $json_obj->taxi_no;




    $driversSignupQuery = "INSERT INTO drivers(name,phone,password,gender) VALUES ('$name', '$phone','$password','$gender')";
    $getDriversIdQuery = "SELECT LAST_INSERT_ID() AS driver_id;";



    $responseArray = array();
    if (mysqli_query($conn, $driversSignupQuery)) {

        $getdriversIdResult = mysqli_query($conn, $getDriversIdQuery);
        $getdriversId = mysqli_fetch_assoc($getdriversIdResult);

        $responseArray = array('response' => $getdriversId["driver_id"]);

        $driversId = $getdriversId["driver_id"];

        $taxiQuery = "INSERT INTO taxi_info(t_id,taxi_no) VALUES ('$driversId','$taxi_no')";

        if (mysqli_query($conn, $taxiQuery)) {

            $responseArray = array('response_code' => STATUS_OK, 'message' => 'Signup Successfull');
        }
    } else {
        $responseArray = array('response_code' => NOT_FOUND, 'message' => mysqli_error($conn));
    }
    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}
