<?php
	ini_set('display_startup_errors', 1);
	ini_set('display_errors', 1);
	error_reporting(-1);
	include 'config.php';
	include INC;
	include 'head.php';
?>
    <body>
		<script>
			$(function(){   
				$('head').append( $('<link rel="stylesheet" type="text/css" />').attr('href', 'style/e-Style.min.css') );
				$('head').append( $('<script type="text/javascript" /></script').attr('src', 'resources/scripts/videoControls.min.js') );
				document.title = "PowerOffice Course POJ123";
				});
		</script>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-1 padded-top">
					<button class="btn btn-primary btn-block" title='Course Dashboard' onclick="openDashboard();"><i class="glyphicon glyphicon-menu-hamburger"></i> Dashboard</button>
				</div>
				<div class="col-lg-10 text-center title">
					<h2>Running PowerOffice</h2>
				</div>
				<div class="col-lg-1">
					<button onclick="exit()" id="exitBtn" style= "visibility:hidden;"><i class="fa fa-close"></i> EXIT</button>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-1 padded-top"></div>
				<div class="col-lg-10 text-center">
					<div id="video" style="text-align:center; background-color: #222;"> 
						<video id="video1" width="1280" height="720" onclick="playPause()">
							<source src="resources/video/POJC0104.mp4" type="video/mp4">
							Your browser does not support the <code>video</code> tag.
						</video>
					</div>
				</div>
				<div class="col-lg-1 padded-top"></div>
			</div>
			<div class="row">
				<div class="col-lg-1 padded-top"></div>
				<div class="col-lg-10 text-center">
					<button onclick="restart()"      title="Restart the video"><i class="fa fa-fast-backward"></i></button>
					<button onclick="rewind()"       title="Step Back 5s"><i class="fa fa-backward"></i></button>
					<button onclick="playPause()"    title="Play / Pause"><i class="fa fa-play"></i> / <i class="fa fa-pause"></i></button> 
					<button onclick="fastForward()"  title="Fast Forward 5s"><i class="fa fa-forward"></i></button>
					<button onclick="gotoEnd()"      title="Go to the end of the video and mark completed"><i class="fa fa-fast-forward"></i></button>
					<button onclick="makeBig()"      title="Make the video Full Size" id="makeBig" style="display: none;"><i class="fa fa-expand"></i></button>
					<button onclick="makeSmall()"    title="Make the video small" id="makeSmall"><i class="fa fa-compress"></i></button>
					<button onclick="gotoEnd()"		 title="Go to the end of the video and mark the video as completed"><i class="fa fa-check"></i> Mark Complete</button>
				</div>
				<div class="col-lg-1 padded-top"></div>
			</div>
		</div>
    </body>
</html>
