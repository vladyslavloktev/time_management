<?php
session_start();
require_once ("../tmpl/header.php");
require_once ("../helper/db_connect.php");
require_once ("../helper/functions.php");
require_once ("../helper/general.php");
### Löschen von entstehenden Eintrag
### fragen nach ja oder nein
echo '<h1 style="color:#b50000">Möchten Sie wirklich diesen Bericht löschen?</h1>';
echo '<form method="post">
      <input type="submit" value="ja" name="ja">
      </form>
      '.generateButton('nein','new.report.php?id='.$_GET['id'].'&time='.$_GET['time'].'&overview='.$_GET['overview'].'','delno').'';
     
### Löschen aus der SQL-DB
if(isset($_POST['ja'])) {
  $select_all = "SELECT * FROM reports, users_reports, users WHERE 
               reports.id = users_reports.report_id AND 
               users.id = users_reports.user_id";
  $entries = mysqli_query ($connection, $select_all);
  $row_e = mysqli_fetch_assoc($entries);
  $delete_reports = "DELETE FROM reports WHERE id = ".$_GET['id'].";";
  $delete_user_reports = "DELETE FROM users_reports WHERE report_id = ".$_GET['id'] .";";
  mysqli_query ($connection, $delete_reports );
  mysqli_query ($connection, $delete_user_reports );

  header("Location: ../../../index.php?time=".$_GET['time']."&overview=".$_GET['overview']."");
}



require_once ("../tmpl/footer.php");
?>