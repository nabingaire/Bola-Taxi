<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){

    require '../config/database.php';
    require '../config/response_codes.php';

    /*
        Get data

        {
            "review_star": "",
            "review_comment": "",
            "reviewer_id": "",
            "reviewer_type" : ""
        

        }



    */

    $json_str = file_get_contents('php://input');
    $json_obj = json_decode($json_str);
     
    $review_star =$json_obj->review_star;
    $review_comment =$json_obj->review_comment;
    $reviewer_id=$json_obj->reviewer_id;
    $reviewer_type=$json_obj->reviewer_type;
    

    $reviewQuery="INSERT INTO review(review_star,review_comment,reviewer_id,reviewer_type) VALUES ('$review_star','$review_comment','$reviewer_id','$reviewer_type')";

    $responseArray;
    if($runQuery = mysqli_query($conn,$reviewQuery)){

        $responseArray = array('response_code'=> STATUS_OK,'message'=>'Added succesfully');

    }else{
        $responseArray = array('response_code'=>NOT_FOUND, 'message'=>mysqli_error($conn));
    }



    header('Content-type: application/json');
    echo json_encode($responseArray);

    mysqli_close($conn);
}


?>