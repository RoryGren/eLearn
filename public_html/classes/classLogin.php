<?php
include 'classes/classDB.php';
/**
 *	Read only user for db;<br>
 *	Checks login validity and sets relevant session variables;<br>
 * 
 * @author rory
 */
class classLogin extends classDB {

	protected $userHashMatch;
	protected $userName;
	protected $LearnerId;
	protected $LearnerHash;
	protected $LearnerSalt;
	protected $SaltExpiry;
	protected $Today;
	private $LastLogin;

	public function __construct() {
		parent::__construct();
		$this->Today = gmdate("Y-m-d H:i:s", strtotime(" + 2 hours"));
	}

	private function safeString($UserName) {
		if (strpos($UserName, ";") > 0) {
			return FALSE;
		}
		else {
			return TRUE;
		}
	}
	
	public function getCurrentLearnerId() {
		return $this->LearnerId;
	}
	
	public function getLastLogin() {
		return $this->LastLogin;
	}
	
	public function learnerExists($userName, $userPassword) {
		$this->userName      = $userName;
		$this->userHashMatch = $userPassword;
// =============================================================================
/*	
 *	TODO =====> Check validity between createDate and ExpiryDate
 *	TODO =====> Generate hashed 'token' for 'logged in' wrapper - changes each login
 */	
		if ($this->checkExists('User', $userName)) {
			$SQL = "SELECT `LearnerId`, `Hash` FROM `Learner` WHERE UPPER(`UserName`) = UPPER('$userName')";
//			echo "$SQL<br><br>";
			$results = $this->getData($SQL);
			while ($Data = mysqli_fetch_array($results)) {
				$UserData[] = array($Data[0], $Data[1]);
			}
			$this->LearnerId   = $UserData[0][0];
			$this->LearnerHash = $UserData[0][1];
			$SaltData = $this->fetchSalt();
			$this->LearnerSalt = $SaltData[0][1];
			$this->SaltExpiry  = $SaltData[0][2];
//			echo "Date: " , date("Y-m-d") . "<br>";
			if (password_verify($this->userHashMatch . $this->LearnerSalt, $this->LearnerHash) && $this->SaltExpiry >= date("Y-M-d")) {
				$this->recordLogin();
				return TRUE;
			}
			else {
				return FALSE;
			}
		}
		else {
			echo "User does NOT exist<br>";
		}
	}

	private function checkExists($Task, $Value) {
		if ($Task === 'User') {
			$SQL = "SELECT count(`UserName`) as 'Recs' FROM `Learner` WHERE UPPER(`UserName`) = UPPER('$Value')";
		}
		elseif ($Task === 'Hash') {

		}
		$result = $this->getData($SQL);
		$Count = mysqli_fetch_assoc($result);
		if ($Count['Recs'] == 0) {
			return FALSE;
		}
		else {
			return TRUE;
		}
	}

	private function fetchSalt() {
		$SQL = "SELECT `SaltId`, `Salt`, `ExpiryDate` FROM `LearnerSalt` WHERE `Status` = 1 AND `LearnerId` = $this->LearnerId";
		$results = $this->getData($SQL);
		while ($Data = mysqli_fetch_array($results)) {
			$SaltData[] = $Data;
		}
		mysqli_free_result($results);
		return $SaltData;
	}
	
	private function recordLogin() {
		$SQL = 'SELECT `LastLogin` FROM `Learner` WHERE `LearnerId` = ' . $this->LearnerId;
		$result = $this->getData($SQL);
		$row = mysqli_fetch_assoc($result);
		$this->LastLogin = $row['LastLogin'];
		if ($this->LastLogin == '') {
			$this->LastLogin = 'Never';
		}
		mysqli_free_result($result);
		$SQL = "UPDATE `Learner` SET `LastLogin` = '" . $this->Today . "' WHERE `LearnerId` = " . $this->LearnerId;
		$result = $this->upData($SQL);
	}
}

?>
