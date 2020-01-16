<?php
	session_start();
	session_set_cookie_params(1);
	session_unset();
	session_destroy();
?>
<meta http-equiv="refresh" content="3;url=index.php">
<h3>Logging you out</h3>

