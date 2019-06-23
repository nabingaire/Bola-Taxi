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


  $acceptedRequestQuery = "SELECT * from accepted_requests where request_id='$request_id'";

  $acceptedRequestResult = mysqli_query($conn, $acceptedRequestQuery);

  while($r = mysqli_fetch_assoc($acceptedRequestResult)) {
    $rows[] = $r;
  }

  $responseArray = array();
  if (mysqli_num_rows($acceptedRequestResult) == 0) {
    $responseArray = array('response_code' => NOT_FOUND, 'message' => mysqli_error($conn));
  } else {
    $responseArray = array('response_code' => STATUS_OK, 'message' => 'Request Accepted');
  }

  header('Content-type: application/json');
  echo json_encode($responseArray);

  mysqli_close($conn);
}
?>