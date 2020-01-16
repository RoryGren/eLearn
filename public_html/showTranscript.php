<?php
	include 'config.php';
	$RowId = $_REQUEST['id'];
	include 'resources/classes/classVideo.php';
	$Video  = new classVideo();
	$filename = 'resources/transcripts/' . $Video->getTranscript($RowId);
	include  $filename;
?>
