<?php
	if(count($_GET)>0) {
		$conn = mysqli_connect("localhost","root","","foodapp");
		$result = mysqli_query($conn,"SELECT * FROM usuarios WHERE userName='" . $_GET["userName"] . "' and password = '". $_GET["password"]."'");
		"SELECT * FROM users WHERE userName='" . $_GET["userName"] . "' and password = '". $_GET["password"]."'";
		$count  = mysqli_num_rows($result);
		print $count;
		mysqli_close($conn);
	}
?>