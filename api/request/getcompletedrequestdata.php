<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Send Data ===========*/
    $getCompletedRequestDataQuery = "SELECT * FROM completed_request";
    //Check if sucess
    $getCompletedRequestData = mysqli_query($conn,$getCompletedRequestDataQuery);
    $rows = array();
    while($r = mysqli_fetch_assoc($getCompletedRequestData)) {
        $rows[] = $r;
    }
    echo json_encode($rows);
    header('Content-Type: application/json');
    //Close Connection
    mysqli_close($conn);

?>