<?php
	if (($learnerId == '') || (!$Token === $loggedIn)) {
		$_SESSION['loggedIn'] = 'Wrong';
		session_destroy();
		header("location: index.php");
	}
	else {
		require_once 'config.php';
		$_SESSION['learnerId'] = $learnerId;
?>

	
	
<?php
	}
?>