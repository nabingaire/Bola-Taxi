<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

  require '../config/database.php';
  require '../config/response_codes.php';


  //Get Data
  /* 
    {
        "phone" : "",
        "password" : ""
      
    }
    */

  $json_str = file_get_contents('php://input');
  $json_obj = json_decode($json_str);


  $phone = $json_obj->phone;
  $password = $json_obj->password;


  $driversLoginQuery = "SELECT  d_id,name,phone,current_loc,taxi_id,gender,review_id from drivers where phone='$phone' AND password= '$password'";

  $loginResult = mysqli_query($conn, $driversLoginQuery);

  while($r = mysqli_fetch_assoc($loginResult)) {
    $rows[] = $r;
}

  $responseArray = array();
  if (mysqli_num_rows($loginResult) == 0) {
    $responseArray = array('response_code' => NOT_FOUND, 'message' => mysqli_error($conn));
  } else {
    $responseArray = array('response_code' => STATUS_OK, 'message' => 'Login Successfull');
  }

  $responseArray["d_id"] = $rows[0]["d_id"];
  $responseArray["name"] = $rows[0]["name"];
  $responseArray["phone"] = $rows[0]["phone"];
  $responseArray["current_loc"] = $rows[0]["current_loc"];
  $responseArray["taxi_id"] = $rows[0]["taxi_id"];
  $responseArray["review_id"] = $rows[0]["review_id"];
  

  header('Content-type: application/json');
  echo json_encode($responseArray);

  mysqli_close($conn);
}
?>