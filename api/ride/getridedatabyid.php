<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
    /*============ Connection ===========*/
     
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Get Data ===========*/
    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
    $r_id = $json_obj->r_id;
    /*============ Check if records exists ===========*/
    $getRideDatabyIdQuery = "SELECT r_id,started_time,d_id,t_id,origin,destination FROM ride WHERE r_id=".$r_id;
    $getRideDatabyId = mysqli_query($conn,$getRideDatabyIdQuery);
    //Check if sucess
    if($getRideDatabyId){
        $row=mysqli_fetch_row($getRideDatabyId);
        if(isset($row[0])){
            $responseArray = array('responseCode'=>'200',
            'r_id'=>$row[0],
            'started_time'=>$row[1],
            'd_id'=>$row[2],
            't-id'=>$row[3],
            'origin'=>$row[4],
            'destination'=>$row[5]);
        
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