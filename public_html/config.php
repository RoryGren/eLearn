<?php
if ($_SERVER['SERVER_NAME'] === 'localhost') {
// ===================================================================
// ===== Comment these out for production. Debug Error Messages. =====
// ===================================================================
	ini_set('display_startup_errors', 1);
	ini_set('display_errors', 1);
	error_reporting(-1);
// ===================================================================
}
// ======================================================
// =====> Production Config constants and settings <=====
// ======================================================
date_default_timezone_set('Africa/Johannesburg');

// ================================
// =====> PHP Root Constants <=====
// ================================

define('WEB_ROOT', dirname(__FILE__) . '/');	// /Users/rory/Sites/ii-eLearning/public_html/
define('BASE', dirname(WEB_ROOT));				// /Users/rory/Sites/ii-eLearning
define('DOM', $_SERVER['SERVER_NAME']);			// localhost
define('HEAD', BASE . '/elearning/resources/common/head.php');
/* File containing DB connection details */
if ($_SERVER['SERVER_NAME'] === 'localhost') {
	define('INC', BASE . '/online.eLearning.Incs/eLconn.php');
//	echo "<br>INC: " . INC . "<br>";
}
else {
	define('INC', '/hsphere/local/home/c350324/online.eLearning.Incs/eLconn.php');
}

// =================================
// =====> HTML Root Constants <=====
// =================================

define('COMMON', '/elearning/resources/common');
define('STYLE', COMMON . '/style/');
define('JS', COMMON . '/js/');
define('VIDEO', COMMON . '/video/');

?>
