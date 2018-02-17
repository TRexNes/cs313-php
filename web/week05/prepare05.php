<?php


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
$statement = $db->query('SELECT username, password FROM note_user');
while ($row = $statement->fetch(PDO::FETCH_ASSOC))
{
  echo 'user: ' . $row['username'] . ' password: ' . $row['password'] . '<br/>';
}
?>


</div>

</body>
</html>