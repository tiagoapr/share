<?php 
ob_start();

include 'db-config/db.php';

$action = isset($_GET['a'])?$_GET['a']:'';
$title = $_POST['title'];
$year = $_POST['year'];
$kilometers = $_POST['kilometers'];
$model =  $_POST['model'];
$description = $_POST['description'];
$txtColor = $_POST['txtColor'];

if ($action == "n") {
	$sql = "INSERT INTO cars (title, year, kilometers, model, description, text_color) VALUES ('$title', '$year', '$kilometers', '$model', '$description', '$txtColor')";
	if (!mysql_query($sql)) {  
		die('Error a efectuar a operacao.' . mysql_error());
	}
	header("location:cars.php?m=suc");
	ob_end_clean();
	return;
} else if ($action == "e") {

}

header("location:home.php");


function generateHash($password) {
	if (defined("CRYPT_BLOWFISH") && CRYPT_BLOWFISH) {
		$salt = '$2y$11$' . substr(md5(uniqid(rand(), true)), 0, 22);
		return crypt($password, $salt);
	}
}


function verify($password, $hashedPassword) {
	return crypt($password, $hashedPassword) == $hashedPassword;
}


ob_end_clean();
?>  