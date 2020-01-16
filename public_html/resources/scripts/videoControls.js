function playPause() { 
    var myVideo = document.getElementById("video1"); 
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
    var myVideo = document.getElementById("video1"); 
	myVideo.pause();
	myVideo.currentTime = 0;
	myVideo.load();
	myVideo.play(); 
}

function rewind() {
    var myVideo = document.getElementById("video1"); 
	myVideo.pause();
	myVideo.currentTime = myVideo.currentTime - 5;
//	myVideo.load();
	myVideo.play(); 
}

function fastForward() {
    var myVideo = document.getElementById("video1"); 
	myVideo.pause();
//	alert(myVideo.currentTime);
	myVideo.currentTime = myVideo.currentTime + 5;
//	myVideo.load();
	myVideo.play(); 
}

function makeBig() { 
    var myVideo = document.getElementById("video1"); 
    myVideo.width  = 1280; 
    myVideo.height = 720; 
	document.getElementById('makeBig').style.display='none';
	document.getElementById('makeSmall').style.display='inline';
} 

function makeSmall() { 
    var myVideo = document.getElementById("video1"); 
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
    var myVideo = document.getElementById("video1"); 
	myVideo.pause();
	myVideo.currentTime = myVideo.duration;
	myVideo.pause;
//	document.getElementById("video").style.display = 'none';
//	document.getElementById("exitBtn").style.visibility  = 'hidden';
//	document.getElementById("video").display = none;
}

function openDashboard() {
    var myVideo = document.getElementById("video1"); 
	window.location.href = 'Dashboard/';
}
