<?php
	//Verbindung zu Databank
	$connection = mysqli_connect ("localhost", "root", "", "ihk_project_time_managment");

	if (!$connection) {
		//Fall wenn es kein Verbindung entsteht
		die('Failed to connect to DataBank: ' . mysqli_connect_errno() . mysqli_connect_error());
	} 
?>