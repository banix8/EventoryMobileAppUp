<?php

	include 'conn.php';
	
	$image = $_FILES['image']['name'];

	$imagePath = "C:/xampp/htdocs/eventory_updated/uploads/".$image;
    move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);
    
    	
	$sql = "UPDATE tbl_supplier SET image ='$image' WHERE supplierID= 20";
                    
    $exeQuery = mysqli_query($connect,$sql);

        if($exeQuery){
            echo(json_encode(array('code'=> 1, 'message'=>'Image Uploaded')));
        }else{
            echo(json_encode(array('code'=> 2, 'message'=>'Failed to Upload')));
        }s
?>