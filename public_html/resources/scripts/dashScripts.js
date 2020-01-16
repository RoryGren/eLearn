
function displayVideo(rowId) {
	
	// ===== Hide and empty current video Container =====
//	$('#vidContainer').fadeOut('fast');
//	$('#vidContainer').html('');
	
	// ===== Prepare toggle buttons for new video (RHS) =====
	$('#btnToggleVideo').removeAttr('disabled');
	$('#showVideo').hide();      // ===== #btnToggleVideo hide text "Show Video"
	$('#showTranscript').show(); // ===== #btnToggleVideo show text "Show Transcript"
	$('#btnToggleComplete').prop('disabled','disabled'); // ===== disable "Completed" button

	// ===== Prepare top Navbar button statuses =====
	$('#menu-Home').removeClass('active');
	$('#menu-How').removeClass('active');
	$('#vidTranscript').hide();
	
	// ===== Prepare learner record with new selection data =====
	sectionStarted(rowId); // ===== collate local data =====
	displayInDiv(rowId, 'Transcript');
	changeVideo(rowId);
	resetDisplay();

//	$('#vidContainer').fadeIn('normal');

//	displayInDiv(rowId, 'Summary');
}

function resetDisplay() {
	// ===== Reset display divs for toggling =====
	$('#vidTranscript').hide();
	$('#vidContainer').show();
}

function switchVideo() {
	$('#vidContainer').toggle();
	$('#vidTranscript').toggle();
	$('#showVideo').toggle();
	$('#showTranscript').toggle();
}

function changeVideo(rowId) {
	$.ajax({
		url: 'runVideo.php',
		data:{"secRowId":rowId},
		type: 'GET',

		success: function(data){
			$('#vidContainer').html(data);
		}
	})
}

function chapterClicked(chapterId) {
	resetDisplay();
//	alert('You clicked chapter header '+chapterId);
//	$('#vidContainer').fadeOut('fast');
//	$('#vidContainer').fadeIn('normal');
	$('#vidContainer').load('welcome.html');
}

function sectionStarted(rowId) {
	// ===== Prepare user progress record =====
	var currentDate = new Date($.now());
	var userProgress = sessionStorage.getItem('userProgress');
	var currentJSON = JSON.parse(userProgress);
	var previousRow = currentJSON['LastAccessed']['SecRowId'];
	var clickedRow  = currentJSON[rowId];
	if (clickedRow['Status']=='0') {
		console.log("clickedRow status = 0");
		currentJSON[rowId]['Status']    = 'Started';
		currentJSON[rowId]['StartDate'] = currentDate;
	}
	currentJSON['LastAccessed']['SecRowId']          = rowId;
	currentJSON['LastAccessed']['LastActiveChapter'] = clickedRow['ChapterId'];
	currentJSON['LastAccessed']['SecCode']           = clickedRow['ChapterId'];
	sessionStorage.setItem("userProgress", JSON.stringify(currentJSON));
	updateProgressBar();
	if (clickedRow['Status']!=='Viewed') {
		$('#btnToggleComplete').removeAttr('disabled');
	}
	// ===== Write local UserProgress to database ===
	updateUserProgress();
	// ===== Update left Nav buttons formatting =====
	if (previousRow > 0 && currentJSON[previousRow]['Status'] != 'Viewed') {
		$('#StatusGlyph-'+previousRow).prop('title','');
		$('#StatusGlyph-'+previousRow).html('');
		$('#'+previousRow).removeClass('lastActive');
		$('#'+previousRow).addClass('text-black');
	}
	if (currentJSON[rowId]['Status'] != 'Viewed') { // === Not completed or viewed ===
		$('#StatusGlyph-'+rowId).prop('title','Last Accessed - click to continue');
		$('#StatusGlyph-'+rowId).html('<span class="glyphicon glyphicon-road text-brown text-very-right"></span>');
		$('#'+rowId).removeClass('text-black');
		$('#'+rowId).addClass('lastActive');
	}
	
}

function sectionCompleted() {
	var currentDate = new Date($.now());
	var currentJSON = JSON.parse(sessionStorage.getItem('userProgress'));
	var clickedRow  = currentJSON['LastAccessed']['SecRowId'];
	if (currentJSON[clickedRow]['CompleteDate'] == null) {
		if (confirm("This section will be marked as Viewed. Are you sure?")) {
			// ===== Update User JSON Record =====
			currentJSON[clickedRow]['Status']       = 'Viewed';
			currentJSON[clickedRow]['CompleteDate'] = currentDate;
			
			// ===== Update Nav Display =====
			// ===== update tr colours & border =====
			$('#'+clickedRow).removeClass('lastActive');
			$('#'+clickedRow).addClass('viewed');
			// ===== add abbr title =====
			$('#StatusGlyph-'+clickedRow).prop('title','Assessment Not Completed')
			$('#StatusGlyph-'+clickedRow).html('<span class="glyphicon glyphicon-question-sign text-red text-very-right"></span>');
			// ===== update right-hand buttons =====
			// ===== update JSON in localstorage =====
			sessionStorage.setItem("userProgress", JSON.stringify(currentJSON));
			updateProgressBar();
			updateUserProgress(); // ===== Writes to DB =====
		}
	}
	var userProgress = sessionStorage.getItem('userProgress');
}

function updateUserProgress() {
	// ===== Writes local UserProgress to database ===
	var currentJSON = JSON.parse(sessionStorage.getItem('userProgress'));
	$.ajax({
		url: 'updateUserCourseObj.php',
		data: {
			learnerId: sessionStorage.getItem('learnerId'),	 
			courseId : sessionStorage.getItem('courseId'),	 
			loggedIn : sessionStorage.getItem('loggedIn'), 
			UserName : sessionStorage.getItem('UserName'),   
			userJSON:JSON.stringify(currentJSON)
		},
		success: function(data){
			$('#divTest').html(data);
		}
	});
}

function updateProgressBar() {
	var currentJSON   = JSON.parse(sessionStorage.getItem('userProgress'));
	console.log(currentJSON['Progress']['Total']);
	var maxSections   = currentJSON['Progress']['Total'];
	var numComplete   = 0;
	for (var i = 1; i <= maxSections; i++) {
		if (currentJSON[i]['Status'] === 'Viewed') {
			numComplete++;
		}
	}
	currentJSON['Progress']['ViewedTotal'] = numComplete;
	var percentageComplete = parseInt(numComplete / maxSections* 100);
	$('#viewedProgress').css('width',percentageComplete+'%');
	$('#viewedProgress').prop('aria-valuenow',percentageComplete);
	$('#viewedProgress').text(percentageComplete+'% Complete');
	sessionStorage.setItem("userProgress", JSON.stringify(currentJSON));
}

function displayInDiv(rowId, typeName) {
	/*
	*	===== Transcript =====
	*/
	if (rowId != '') {
		$.ajax({
			url : 'show' + typeName + '.php',
			data:{"id":rowId},
			type: 'GET',

			success: function(data){
				$('#vid' + typeName).html(data);
			}
		});
	}
	else {
		$('#vidTranscript').empty();
	}
}

function logout() {
//	alert('You clicked the Logout Button!');
	if (confirm('Are you sure you want to Log out?')) {
		window.location.href='logout.php';
	}
}

function setActive(elementId, sender) {
	if (sender == '') {
		$('#menu-Dash').removeClass('active');
		$('#menu-Home').removeClass('active');
		$('#menu-Profile').removeClass('active');
	}
	else {
		$('#'+elementId).siblings().removeClass('active');
	}
	$('#'+elementId).addClass('active');
}

function showWelcome() {
	$('#vidContainer').load('welcome.html');
	$('#vidTranscript').empty();
	$('#btnToggleVideo').prop('disabled','disabled');
	$('#btnToggleComplete').prop('disabled','disabled');
	// ===== Reset display divs for toggling =====
	resetDisplay();
}

function showProfile(buttonId) {
	var divId = '#profileBody';
	var fileName = buttonId+'.php';
	setActive(buttonId,'profile');
	if (buttonId == 0) {
		$('#menu-Home').addClass('disabled');
		$('#menu-Home').addClass('no-entry');
		$('#main').load('learner.php');
	}
	else {
		setActive(buttonId,'profile');
		$(divId).load(fileName);
	}
}
