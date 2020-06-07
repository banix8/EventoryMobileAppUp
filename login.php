<?php 
    include 'conn.php';
    
            $event = $_POST['event'];

            switch($event) {
                case "login":
                    $email = $_POST['email'];
                    $password = $_POST['password'];
                    $queryResult=$connect->query("SELECT * from tbl_useraccounts WHERE email='".$email."' and password='".$password."'");
                    
                    $result=array();

                    while($fetchData= $queryResult->fetch_assoc()){
                        $result[] = $fetchData;
                    }
                    echo json_encode($result);
                    break;

                case "register":
                    $fullName = $_POST['name'];
                    $email = $_POST['email'];
                    $password = $_POST['password'];
                    $accountType = $_POST['accountType'];

                    $sql = "INSERT INTO tbl_useraccounts (fullName, email, password,accountType)
                            VALUES ('".$fullName."', '".$email."', '".$password."','".$accountType."')";
                    if ($connect->query($sql) === TRUE) {
                        echo "New record created successfully";
                    } else {
                        echo "Error: " . $sql . "<br>" . $connect->error;
                    }
                    
                break;


                case "supplier":
                
                //$supplierID = $_GET['supplierID'];
                
                $queryResult=$connect->query("SELECT * FROM tbl_useraccounts
                LEFT JOIN tbl_supplier
                ON tbl_useraccounts.accountID = tbl_supplier.accountID
                where tbl_useraccounts.accountID = 1 ");

                $result=array();

                while($fetchData= $queryResult->fetch_assoc()){
                    $result[] = $fetchData;
                }
                echo json_encode($result);
                break;

                case "client":
                
                    $queryResult=$connect->query("SELECT * FROM tbl_client ");
    
                    $result=array();
    
                    while($fetchData= $queryResult->fetch_assoc()){
                        $result[] = $fetchData;
                    }
                    echo json_encode($result);
                break;

                case "profile_update":
                    
                    $supplierID = $_POST['supplierID'];
                
                   //$image = $_FILES['image']['name'];

	               //$imagePath = "C:/xampp/htdocs/eventory_updated/uploads/".$image;
                   //move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);
                    
                    $supplierPhone = $_POST['supplierPhone'];
                    $supplierAddress = $_POST['supplierAddress'];
                    $supplierCategory = $_POST['supplierCategory'];

                    //$supplierRate = $_POST['supplierRate'];
                    //$supplierYears = $_POST['supplierYears'];
                    //$supplierBio = $_POST['supplierBio'];

                    //$supplierFacebook = $_POST['supplierFacebook'];


                    
                    $sql = " UPDATE tbl_supplier SET supplierPhone ='$supplierPhone', supplierAddress ='$supplierAddress', supplierCategory ='$supplierCategory' WHERE supplierID = $supplierID ";
                    
                    $exeQuery = mysqli_query($connect,$sql);

                    if($exeQuery){
                        echo(json_encode(array('code'=> 1, 'message'=>'User Modified')));
                    }else{
                        echo(json_encode(array('code'=> 2, 'message'=>'modification failed')));
                    }
                    
                break;

                case "search":
                    
                    $queryResult=$connect->query("SELECT * from tbl_supplier");
                    $result=array();

                    while($fetchData= $queryResult->fetch_assoc()){
                        $result[] = $fetchData;
                    }
                    echo json_encode($result);
                default:
                    # code...
                    break;
            }
                
            
        
?>