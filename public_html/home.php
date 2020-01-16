<?php
	if (count($_REQUEST) == 0) {
//		header("Location: index.php");
	}
//	include "config.php";
//	include "setup.php";
	include "head.php";
//	include "topMenu.php";
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Inspired Interfaces e-Learning</title>
    </head>
    <body>
		<?php
		echo "Home Page...<br>";
		echo "<br>";
		print_r($_REQUEST);
		echo "<br><br>";
		?>
    </body>
</html>
