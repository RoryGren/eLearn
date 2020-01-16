<?php
	// TODO =====> Learner Profile Module
	// TODO =====> Assessments Module
	// TODO =====> Progress bar for Assessments
	// TODO =====> Reset progress button - Whole Course
	// TODO =====> Reset progress button - Current Section
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
		include "resources/classes/classDashboardModel.php";

		$Dashboard = new classDashboardModel($learnerId);

		/*
		 * $learnerProfileData       -> array with only one row. Used as $learnerProfileData[0] with "progress" in json string format
		 * $learnerCurrentCourseData -> array 
		 * $leftNav                  -> course descriptions, codes and rowids, etc
		 * $userJSON                 -> $learnerProfileData[0]['progress'] as an array
		 */
		
		$learnerCurrentCourseData = $Dashboard->getCurrentCourseData(); // Raw for left NAV === Not learner data
		$learnerProfileData       = $Dashboard->getLearnerData(); // Full learner data Raw form DB stringified JSON
		$leftNav                  = $Dashboard->getCourseChapterSection(); // Build up left NAV
		$userJSON                 = $Dashboard->getCurrentCourseProgress(); // courseprogress data -> Subset of learnerProfileData JSON_decoded assoc array
		// [1] => Array ( [ChapterId] => 1 [SectionId] => 1 [Status] => 0 [StartDate] => 1970-01-01 [CompleteDate] => )
		$LastActiveRowId   = $userJSON['LastAccessed']['SecRowId'];
		$LastActiveChapter = $userJSON['LastAccessed']['LastActiveChapter'];
		$LastActiveSecCode = $userJSON['LastAccessed']['SecCode'];
		$SecRowId = $LastActiveRowId;
		include 'head.php';
?>
    <body>
		<script>
			$(document).ready(function () {
				if (typeof(Storage) !== "undefined") {
					sessionStorage.setItem('learnerId',	   '<?php echo $learnerId; ?>');
					sessionStorage.setItem('loggedIn',     '<?php echo $loggedIn; ?>');
					sessionStorage.setItem('UserName',     '<?php echo $UserName; ?>');
					sessionStorage.setItem('userProgress', '<?php echo json_encode($userJSON); ?>');
					sessionStorage.setItem('SecRowId', '<?php echo $LastActiveRowId; ?>');
					sessionStorage.setItem('LastActiveChapter', '<?php echo $LastActiveChapter; ?>');
					sessionStorage.setItem('SecCode', '<?php echo $LastActiveSecCode; ?>');
					sessionStorage.setItem('LastLogin', '<?php echo $_SESSION['LastLogin']; ?>');
				} else {
					alert("Your browser is too old for this application. Please update to the latest version of your browser.");
					window.location.href='logout.php';
					// Sorry! No Web Storage support..
				}
				document.title = "<?php echo $learnerCurrentCourseData['Description']; ?>";
				$('#btnToggleComplete').prop('disabled','disabled');
				$('#<?php echo $LastActiveSecCode; ?>').addClass('in');
				if (sessionStorage.getItem('LastActiveChapter') > 0) {
					$('#Ch-'+sessionStorage.getItem('LastActiveChapter')).click();
					displayVideo(sessionStorage.getItem('SecRowId'));
				}
				$('#menu-Home').removeClass('disabled');
				$('#menu-Home').removeClass('no-entry');
				$('#menu-Dash').parent('div').addClass('active');
				$('#showVideo').hide(); // "Show Video/Show Transcript toggle
				$('#lastLogin').html('Last Login: '+sessionStorage.getItem('LastLogin'));
			});
		</script>
		<?php include 'topNavBar.php'; ?>
		<div class="container-fluid">
			<div class="row" id="main">
				<div class="col col-md-2 leftNav">
					<?php 
					include 'resources/classes/classDashboardView.php'; 
					$Display = new classDashboardView();
					$Display->setLastActive($LastActiveRowId, $LastActiveChapter, $LastActiveSecCode);
					$Display->leftNavMenuHeader($learnerCurrentCourseData);
					$Display->leftNavMenu($leftNav, $userJSON);
					?>
					<p>Course Videos Viewed:</p>
					<div class="progress">
						<div id="viewedProgress" class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
					  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
						40% Complete (success)
					  </div>
					</div>
<!--					<button class="btn btn-block btn-danger" id="btnProgressReset" onclick="resetProgress();" disabled>
						Reset My Progress
					</button>-->
				</div>
				<div class="col col-md-8" id="courseBody">
					<div id="vidContainer" class="vidContainer"><?php include "runVideo.php"; ?></div>
					<div id="vidTranscript" class="transcript" style="display: none;">
					</div>
				</div>
				<div class="col col-md-2">
					<button class="btn btn-block btn-elegant leftNavButton" onclick="switchVideo();" id="btnToggleVideo" disabled>
						<span id="showTranscript">Show Transcript</span>
						<span id="showVideo">Show Video</span>
					</button>
					<button class="btn btn-block btn-elegant leftNavButton" id="btnToggleComplete" onclick="sectionCompleted();">
						Mark Completed
					</button>
					<button class="btn btn-block btn-elegant leftNavButton hidden" id="btnToggleAssessment" onclick="showAssessment();" disabled>
						Open Assessment
					</button>
					<div id="lastLogin"><p>Last Login: Never</p></div>
				</div>
			</div>
		</div>
    </body>
</html>
<?php
	}
?>
