<?php
	session_start();
//	session_regenerate_id();
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
		$LastLogin = $_SESSION['LastLogin'];
?>
	<div class="col col-md-2 leftNav">
		<div class="navbar-header btn-block">
			<span class="navbar-brand">Menu</span>
			<button class="btn btn-block btn-elegant leftNavButton active" onclick="showProfile(this.id)" id="learnerProfile">My Profile</button>
			<button class="btn btn-block btn-elegant leftNavButton"        onclick="showProfile(this.id)" id="learnerCourses">My Courses</button>
			<button class="btn btn-block btn-elegant leftNavButton"        onclick="showProfile(this.id)" id="learnerCertificates">My Certificates</button>
		</div>
	</div>
	<div class="col col-md-8" id="profileBody">
		<?php include 'learnerProfile.php'; ?>
	</div>
	<div class="col col-md-2">
		right
	</div>
<?php
	}
?>
