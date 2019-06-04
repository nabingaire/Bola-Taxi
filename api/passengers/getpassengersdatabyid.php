<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
    /*============ Connection ===========*/
     
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Get Data ===========*/
    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
    $u_id = $json_obj->u_id;
    /*============ Check if records exists ===========*/
    $getPassengersDataByIdQuery = "SELECT u_id,name,phone,gender FROM users WHERE u_id=".$u_id;
    $getPassengersDataById = mysqli_query($conn,$getPassengersDataByIdQuery);
    //Check if sucess
    if($getPassengersDataById){
        $row=mysqli_fetch_row($getPassengersDataById);
        if(isset($row[0])){
            $responseArray = array('responseCode'=>'200',
            'u_id'=>$row[0],
            'name'=>$row[1],
            'phone'=>$row[2],
            'gender'=>$row[3]);
        
        }else{
            $responseArray = array('responseCode'=>'404','message'=>'Record not found');
        }
    }else{
    
        $responseArray = array('responseCode'=>'500','message'=>mysqli_error($conn));
        
    
    }
    header('Content-Type: application/json');
    echo json_encode($responseArray);
    //Close Connection
    mysqli_close($conn);

?>