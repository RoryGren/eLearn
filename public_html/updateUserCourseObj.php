<?php
// =======================================================================
// TODO =====> Update learnerJSON if course structure is changed... <=====
// =======================================================================

	session_start();
//	session_regenerate_id();
//	print_r($_REQUEST);
	
	$UserName  = $_REQUEST['UserName'];
	$userJSON  = $_REQUEST['userJSON'];
	$learnerId = $_REQUEST['learnerId'];
	$loggedIn  = $_REQUEST['loggedIn'];
	$Token = "User" . $learnerId . "HasLoggedInSuccessfullyThankYouVeryMuch";

	if ((($learnerId == '') || (!$loggedIn === $Token))) {
//		echo "Bombed out...";
		$_SESSION['loggedIn'] = 'Wrong';
		session_destroy();
		header("location: index.php");
	}
	else {
//		echo "We're still cool!<br>";
		$userJSON = $_REQUEST['userJSON'];
//		echo $userJSON;
		require_once 'config.php';
		include "resources/classes/classDashboardModel.php";
		$Dashboard = new classDashboardModel($learnerId);
//		echo "Call update...<br>";
		$Dashboard->updateUserJSON($userJSON);
	}
?>
