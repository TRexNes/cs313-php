<?php
/**********************************************************
* This file is the starting page, it allows entering of data for the DB
***********************************************************/

// The DB connection logic is in another file so it can be included
// in each of our different PHP files.

require("dbConnect.php");
$db = get_db();

?>
<!DOCTYPE html>
<html>
<head>
	<title>Player Entry</title>
	<link rel="stylesheet" type="text/css" href="playerStyle.css">
</head>

<body>

<div id="title">
<h1>Enter Player information and their stats</h1>
</div>


<form id="mainForm" action="insertStats.php" method="POST">

<div id="form">

	<input type="text" id="txtFirst_name" name="txtFirst_name"></input>
	<label for="txtFirst_name">First Name</label>
	<br /><br />

	<input type="text" id="txtLast_name" name="txtLast_name"></input>
	<label for="txtLast_name">Last Name</label>
	<br /><br />

	<input type="text" id="txtPosition" name="txtPosition"></input>
	<label for="txtPosition">Position</label>
	<br /><br />

	<input type="text" id="txtBirth_year" name="txtBirth_year"></input>
	<label for="txtBirth_year">Birth Year</label>
	<br /><br />
	
	<input type="text" id="txtBirth_country" name="txtBirth_country"></input>
	<label for="txtBirth_country">Birth Country</label>
	<br /><br />


	<input type="number" id="intGames_played" name="intGames_played"></input>
	<label for="intGames_played">Games played</label>
	<br /><br />
	
	<input type="number" id="intGoals" name="intGoals"></input>
	<label for="intGoals">Goals</label>
	<br /><br />
	
	<input type="number" id="intAssists" name="intAssists"></input>
	<label for="intAssists">Assists</label>
	<br /><br />

	<input type="number" id="intPoints" name="intPoints"></input>
	<label for="intPoints">Points</label>
	<br /><br />

	<input type="number" id="intPenalty_mins" name="intPenalty_mins"></input>
	<label for="intPenalty_mins">Penalty mins</label>
	<br /><br />

	<input type="submit" value="Add to Database" />
	<br />
	<br />
</div>

<div id=php>
	<label>Current Players:</label><br />

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
	
	echo "Error connecting to DB. Details: $ex";
	die();
}
?>

	<br />


</form>

</div>



</body>
</html>