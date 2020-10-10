<?php
session_start();
require_once ("../tmpl/header.php");
require_once ("../helper/db_connect.php");
require_once ("../helper/functions.php");
require_once ("../helper/general.php");
# prüfen nach login
if (check_login($connection) == false) { 
	header ('Location: login.php?login=false'); 
	exit; 
} 
### die Variablen für Eingabefelder

### sql: prüft ob es schon ein Eintrag für heute verfügbar ist, und gibt Koefizient von letzten Check-out aus
$last_checkout_sql = "SELECT check_out FROM reports, users, users_reports WHERE 
										 reports.id = users_reports.report_id AND 
										 users.id = users_reports.user_id AND 
										 users.id = '".$_SESSION['id']."' AND
										 reports.check_out BETWEEN '".$starttime."' AND '".$endtime."' ORDER BY	
										 reports.check_out DESC LIMIT 1";
$entry_checkout = mysqli_query($connection, $last_checkout_sql);	
$row= mysqli_fetch_assoc($entry_checkout);


$morning_that_day = $starttime +28800;// 8.00 ante meridiem
$date_to_convert = (!empty($row['check_out'])?$row['check_out']:(($_GET['time']==$today)?$now:$morning_that_day));
echo '<br>';
if (!empty($row['check_out'])) {
	echo '# '.date ("H:i # d.m.y ",$row['check_out']).'#<br><br>';
}

$date= date("Y-m-d\TH:i",$date_to_convert);
$check_out = '';
$ch_o ='type=time';
$pause = '';
$project_name = '';
$notation = '';
$work_conditions = '';
$id = '';
$send = "Bericht speichern"; //button id = send

if(isset( $_GET['id'])  != '') {
	# Daten aus SQL auslesen
	$reports_id= "	SELECT * FROM reports WHERE id = ".$_GET['id'].";";
	$result = mysqli_query ($connection, $reports_id);
	$rfill = mysqli_fetch_assoc($result);
	
	# Variablen für die Eingabefeldern
	$date = date ("Y-m-d\TH:i", $rfill['date']);
	$check_out = date ("Y-m-d\TH:i", $rfill['check_out']);
	$ch_o ='type=datetime-local';
	$pause = gmdate ("H:i", $rfill['pause']);
	$project_name = $rfill['project_name'];
	$notation = $rfill['notation'];  
	$work_conditions = $rfill['work_conditions'];
	$id = $_GET['id'];
	$send = "Bericht editieren";
}

$projects = "SELECT project_name FROM projects";
?>
<!-- Formular für täglcihen Bericht-->
<form action="<?php echo '../helper/sql.save.report.php?time='.$_GET['time'].'&overview='.$_GET['overview'] ;?>" method="post"  id="report">

	<label for="date">check-in : </label> 
	<input type="datetime-local" name="date" id="date" value="<?php echo $date; ?>"> 

	<div> 
		<label for="checkout"> check-out : </label> 
		<input <?php  echo $ch_o?>  name="checkout" id="checkout"  value="<?php echo $check_out ;?>" required> 

		<input type="time" name="pause" id="pause"  value="<?php echo $pause ;?>"> 
		<label for="pause"> : pause  </label>
	</div>

	<div> 
		<label for="project">Projectname : </label> 
		<select id="project" name="project">
		<option><?php echo $project_name;?></option>
		<?php 
		$res = mysqli_query($connection, $projects);
		while( $row = mysqli_fetch_array($res) ){
			echo	"<option >".  $row['project_name'] ."</option>";  
			}  
		?>
		</select>
	</div>

	<div>
		<label for="notation">Anmekrungen : </label> <br>
		<textarea name="notation" id="notation" cols="30" rows="3"><?php echo $notation; ?></textarea> 
	</div>	

	<label for="work_conditions">Arbeitskondition : </label>
	<select name="work_conditions" id="work_conditions">
		<option ><?php echo $work_conditions ;?></option>
		<option >Büro</option>
		<option >Home-office</option>
		<option >Beim Kunden</option>
		<option >In der Lehre</option>
		<option >Krank</option>
	</select>

	<div> 
		<input type="text" name="report_id"  hidden value="<?php  echo $id;?>"> 
		<input  type="submit" id="send" name="submit" value= "<?php echo $send;?>">
	</div>
</form>

<!--------------------------- Tasten außerhalb von Formular ------------------------>
<div>

<button name="stop_stracking" id="stop_stracking">Check-out</button>

<a href="logout.php"><button>Ausloggen</button></a>

<a href=  <?php echo "../../../index.php?time=".strtotime($date)."&overview=".$_GET['overview'].""?>><button>Rückkehr zur Hauptseite</button></a>

<!-- Taste Bericht Löschen -> nur beim Editieren sichtbar -->
<?php echo '<a href="delete.php?id='.$id.'&time='.strtotime($date).'&overview='.$_GET['overview'].'">' ?>
<input type="button" <?php echo (!isset($_GET['id'])? 'hidden':'') ;?> value="Bericht Löschen">
</a>
</div>

<script src="../../js/script.js"></script>
<?php
 require_once ("../tmpl/footer.php"); 
?>