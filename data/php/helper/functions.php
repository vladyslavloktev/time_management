<?php
# Funktion, die prüft  Richtigkeit von Einloggen
function check_login($connection) {
	if(isset($_SESSION['login']) == '' || $_SESSION['login'] == false ) {
		if (isset($_POST["username"]) && isset($_POST["password"])) {
			$sql = "SELECT * FROM users WHERE username = '". $_POST['username'] . "' AND 
							password = '". $_POST['password'] ."';" ;
			$result = mysqli_query($connection, $sql);
			if (mysqli_num_rows($result) == 1) {
				$_SESSION['username'] = mysqli_real_escape_string($connection, $_POST['username']);
				$_SESSION['id'] = mysqli_fetch_assoc($result)['id']; 
				$_SESSION['login'] = true;
				return true;
			}
			return false;
		}
		return false;
	}
	return true;
}
###############################################################

# Funktionalität für Übersict on Anfangs- und Endzeitraum
function getStartTime($overview, $timestamp) {
	switch ($overview) {
		case 'weekly':
			$startime = strtotime('this week monday', $timestamp);
			break;

		case 'monthly':
			$startime = strtotime('first day of this month midnight', $timestamp);
			break;
		
		default:
			# DAILY
			$startime = strtotime("midnight", $timestamp);
			break;
	}
	return $startime;
}
function getEndTime($overview, $timestamp) {
	switch ($overview) {
		case 'weekly':
			//Erste Tag der Woche * 7 Tage - 1 Secunde
			$endtime = strtotime('monday this week', $timestamp) + (86400 * 7) -1;
			break;

		case 'monthly':
			// Letzten Tag der Monat um 00:00 + 1 Tag in Secunden - 1 Secunde
			$endtime = strtotime('last day of this month midnight', $timestamp) + 86399;
			break;
		
		default:
			# DAILY
			// Tag um 00:00 + 1 Tag in Secunden - 1 Secunde
			$endtime = strtotime("midnight", $timestamp) + 86399;
			break;
	}
	return $endtime;
}
#####################################################################

#Funtionalität für Tasten "Nächste" und "Vorherige"
function getPrevStartTime($overview, $timestamp) {
	$currentStart = getStartTime($overview, $timestamp);
	$prevStart = getStartTime($overview, $currentStart - 1);
	return $prevStart;
}

function getNextStartTime($overview, $timestamp) {
	$currentEnd = getEndTime($overview, $timestamp);
	$nextStart = $currentEnd + 1;
	return $nextStart;
}
######################################################################

# Funktion generiert eine belibiege Taste
function generateButton($label, $url, $class) {
  return '<a href="'. $url .'"><button class="'. $class .'">'. $label .'</button></a>';
}
######################################################################

?>