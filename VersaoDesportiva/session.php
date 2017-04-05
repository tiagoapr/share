<?php 
//$inactive = 240;
$inactive = 2400;
if (isset($_SESSION['timeout'])) {
	$session_life = time() - $_SESSION['timeout'];
	if ($session_life > $inactive) {
		session_destroy();
		header("location:index.php");
	}
} 
$_SESSION['timeout'] = time();
?>