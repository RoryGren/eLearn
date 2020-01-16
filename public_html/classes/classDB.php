<?php

/**
 * Connects to Database & runs mysqli queries<br>
 *
 * @author rory
 */
	
class classDB extends MYSQLi { 
	//Establish Connection 
	function __construct() { 
		/*
		 * Initialises mysqli database connection
		 */
		include INC;
//		echo "<br>INC: " . INC . "<br>";
		$this->connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME); 
//		echo "$DB_HOST, $DB_USER, $DB_PASS, $DB_NAME<br>";
	} 

	//Select Query 
	protected function getData($SQL) { 
		return $this->query($SQL);
	} 

	//Insert Query 
	protected function putData($SQL) { 
		$this->query($SQL);
	} 

	//Update Query 
	protected function upData($SQL) { 
		$this->query($SQL);
	} 

	//Delete Query 
	protected function remData($SQL) { 
		$this->query($SQL);
	} 

}

?>
