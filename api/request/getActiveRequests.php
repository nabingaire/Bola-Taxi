<?php
if ($_SERVER['REQUEST_METHOD'] === 'GET'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        

    // final int index;
    // final String origin;
    // final String destination;
    // final String phoneNumber;
    // final String date;
  
    
    /*============ Send Data ===========*/
    $getCompletedRequestDataQuery = "SELECT u.name,r.request_id,r.origin,r.destination,u.phone,r.request_time FROM request as r
    JOIN users as u ON r.u_id = u.u_id WHERE r.status='pending'";

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
}
?>