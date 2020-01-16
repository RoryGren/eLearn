<?php
include_once 'classes/classDB.php';
/**
 * Description of classVideo
 *
 * @author rory
 */
class classVideo extends classDB {

	private $Transcript;
	private $Summary;
	private $Header;
	
	public function __construct() {
		parent::__construct();
//		echo "SecRowId: $SectionRowId<br>";
//		self::function();
	}
		
	public function getTranscript($SecRowId) {
		$Video = $this->findVideo($SecRowId);
		return $this->Transcript;
	}
		
	public function getSummary($SecRowId) {
		$Video = $this->findVideo($SecRowId);
		return $this->Summary;
	}
		
	public function getHeader($SecRowId) {
		$Video = $this->findVideo($SecRowId);
		return $this->Header;
	}
		
	public function getVideo($SecRowId) {
		if (is_numeric($SecRowId)) {
			return $this->findVideo($SecRowId);
		}
	}
	
	private function findVideo($SecRowId) {
//		include INC;
//		$con = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
//		if (mysqli_connect_errno()) {
//			printf("Connect failed: %s\n", mysqli_connect_error());
//		exit();
//		}
//		$QRY  = $con->prepare("SELECT b.`Data`, b.`Transcript`, b.`MainPoints`, s.`SecDescription` FROM `Section` s JOIN `iiBin` b ON s.`SecBinRowId` = b.`iiRowId` WHERE s.`RowId` = ?");
		$SQL = "SELECT b.`Data`, b.`Transcript`, b.`MainPoints`, s.`SecDescription` FROM `Section` s JOIN `iiBin` b ON s.`SecBinRowId` = b.`iiRowId` WHERE s.`RowId` = $SecRowId";
//		echo $SQL;
		$result = $this->getData($SQL);
		$Data = mysqli_fetch_assoc($result);
//		Array ( [Data] => POGC0102.mp4 [Transcript] => TSRunningPO.html [MainPoints] => MPRunningPO.html [SecDescription] => Running PowerOffice ) 
//		$QRY->bind_param("i", $SecRowId);
//		$QRY->bind_result($VideoId, $Transcript, $Summary, $Header);
//		$QRY->execute();
//		$QRY->fetch();
//		$QRY->close();
//		$con->close();
		$this->Transcript = $Data['Transcript'];
		$this->Summary    = $Data['MainPoints'];
		$this->Header     = $Data['SecDescription'];
		return $Data['Data'];
	}
	
}

?>
