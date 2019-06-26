<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

  require '../config/database.php';
  require '../config/response_codes.php';


  //Get Data
  /* 
    {
        "request_id" : "",
      
    }
    */

  $json_str = file_get_contents('php://input');
  $json_obj = json_decode($json_str);


  $request_id = $json_obj->request_id;


  $acceptedRequestQuery = "SELECT acr.request_id,req.origin,req.destination,req.request_time, dri.name, t.taxi_no, dri.phone,dri.current_loc from accepted_requests as acr JOIN request as req ON req.request_id = acr.request_id JOIN drivers as dri ON dri.d_id = acr.driver_id
  JOIN taxi_info as t ON t.t_id = dri.d_id
  where acr.request_id='$request_id'";

  $acceptedRequestResult = mysqli_query($conn, $acceptedRequestQuery);
  $rows;
  while($r = mysqli_fetch_assoc($acceptedRequestResult)) {
    $rows[] = $r;
  }

  $responseArray = array();
  if (mysqli_num_rows($acceptedRequestResult) == 0) {
    $rows = array('response_code' => NOT_FOUND, 'message' => mysqli_error($conn));
  } else {
    $rows[0]["response_code"] = 200;
    $rows[0]["message"] = "Request Accepted!";
  }



  header('Content-type: application/json');
  echo json_encode($rows);

  mysqli_close($conn);
}
?>