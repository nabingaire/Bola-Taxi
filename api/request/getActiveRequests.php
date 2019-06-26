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
    $getCompletedRequestDataQuery = "SELECT u.u_id,r.request_id,u.name,r.origin,r.destination,r.origin_name,r.destination_name,u.phone,r.request_time FROM request as r
    JOIN users as u ON r.u_id = u.u_id WHERE r.status='pending'";

    //Check if sucess
    $getCompletedRequestData = mysqli_query($conn,$getCompletedRequestDataQuery);

    $rows = array();
    while($r = mysqli_fetch_assoc($getCompletedRequestData)) {
        $rows[] = $r;
    }

    header('Content-Type: application/json');
    
    echo json_encode($rows);
    //Close Connection
    mysqli_close($conn);
}
?>