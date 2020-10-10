<?php
  require_once ("db_connect.php");
  require_once ("functions.php");

  #day: 86400 | week : 604800 | month : 2592000 | year : 31536000
  $now = time();
  
  if (!empty($_GET['overview'])) {
    $_SESSION['overview'] = $_GET['overview'];
  }
  else {
    $_SESSION['overview'] = 'daily';
  }

  if (isset($_GET['time']) != ''){
    $time = $_GET['time'];
  }
  else {
    $time = $now;
  }

  $starttime = getStartTime($_SESSION['overview'], $time);
  $endtime = getEndTime($_SESSION['overview'], $time);
  $prevStart = getPrevStartTime($_SESSION['overview'], $time);
  $nextStart = getNextStartTime($_SESSION['overview'], $time);

  $date = date('d-m-Y');
  $today = strtotime ($date);
  $endoftoday = $today + 86399;

?>