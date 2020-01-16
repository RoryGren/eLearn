<?php
include 'classes/classLogin.php';
/**
 * Description of classUser
 *
 * @author rory
 */
class classLearner extends classLogin {

	//put your code here
	public function __construct($learnerId) {
		parent::__construct();
//		$this->se
		echo 'LearnerId: ' . $learnerId . "<br>";
//		self::function();
	}
	
}

?>
