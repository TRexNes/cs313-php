<?php
/**********************************************************
* This file shows th data in the updated database
***********************************************************/
require("dbConnect.php");
$db = get_db();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Player and Stats List</title>
	<link rel="stylesheet" type="text/css" href="playerStyle.css">
</head>

<body>


<div id="title">
<h1>Player and Stats List</h1>
</div>
<div id="php">
<?php
try
{
	
	
	$statement = $db->prepare('SELECT players.last_name, stats.games_played, stats.goals, stats.assists, stats.points, stats.penalty_mins FROM stats JOIN players ON players.player_id=stats.id');
	$statement->execute();
	// Go through each result
	while ($row = $statement->fetch(PDO::FETCH_ASSOC))
	{
		echo '<p>';
		echo 'Player Name: '. $row['last_name'];
		echo '<br />';
		echo 'Games Played: '. $row['games_played'] . ' Goals: ' . $row['goals'] . ' Assists: ';
		echo $row['assists'] . ' Points: ' . $row['points'] . ' Penalty Mins: ';
		echo $row['penalty_mins'] . '</strong>';
		echo '<br />';
		echo '</p>';
	}
}
catch (PDOException $ex)
{
	echo "Error with DB. Details: $ex";
	die();
}
?>

</div>

</body>
</html>