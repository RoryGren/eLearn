<?php
/*
 *  html form submits to self
 */
	include "config.php";
	$Message = '';
	if ($_REQUEST['Login'] === 'Hello') {
//		ob_start();
		$UserName = $_POST['userName'];
		$Pwd = $_POST['pwd'];
		include "classes/classLogin.php";
		$Login = new classLogin();
		if ($Login->learnerExists($UserName, $Pwd)) {
			session_start();
			$_SESSION['learner']  = $Login->getCurrentLearnerId();
			$_SESSION['loggedIn'] = "User" . $_SESSION['learner'] . "HasLoggedInSuccessfullyThankYouVeryMuch";
			$_SESSION['UserName'] = $UserName;
			$_SESSION['LastLogin'] = $Login->getLastLogin();
			
			$Message = "<p class='text-center'>Logging in.<br>Please wait.<br><br><img src='graphics/ajax-loader1.gif' alt='' /></p>";
			echo "<meta http-equiv='refresh' content='0;url=dashboard.php' />";
		}
		else {
			$Message = "<p class='btn-danger text-center'>Invalid username and password combination.<br>Please try again.</p>";
		}
	}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" media="all" >
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="all" >
		<!--<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.0/css/mdb.min.css" media="all" >-->
		
		<link rel="stylesheet" type="text/css" href="style/e-Style.min.css"/>

		<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://use.fontawesome.com/6f7c9f8c3d.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.0/js/mdb.min.js"></script>-->
		<!--<script src="resources/scripts/dashScripts.min.js" type="text/javascript"></script>-->
		<!--<script src="resources/scripts/login.min.js" type="text/javascript"></script>-->
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
        <title>Inspired Interfaces e-Learning Login</title>
    </head>
    <body>
		<script>
			$("#frmLogin").submit(function(event){
				event.preventDefault();
				alert("Login button clicked");	
			});
		</script>
		<nav class="navbar navbar-inverse" id="topMenu">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navBar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span> 
					</button>
					<a class="navbar-brand" href="#">ii-eLearning Login</a>
				</div>
				<div class="collapse navbar-collapse" id="navBar">
					<ul class="nav navbar-nav navbar-right">
						<li id="menu-SignedIn" onclick="#" class="navbar-right">
							<h4 class="SignedIn"><span class="glyphicon glyphicon-user"></span>
								Not signed in</h4></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<div class="col col-md-4 "></div>
				<div class="col col-md-4 text-center"><h3>User Login</h3></div>
				<div class="col col-md-4 leftNav"></div>
			</div>
			<div class="row">
				<div class="col col-md-4 "></div>
				<div class="col col-md-4">
					<form class="form-vertical" method="post" id="frmLogin">
						<div class="form-group">
							<label for="userName" class="control-label text-left">Username:</label>
							<input type="text" class="form-control" id="userName" name="userName" placeholder="Email address">
						</div>
						<div class="form-group">
							<label for="pwd">Password:</label>
							<input type="password" class="form-control" id="pwd" name="pwd">
						</div>
						<div class="form-group text-center">
							<label></label>
							<button class="btn btn-block dark-theme formButton" id="Login" name="Login" type="submit" value="Hello">Login</button>
						</div>
						<div><?php echo $Message; ?></div>
					</form>
				</div>
				<div class="col col-lg-2"></div>
				<div class="col col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col col-md-4 "></div>
				<div class="col col-md-4">
					<p class="notice text-center">We recommend your browser be the latest versions of Chrome, Firefox, Opera or Safari.</p>
				</div>
				<div class="col col-md-4 "></div>
			</div>
		</div>
    </body>
</html>
<?php
//	}
?>