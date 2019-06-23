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


  $usersLoginQuery = "SELECT  u_id,name,phone,current_loc,gender,review_id from users where phone='$phone' AND password= '$password'";

  $loginResult = mysqli_query($conn, $usersLoginQuery);

  while($r = mysqli_fetch_assoc($loginResult)) {
    $rows[] = $r;
  }

  $responseArray = array();
  if (mysqli_num_rows($loginResult) == 0) {
    $responseArray = array('response_code' => NOT_FOUND, 'message' => mysqli_error($conn));
  } else {
    $responseArray = array('response_code' => STATUS_OK, 'message' => 'Login Successfull');
  }

  //Add required fields
  $responseArray["u_id"] = $rows[0]["u_id"];
  $responseArray["name"] = $rows[0]["name"];
  $responseArray["phone"] = $rows[0]["phone"];
  $responseArray["current_loc"] = $rows[0]["current_loc"];
  $responseArray["gender"] = $rows[0]["gender"];
  $responseArray["review_id"] = $rows[0]["review_id"];

  header('Content-type: application/json');
  echo json_encode($responseArray);

  mysqli_close($conn);
}
?>