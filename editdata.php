<?php

	include 'conn.php';
	
	$supplierID = $_POST['supplierID'];
	$supplierPhone = $_POST['supplierPhone'];
	$supplierAddress = $_POST['supplierAddress'];
	$supplierCategory = $_POST['supplierCategory'];
	
	$connect->query("UPDATE tbl_supplier SET supplierPhone='".$supplierPhone."', supplierAddress ='".$supplierAddress."', supplierCategory ='".$supplierCategory."' WHERE supplierID =". $supplierID);

?>