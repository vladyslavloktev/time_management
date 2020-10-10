<?php 
session_start();
require_once ("../tmpl/header.php");
session_destroy();
header ('Location: login.php');
require_once ("../tmpl/footer.php");
exit;
?>
