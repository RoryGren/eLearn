<?php
	if (!$_SESSION) {
		session_start();
	}
	$learnerId = $_SESSION['learner'];
	$loggedIn  = $_SESSION['loggedIn'];
	$Token = "User" . $learnerId . "HasLoggedInSuccessfullyThankYouVeryMuch<br>";
//	$SecRowId = "None";
//echo "<br><br>";
//print_r($_REQUEST);
//echo "<br><br>";
	if (($learnerId == '') || (!$Token === $loggedIn)) {
		$_SESSION['loggedIn'] = 'Wrong';
		session_destroy();
		header("location: index.php");
	}
	else {
		require_once 'config.php';
		if (!isset($_REQUEST['secRowId'])) {
			include 'welcome.html';
		}
		else {
		$SecRowId = $_REQUEST['secRowId'];
		include 'resources/classes/classVideo.php';
		$Video  = new classVideo();
//		echo "<br>$SecRowId<br>";
		$VidSrc = "resources/video/" . $Video->getVideo($SecRowId);
?>

		<script>
			$(document).ready(function () {
				$('#secHeader').html('<?php echo $Video->getHeader($SecRowId); ?>');
			});
		</script>

		<div id="vid" class="container-fluid"> 
			<div class="row">
				<div class="col col-lg-12">
					<h3 id="secHeader" class="videoHeaderText no-top-padding"></h3>
			
					<?php
						if ($VidSrc === "resources/video/") {
							echo '<img src="graphics/NotAvailable.gif" alt=""/>';
						}
						else {
					?>
					<video id="video1" poster="graphics/loader.gif" preload="auto" onclick="playPause()">
						<source src="<?php echo $VidSrc; ?>" type="video/mp4">
						Your browser does not support the <code>video</code> tag.
					</video>
					<?php 
						}
					?>
				</div>
			</div>
			<!--<br><br>-->
			<div class="row" style="padding-top: 10px; ">
				<div class="col col-lg-12">
					<input type="range" id="seek-bar" value="0">
					<button onclick="restart()"      title="Restart the video"><i class="fa fa-fast-backward"></i></button>
					<button onclick="rewind()"       title="Step Back 5s"><i class="fa fa-backward"></i></button>
					<button onclick="playPause()"    title="Play / Pause"><i class="fa fa-play"></i> / <i class="fa fa-pause"></i></button> 
					<button onclick="fastForward()"  title="Fast Forward 5s"><i class="fa fa-forward"></i></button>
					<button onclick="gotoEnd()"      title="Go to the end of the video and mark completed"><i class="fa fa-fast-forward"></i></button>
					<button onclick="window.open('runVideoFullScreen.php?SecRowId=<?php echo $SecRowId; ?>')" title="Make the video Full Size" id="makeBig"><i class="fa fa-expand"></i></button>
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

$('#video1').on('loadstart', function (event) {
//	alert('LoadStart');
//	$(this).addClass('background');
//	$(this).attr("poster", "graphics/loader.gif");
});

$('#video1').on('canplay', function (event) {
//	alert('CanPlay');
//	$(this).removeClass('background');
	$(this).removeAttr("poster");
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
	$('btnToggleComplete').removeAttr('disabled');
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
//	alert("runFullVideo.php?rowId=<?php // echo $SecRowId; ?>");
	document.open("runFullVideo");
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
<?php
		}
	}
?>
