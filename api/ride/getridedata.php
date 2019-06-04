<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Send Data ===========*/
    $getRideDataQuery = "SELECT * FROM ride";
    //Check if sucess
    $getRideData = mysqli_query($conn,$getRideDataQuery);
    $rows = array();
    while($r = mysqli_fetch_assoc($getRideData)) {
        $rows[] = $r;
    }
    echo json_encode($rows);
    header('Content-Type: application/json');
    //Close Connection
    mysqli_close($conn);

?>