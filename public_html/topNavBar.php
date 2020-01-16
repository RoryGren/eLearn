<?php
	$LearnerCoy = $learnerProfileData[0]['CompanyCode'];
	if ($LearnerCoy == '' || (is_null($LearnerCoy))) {
		$LearnerCoy = $learnerProfileData[0]['CompanyDesc'];
	}
?>
			<nav class="navbar navbar-inverse" id="topMenu">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle active" data-toggle="collapse" data-target="#navBar" id="menu-Dash">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span> 
						</button>
						<a class="navbar-brand" href="dashboard.php">ii-eLearning Dashboard</a>
					</div>
					<div class="collapse navbar-collapse" id="navBar">
						<ul class="nav navbar-nav">
							<li id="menu-Profile" onclick="setActive(this.id); showProfile(0,'navbar');">			    <a href="#Profile"><span class="glyphicon glyphicon-user"></span> My Profile</a></li>
							<li id="menu-Home" onclick="setActive(this.id); showWelcome();" ><a href="#Home"><span class="glyphicon glyphicon-home"></span> Active Course Home</a></li>
<!--							<li id="menu-How" onclick="setActive(this.id);"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-cog"></span> How To... <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu" id="navHowTo">
									<li><a href="http://help.inspiredinterfaces.co.za/eLearning" target="_blank">Use ii-eLearning</a></li>
								</ul>
							</li>-->
							<!--<li id="menu-Portfolio" onclick="setActive(this.id);">			<a href="#Portfolio"><span class="glyphicon glyphicon-file"></span> Completed</a></li>-->
							<!--<li id="menu-Contact" onclick="setActive(this.id);">			<a href="#Contact"><span class="glyphicon glyphicon-phone-alt"></span> Contact</a></li>-->
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li id="menu-Logout" class="navbar-right" onclick="logout();">
								<a href="#">&nbsp;&nbsp;<span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
							<li id="menu-SignedIn" class="navbar-right" onclick="setActive(this.id);">
								<h4 class="SignedIn" id="SignedIn"><span class="glyphicon glyphicon-user"></span>
									Signed in as <?php echo $learnerProfileData[0]['FName'] . " " . $learnerProfileData[0]['SName'] . " ($LearnerCoy)"; ?>
								</h4>
							</li>
						</ul>
					</div>
				</div>
			</nav>
