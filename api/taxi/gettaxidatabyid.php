<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
    /*============ Connection ===========*/
     
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Get Data ===========*/
    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
    $t_id = $json_obj->t_id;
    /*============ Check if records exists ===========*/
    $getTaxiDataByIdQuery = "SELECT t_id,taxi_no,status FROM taxi_info WHERE t_id=".$t_id;
    $gettaxidatabyid = mysqli_query($conn,$getTaxiDataByIdQuery);
    //Check if sucess
    if($gettaxidatabyid){
        $row=mysqli_fetch_row($gettaxidatabyid);
        if(isset($row[0])){
            $responseArray = array('responseCode'=>'200',
            't_id'=>$row[0],
            'taxi_no'=>$row[1],
            'status'=>$row[2]);
        
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