<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Send Data ===========*/
    $getTaxiDataQuery = "SELECT * FROM taxi_info";
    //Check if sucess
    $getTaxiData = mysqli_query($conn,$getTaxiDataQuery);
    $rows = array();
    while($r = mysqli_fetch_assoc($getTaxiData)) {
        $rows[] = $r;
    }
    echo json_encode($rows);
    header('Content-Type: application/json');
    //Close Connection
    mysqli_close($conn);

?>