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
    $getCompletedRequestDataQuery = "SELECT c.completed_request_id,c.origin,c.destination,t.taxi_no,d.name,c.completed_time FROM completed_request as c
        JOIN taxi_info as t ON t.t_id = c.t_id
        JOIN drivers as d ON t.t_id = d.d_id";

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