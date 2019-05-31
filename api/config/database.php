<?php 

    $username = "root";
    $password = "";
    $dbname = "bola_taxi";
    $host = "localhost";

    //Create Connection
    $conn = mysqli_connect($host,$username,$password,$dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 
    
?>