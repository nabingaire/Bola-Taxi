<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST'){
    
    /*============ Connection ===========*/
     
    require '../config/database.php';
    require '../config/response_codes.php';
        
    
    }
    /*============ Get Data ===========*/
    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
    $request_id = $json_obj->request_id;
    /*============ Check if records exists ===========*/
    $getRequestDataByIdQuery = "SELECT request_id,u_id,origin,destination,request_time,status FROM request WHERE request_id=".$request_id;
    $getRequestDataById = mysqli_query($conn,$getRequestDataByIdQuery);
    //Check if sucess
    if($getRequestDataById){
        $row=mysqli_fetch_row($getRequestDataById);
        if(isset($row[0])){
            $responseArray = array('responseCode'=>'200',
            'request_id'=>$row[0],
            'u_id'=>$row[1],
            'origin'=>$row[2],
            'destination'=>$row[3],
            'request_time'=>$row[4],
            'status'=>$row[5]
        );
        
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