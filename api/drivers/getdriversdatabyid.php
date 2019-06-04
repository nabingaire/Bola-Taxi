<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
    /*============ Connection ===========*/
     
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Get Data ===========*/
    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
    $d_id = $json_obj->d_id;
    /*============ Check if records exists ===========*/
    $getDriversDataByIdQuery = "SELECT d_id,name,phone,gender,current_loc,taxi_id FROM drivers WHERE d_id=".$d_id;
    $getDriversDataById = mysqli_query($conn,$getDriversDataByIdQuery);
    //Check if sucess
    if($getDriversDataById){
        $row=mysqli_fetch_row($getDriversDataById);
        if(isset($row[0])){
            $responseArray = array('responseCode'=>'200',
            'u_id'=>$row[0],
            'name'=>$row[1],
            'phone'=>$row[2],
            'gender'=>$row[3],
            'current_loc'=>$row[4],
            'taxi_id'=>$row[5] );
        
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