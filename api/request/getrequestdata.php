<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Send Data ===========*/
    $getRequestDataQuery = "SELECT * FROM request";
    //Check if sucess
    $getRequestData = mysqli_query($conn,$getRequestDataQuery);
    $rows = array();
    while($r = mysqli_fetch_assoc($getRequestData)) {
        $rows[] = $r;
    }
    echo json_encode($rows);
    header('Content-Type: application/json');
    //Close Connection
    mysqli_close($conn);

?>