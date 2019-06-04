<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Send Data ===========*/
    $getReviewDataQuery = "SELECT * FROM review";
    //Check if sucess
    $getReviewData = mysqli_query($conn,$getReviewDataQuery);
    $rows = array();
    while($r = mysqli_fetch_assoc($getReviewData)) {
        $rows[] = $r;
    }
    echo json_encode($rows);
    header('Content-Type: application/json');
    //Close Connection
    mysqli_close($conn);

?>