<?php
if ($_SERVER['REQUEST_METHOD'] === 'GET'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Send Data ===========*/
    $getDriversDataQuery = "SELECT * FROM drivers";
    //Check if sucess
    $getDriversData = mysqli_query($conn,$getDriversDataQuery);
    $rows = array();
    while($r = mysqli_fetch_assoc($getDriversData)) {
        $rows[] = $r;
    }
    echo json_encode($rows);
    header('Content-Type: application/json');
    //Close Connection
    mysqli_close($conn);

?>