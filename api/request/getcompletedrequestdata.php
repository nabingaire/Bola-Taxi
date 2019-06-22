<?php
if ($_SERVER['REQUEST_METHOD'] === 'GET'){
    
   
    require '../config/database.php';
    require '../config/response_codes.php';
        

    // var _rideHistoryData = jsonObj.toString();
    // for (var u in _rideHistoryData) {
    //   RideHistoryModal rideHistory = RideHistoryModal(
    //       _rideHistoryData["index"],
    //       _rideHistoryData["origin"],
    //       _rideHistoryData["destination"],
    //       _rideHistoryData["rider_name"],
    //       _rideHistoryData["date"],
    //       _rideHistoryData["taxi_no"]);
    //   _rideHistoryList.add(rideHistory);
    // }
    
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
}
?>