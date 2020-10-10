<?php 
require_once ("../tmpl/header.php");
require_once ("../helper/db_connect.php");
require_once ("../helper/functions.php");
require_once ("../helper/general.php");
?>


<form class="login" action="../../../index.php?time=<?php echo $today;?>&overview=daily" method="post">
	<img src="../../img/login.png" alt="logIMGin" id="login">
	<div><input type="text" name="username" placeholder=" Ihre Nutzername eingeben" required></div>
	<div><input type="password" name="password" placeholder=" Ihren Kennwort eingeben" required></div>
	<div><input type="submit" value="LogIn"></div>
</form>



<?php 
//prüfen nach einstimmung 
if(isset($_GET['login']) != '') {
	if($_GET['login'] == 'false') {
		echo '<p id="fail">Falsche Kennwort oder Nutzername</p>';
	}
}

include ("../tmpl/footer.php"); 
?>
