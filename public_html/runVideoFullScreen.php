<?php
	session_start();
	$learnerId = $_SESSION['learner'];
	$loggedIn  = $_SESSION['loggedIn'];
//	echo "$learnerId : $loggedIn<br>";
	$Token = "User" . $learnerId . "HasLoggedInSuccessfullyThankYouVeryMuch<br>";
	if (($learnerId == '') || (!$Token === $loggedIn)) {
		$_SESSION['loggedIn'] = 'Wrong';
		session_destroy();
		header("location: index");
	}
	else {
		require_once 'config.php';
//	$SecRowId = "None";
//		print_r($_REQUEST);
		$_SESSION['learnerId'] = $learnerId;
		include "resources/classes/classDashboardModel.php";
		$Dashboard = new classDashboardModel($learnerId);
		$learnerProfileData = $Dashboard->getLearnerData();
		$learnerCurrentCourseData = $Dashboard->getCurrentCourseData();
		$leftNav = $Dashboard->getCourseChapterSection();
		$userJSON = $Dashboard->getCurrentCourseProgress();
		$LastActiveRowId   = $userJSON['LastAccessed']['SecRowId'];
		$LastActiveChapter = $userJSON['LastAccessed']['LastActiveChapter'];
		$LastActiveSecCode = $userJSON['LastAccessed']['SecCode'];
		$SecRowId = $LastActiveRowId;

		include 'head.php';
		if (isset($_REQUEST['secRowId'])) {
			$SecRowId = $_REQUEST['secRowId'];
		}
		include 'resources/classes/classVideo.php';
		$Video  = new classVideo();
//	echo $SecRowId . "<br>";
		$VidSrc = "resources/video/" . $Video->getVideo($SecRowId);
		include 'head.php';
?>

<body>
		<script>
			$(document).ready(function () {
				$('#secHeader').html('<?php echo $Video->getHeader($SecRowId); ?>');
			});
		</script>
	<div id="vidFull" class="container-fluid"> 
		<div class="row">
			<div class="col col-lg-12">
				<h3 id="secHeader" class="videoHeaderText no-top-padding"></h3>
				<video id="video2" onclick="playPause()">
					<source src="<?php echo $VidSrc; ?>" type="video/mp4">
					Your browser does not support the <code>video</code> tag.
				</video>
			</div>
		</div>
		<!--<br><br>-->
		<div class="row">
			<div class="col col-lg-12 vidControls">
				<input type="range" id="seek-bar" value="0">
				<button onclick="restart()"      title="Restart the video"><i class="fa fa-fast-backward"></i></button>
				<button onclick="rewind()"       title="Step Back 5s"><i class="fa fa-backward"></i></button>
				<button onclick="playPause()"    title="Play / Pause"><i class="fa fa-play"></i> / <i class="fa fa-pause"></i></button> 
				<button onclick="fastForward()"  title="Fast Forward 5s"><i class="fa fa-forward"></i></button>
				<!--<button onclick="gotoEnd()"      title="Go to the end of the video and mark completed"><i class="fa fa-fast-forward"></i></button>-->
				<button onclick="window.close()"    title="Make the video small" id="makeSmall"><i class="fa fa-compress"></i></button>
			</div>
		</div>
	</div> 
<script> 
var myVideo = document.getElementById("video1"); 

//myVideo.autoplay = true;
myVideo.onended = function() {
	sectionCompleted('<?php echo $SecRowId; ?>');
	
};

myVideo.onprogress = function() {
//    alert("Downloading video");
};

//Seek bar to sync with the current playing video
$("#video1").on("timeupdate", function () {
	var myVideo = $(this)[0];
	var value = (100 / myVideo.duration) * myVideo.currentTime;
	$("#seek-bar").val(value);
});

//Seek bar drag to move the current playing video at the time.
$("#seek-bar").on("mouseup", function () {
	var myVideo = $("#video1")[0];

	var currentTime = $("#seek-bar").val() / (100 / myVideo.duration);
	myVideo.currentTime = currentTime;
});

$("#seek-bar").on("mousedown", function () {
	var myVideo = $("#video1")[0];
	myVideo.pause();
});

function playPause() { 
    if (myVideo.paused) {
		document.title = "Video Playing";
        myVideo.play(); 
	}
    else {
		document.title = "PowerOffice Training - Projects Module";
        myVideo.pause(); 
	}
} 

function restart() {
	myVideo.pause();
	myVideo.currentTime = 0;
	myVideo.load();
	myVideo.play(); 
}

function rewind() {
	myVideo.pause();
	myVideo.currentTime = myVideo.currentTime - 5;
//	myVideo.load();
	myVideo.play(); 
}

function fastForward() {
	myVideo.pause();
//	alert(myVideo.currentTime);
	myVideo.currentTime = myVideo.currentTime + 5;
//	myVideo.load();
	myVideo.play(); 
}

function makeBig() { 
	document.open("runVideo.php?rowId=<?php echo $SecRowId; ?>");
    myVideo.width  = 1280; 
    myVideo.height = 720; 
	document.getElementById('makeBig').style.display='none';
	document.getElementById('makeSmall').style.display='inline';
} 

function makeSmall() { 
    myVideo.width = 320; 
    myVideo.height = 220; 
	document.getElementById('makeBig').style.display='inline';
	document.getElementById('makeSmall').style.display='none';
} 
//
//function makeNormal() { 
//    myVideo.width = 420; 
//    myVideo.height = 280; 
//} 

function gotoEnd() {
	myVideo.pause();
	myVideo.currentTime = myVideo.duration;
	myVideo.pause;
//	document.getElementById("video").style.display = 'none';
//	document.getElementById("exitBtn").style.visibility  = 'hidden';
//	document.getElementById("video").display = none;
}

function openDashboard() {
	window.location.href = 'Dashboard/';
}
</script> 
<p class="courtesy">Video courtesy of &copy; <a href="http://www.reticmaster.com/" target="_blank">Inspired Interfaces</a>.</p>
</body> 
</html>
<?php
	}
?>
