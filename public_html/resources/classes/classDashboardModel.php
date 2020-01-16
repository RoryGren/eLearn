<?php
include "classes/classDB.php";
/**
 * Description of classDashboardModel
 *
 * Controls all data access and manipulation for the User's dashboard
 * 
 * @author rory
 */
class classDashboardModel extends classDB {

	protected $Today;
	private $LearnerId;
	private $LearnerData; // ===> Raw learner data from DB -> String!!! <===
	private $LearnerCourses;
	private $CurrentLearnerCourse;
	private $CurrentCourseData; // Raw course data for Dashboard NAV
	private $CurrentCourseProgress;  // 1 :: Array ( [ChapterId] => 1 [SectionId] => 1 [Status] => 0 [StartDate] => 1970-01-01 [CompleteDate] => ) 
	private $CurrentCourseLearnerJSON;
	private $CourseChapterSection;

	public function __construct($learnerId) {
		parent::__construct();
		$this->Today = gmdate("Y-m-d H:i:s", strtotime(" + 2 hours"));
		$this->LearnerId = $learnerId;
		$this->setupDashboard($learnerId);
	}
	
	public function getLearnerData() { // Raw learner data from DB
		return $this->LearnerData;
	}

	public function getCurrentCourseData() {
		return $this->CurrentCourseData;
	}
	
	public function getCourseChapterSection() {
		return $this->CourseChapterSection;
	}

	public function getCurrentCourseProgress() {
		return $this->CurrentCourseProgress;
	}
	
	public function updateUserJSON($userJSON) {
		$LearnerId = $this->LearnerId;
		$CourseId  = $this->CurrentCourseData['CourseId'];
		if ($this->isSafeString($userJSON)) {
			$this->CurrentCourseLearnerJSON = $userJSON;
			$this->userJSONtoDB($LearnerId, $CourseId);
		}
		else {
			echo "Unsafe string<br>";
		}
	}
	
	private function userJSONtoDB ($LearnerId, $CourseId) {
		$SQL = "UPDATE `LearnerCourse` SET `Progress` = '$this->CurrentCourseLearnerJSON' WHERE `LearnerId` = $LearnerId AND `CourseId` = $CourseId";
//		echo "<br>" . $SQL . "<br>";
		$this->upData($SQL);
	}
	
	private function isSafeString($userJSON) {
		if (   strpos(strtoupper($userJSON), 'CREATE') == '' 
			&& strpos(strtoupper($userJSON), 'SELECT') == ''
			&& strpos(strtoupper($userJSON), 'UPDATE') == ''
			&& strpos(strtoupper($userJSON), 'INSERT') == ''
			&& strpos(strtoupper($userJSON), 'DELETE') == ''){
			return TRUE;
		}
		else {
			return FALSE;
		}
	}
	
	private function setupDashboard($learnerId) {
		// ===== Fetch basic learner course data into $this->LearnerData =====
		$this->fetchLearnerData($learnerId);
		// ===== Compile Learner Course, section progress data =====
		$this->courseChapterSectionData($this->LearnerData[0]['CourseId']); // Raw course data
//		TODO =====> getLearnerAssessmentJSON($learnerId);
	}
	
	private function courseChapterSectionData($CourseId) {
		// ===== Get Course name from DB =====
		$SQL = "SELECT c.`CourseId`, c.`Code`, c.`Description` FROM `Course` c WHERE c.`CourseId` = $CourseId AND c.`STATUS` = 1";
		$result = $this->getData($SQL);
		$this->CurrentCourseData = mysqli_fetch_assoc($result);
		mysqli_free_result($result);
		// ===== Get Course chapters and sections from DB =====
		$SQL = "SELECT s.`RowId`, c.`CourseId`, ch.`ChapterId`, ch.`ChCode`, ch.`ChDescription`, s.`SectionId`, s.`SecCode`, s.`SecDescription`, s.`SecGlyph`, s.`SecContent` FROM `Course` c JOIN `Chapter` ch ON (c.`CourseId` = ch.`CourseId`) JOIN `Section` s ON (ch.`ChapterId` = s.`ChapterId`) WHERE ch.`CourseId` = $CourseId AND ch.`STATUS` = 1 AND s.`STATUS` = 1";
		$result = $this->getData($SQL);
		while ($QRY = mysqli_fetch_assoc($result)) {
			$this->CourseChapterSection[$QRY['RowId']] = $QRY;
		}
		mysqli_free_result($result);
		// ===== Get JSON Progress data and convert into array =====
		if (is_null($this->LearnerData[0]['Progress']) || $this->LearnerData[0]['Progress'] == '') {
			// ===== If First Time user login, create empty JSON data =====
			$CurrentCourseProgress = $this->createEmptyLearnerJSON($this->CurrentLearnerCourse);
			$SQL = "UPDATE `LearnerCourse` SET `Progress` = '$CurrentCourseProgress', `LastAccessDate` = '" . $this->Today . "' where `LearnerId` = $this->LearnerId AND `CourseId` = $CourseId";
			$this->putData($SQL);
			$this->CurrentCourseProgress = json_decode($CurrentCourseProgress, TRUE); // TRUE returns assoc array, FALSE returns Object
		}
		else {
			$CurrentCourseProgress = $this->LearnerData[0]['Progress'];
			$JSON = json_decode($CurrentCourseProgress, true);
			$TotalSectionCount = count($this->CourseChapterSection);
			if (!isset($JSON['Progress']['Total']) || $JSON['Progress']['Total'] != $TotalSectionCount) {
				$JSON['Progress']['Total'] = $TotalSectionCount;
			}
			$SQL = "UPDATE `LearnerCourse` SET `LastAccessDate` = '" . $this->Today . "' where `LearnerId` = $this->LearnerId AND `CourseId` = $CourseId";
			$this->putData($SQL);
			$this->CurrentCourseProgress = $JSON;
		}
	}
	
	private function fetchLearnerData($learnerId) {
		$SQL = "SELECT l.`FName`, l.`SName`, l.`LastLogin`, c.`CompanyCode`, c.`CompanyDesc`, lc.`CourseId`, lc.`LastAccessDate`, lc.`Progress`, lc.`Assess` FROM `Learner` l JOIN `Company` c ON (l.`CompanyId` = c.`CompanyId`) JOIN `LearnerCourse` lc ON (l.`LearnerId` = lc.`LearnerId`) WHERE l.`LearnerId` = $learnerId AND lc.`CompleteDate` IS NULL ORDER BY lc.`LastAccessDate` DESC";
		$result = $this->getData($SQL);
		while ($QRY = mysqli_fetch_assoc($result)) { // =====> All courses registered to user with [0] being last accessed (from ORDER BY in SQL)
			$this->LearnerData[] = $QRY; 
		}
		mysqli_free_result($result);
		$this->CurrentLearnerCourse = $this->LearnerData[0]['CourseId'];
	}

	private function createEmptyLearnerJSON($SelectedCourseId) {
		foreach ($this->CourseChapterSection as $Key => $Value) {
			$EmptyLearner[$Value['RowId']] = array (
				'ChapterId'    => $Value['ChapterId'], 
				'SectionId'    => $Value['SectionId'], 
				'RowId'		   => $Key, 
				'Status'       => 0, 
				'StartDate'    => '1970-01-01', 
				'CompleteDate' => NULL
			);
		}
		$ProgressCount = $Key;
		$EmptyLearner['LastAccessed']['SecRowId']          = 0;
		$EmptyLearner['LastAccessed']['LastActiveChapter'] = 0;
		$EmptyLearner['LastAccessed']['SecCode']           = 0;
		$EmptyLearner['LastAccessed']['DateTime']          = '1970-01-01 00:00:00';
		$EmptyLearner['FirstAccess']			           = $this->Today;
		$EmptyLearner['Progress']['Total']		           = $ProgressCount;
		$EmptyLearner['Progress']['Complete']	           = 0;
		$EmptyLearner['CourseModVer']			           = 0;
		return json_encode($EmptyLearner);
	}
	
	private function execSQL($task, $SQL) {
/*	=======================================
 *		$task : S = SELECT
 *		$task : U = UPDATE
 *		$task : I = INSERT
 *	=======================================
 */		
//		include INC;
//		echo "$task :: $SQL";

/*		$con = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
		if (mysqli_connect_errno()) {
			printf("Connect failed: %s\n", mysqli_connect_error());
		exit();
		}
		$QRY  = $con->prepare($SQL);
		$QRY->execute();
 */
		if ($task === "S") {
//			echo "<br>$SQL<br>";
//			$result = $QRY->get_result();
			$result = $this->getData($SQL);
			while ($Data = mysqli_fetch_assoc($result)) {
				$All[] = $Data;
			}
//			$All = $result->fetch_all(MYSQLI_ASSOC);
			$result->free_result();
		}
		elseif ($task === "I") {
			$result = $this->putData($SQL);
			$All = $result->insert_id;
		}
/*		$result->close();
		$con->close(); */
		if (isset($All)) {
			return $All;
		}
	}
}

?>
