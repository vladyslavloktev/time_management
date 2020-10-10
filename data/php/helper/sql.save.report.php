<?php
session_start();
require_once ('../tmpl/header.php');
require_once ("../helper/db_connect.php");
require_once ("../helper/functions.php");
require_once ("../helper/general.php");

$pause = date_parse($_POST['pause']);
$pause_in_sec = $pause['hour']*3600 + $pause['minute']*60;

$secure_post_notation = mysqli_real_escape_string($connection, $_POST['notation']);

//	Aktualisieren von vorhanden SQL-Zeile
if($_POST['submit']=='Bericht editieren'){
	$update_task = "UPDATE reports  SET 
									date = ".strtotime($_POST['date']).", 
									check_out = ".strtotime($_POST['checkout']).", 
									pause = '".$pause_in_sec."', 
									project_name = '".$_POST['project']."', 
									notation = '".$secure_post_notation."', 
									work_conditions = '".$_POST['work_conditions'] ."'
									WHERE	id = ". $_POST['report_id']. ";";

	if (mysqli_query($connection, $update_task)){
		header("Location:	../../../index.php?time=".strtotime($_POST['date'])."&overview=".$_GET['overview']."");
	}
	else {
		echo '<br><br>ERROR: ' . mysqli_error($connection);
	}
}

// Einfügen von neue SQL-Zeile
else {
	$insert_daily_report = "INSERT INTO reports (
													date, 
													check_out, 
													project_name, 
													notation, 
													pause, 
													work_conditions
												) VALUES (
													'". strtotime($_POST['date']) ."',
													'". strtotime($_POST['checkout']) ."',
													'". $_POST['project'] ."',
													'". $secure_post_notation ."',
													'". $pause_in_sec ."',
													'". $_POST['work_conditions'] ."'
												)";

	if (mysqli_query($connection, $insert_daily_report)){
		header('Location: ../../../index.php?time='.strtotime($_POST['date']).'&overview='.$_GET['overview'].'');
	}
	else {
		echo '<br><br>ERROR: ' . mysqli_error($connection);
	}
	
	// Einfügen in der users_reports Tabelle
	$report_id = mysqli_insert_id($connection);
	$select_id_from_dai ="SELECT id FROM reports WHERE id = " .$report_id.";";
	$dai_repo_id =  mysqli_query ($connection, $select_id_from_dai);
	if (mysqli_num_rows($dai_repo_id) > 0) {
		while($rowb = mysqli_fetch_assoc($dai_repo_id)){
			$insert_users_daily_fk = "INSERT INTO users_reports (user_id, report_id) 
																VALUES ('". $_SESSION['id'] ."','". $rowb['id'] ."')";
			if(!mysqli_query($connection, $insert_users_daily_fk)) {
				echo '<br><br> ForeignKeys ERROR: ' . mysqli_error($connection) . '<br>';
			}
		}
	} 
}

require_once ('../tmpl/footer.php');
?>