<p>Learner Certificates</p>
<?php
	if (!$_SESSION) {session_start();}
	session_regenerate_id();
	$learnerId = $_SESSION['learner'];
	$loggedIn  = $_SESSION['loggedIn'];
	$UserName  = $_SESSION['UserName'];
	$Token = "User" . $learnerId . "HasLoggedInSuccessfullyThankYouVeryMuch";
	if ((($learnerId == '') || (!$loggedIn === $Token))) {
		$_SESSION['loggedIn'] = 'Wrong';
		session_destroy();
		header("location: index.php");
	}
	else {
		require_once 'config.php';
		include_once 'resources/classes/classLearner.php';
		$Learner = new classLearner($learnerId);
?>


<?php
	}
?>
