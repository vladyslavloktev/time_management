<?php
	session_start();
	require_once ("data/php/tmpl/header.php");		
	require_once ("data/php/helper/db_connect.php");
	require_once ("data/php/helper/functions.php");
	require_once ("data/php/helper/general.php");
	# prüfen nach login
	if (check_login($connection) == false) { 
		header ('Location: data/php/pages/login.php?login=false'); 
		exit; 
	} 
	# SQL-Angabe für die Tabelle	
	$sqlstat = "SELECT * FROM reports, users_reports, users WHERE 
							reports.id = users_reports.report_id AND 
							users.id = users_reports.user_id AND 
							users.id = '". $_SESSION['id']. "' AND 
							reports.date BETWEEN '". $starttime  ."' AND 
							'". $endtime ."' ORDER BY reports.date   ASC;";
	$entries = mysqli_query ($connection, $sqlstat);

	# Begrüßung
	echo 'Hi : <b style="color: chocolate;">' .$_SESSION['username']. '</b> ! <hr>';

	# Period - Zeit zwischen Anfanszeit($startzeit) und Endzeit($endtime)
	$period = ($_GET['overview']!='daily')?date('d.m.Y', $starttime).'-'. date('d.m.Y',$endtime):date('d.m.Y', $starttime);
	echo 'Übersichtsperiod : | ',$period.' |<hr>' ;

	# Tabelle
	if(mysqli_num_rows($entries) > 0){
		# Tabellenüberschrift
		echo '
		<table id="period_table">
			<tr class="tablerow">
				<th class="thead">Datum</th>
				<th class="thead">Projektname</th>
				<th class="thead">Anmerkung</th>
				<th class="thead">Arbeitskondition</th>
				<th class="thead">Check-in</th>
				<th class="thead">Check-out</th>
				<th class="thead">Pause</th>
				<th class="thead">Zeitübersicht</th>
			</tr>';
		
		while($row_e = mysqli_fetch_assoc($entries)){

			$date = date('d.m.Y', $row_e['date']);

			$checkin = gmdate('H:i', $row_e['date'] - $today );
			$checkout = gmdate('H:i', $row_e['check_out'] - $today );
			$pause = gmdate('H:i', $row_e['pause'] );
			$in	=  strtotime($checkin);
			$out = strtotime($checkout);
			$p = strtotime($pause) - $today;
			$day_overall = gmdate("H:i",$out - $in - $p);

		### Tabellenzeilen für die Übersicht
			echo ' 
				<tr>
					<td class="tbody">'. $date.'</td>
					<td class="tbody">'. $row_e['project_name'] .'</td>
					<td class="tbody">'. $row_e['notation'] .'</td>
					<td class="tbody">'. $row_e['work_conditions'] .'</td>
					<td class="tbody">'. $checkin .'</td>
					<td class="tbody">'. $checkout .'</td>
					<td class="tbody">'. $pause .'</td>
					<td class="tbody">'. $day_overall.'</td>
					<td>'. generateButton('Bericht Editieren','data/php/pages/new.report.php?time='.$_GET['time'].'&id='.$row_e['report_id'].'&overview='.$_GET['overview'],'edit') .'	</td>
				</tr>
			';
			}
		echo '</table>';
	}
	else {
		echo ' <span style="color:#D93358">#!#</span> Es gibt noch kein Eintrag ';
	}
### Taste : Neuen Bericht erstellen
	echo "<br><div>", generateButton('Neuen Bericht erstellen','data/php/pages/new.report.php?time='.$_GET['time'].'&overview='.$_GET['overview'],'newtask');
		echo "<a href=index.php?time=".$today."&overview=daily>";?><input type='button' 
		<?php echo (($_GET['time']>=$today&&$_GET['time']<=$endoftoday)? 'hidden':'')?> value='today'/>

<?php				
		echo	"</a>";	
	echo "</div><br>";

### Tasten für periodische Übersicht
 	echo '<div class="test">';
		echo generateButton('vorherige', 'index.php?time='. $prevStart .'&overview='. $_SESSION['overview'], 'prev');
		echo generateButton('Tagesübersicht', 'index.php?time='.$_GET['time'].'&overview=daily', 'daily');
		echo generateButton('Wöchentlichen Übersicht', 'index.php?time='.$_GET['time'].'&overview=weekly', 'weekly');
		echo generateButton('Monatlichen Übersicht', 'index.php?time='.$_GET['time'].'&overview=monthly', 'monthly');
		echo generateButton('nächste', 'index.php?time='. $nextStart .'&overview='. $_SESSION['overview'], 'next');
	echo '</div><br>';

### Ausloggen-Taste
	echo generateButton('Ausloggen','data/php/pages/logout.php', 'signout');

	include ("data/php/tmpl/footer.php");
?>




