<?php

if($_SERVER["REQUEST_METHOD"]=="POST"){

    $username = "root";
    $password = "";
    $dbname = "bola_taxi";
    $host = "localhost";

    //Create Connection
    $conn = mysqli_connect($host,$username,$password,$dbname);

    if(!$conn){
        echo "Not connected";
    }

    //Get Data
    /* 
    {
        "name" : "",
        "phone" : "",
        "username" : "",
        "password" : ""
    }
    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);

    $name = $json_obj->name;
    $phone = $json_obj->phone;
    $password = $json_obj->password;
    $username = $json_obj->username; 


    $sql = "INSERT INTO users(name,phone,username,password) VALUES ('$name', '$phone', '$username','$password')";

    if(mysqli_query($conn,$sql)){
        echo "Added";
    }else{
        echo mysqli_error($conn);
    }
}

?>