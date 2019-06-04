<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Send Data ===========*/
    $getPassengersDataQuery = "SELECT * FROM users";
    //Check if sucess
    $getPassengersData = mysqli_query($conn,$getPassengersDataQuery);
    $rows = array();
    while($r = mysqli_fetch_assoc($getPassengersData)) {
        $rows[] = $r;
    }
    echo json_encode($rows);
    header('Content-Type: application/json');
    //Close Connection
    mysqli_close($conn);

?>