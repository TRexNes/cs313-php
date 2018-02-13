<?php
/**********************************************************
* File: viewScriptures.php
* Author: Br. Burton
* 
* Description: This file shows an example of how to query a
*   PostgreSQL database from PHP.
***********************************************************/



try
{
  $user = 'postgres';
  $password = 'avsnut';
  $db = new PDO('pgsql:host=127.0.0.1;dbname=postgres', $user, $password);
}
catch (PDOException $ex)
{
  echo 'Error!: ' . $ex->getMessage();
  die();
}
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

<body>
<div>

<h1></h1>

<?php
foreach ($db->query('SELECT username, password FROM note_user') as $row)
{
  echo 'user: ' . $row['username'];
  echo ' password: ' . $row['password'];
  echo '<br/>';
}
?>


</div>

</body>
</html>