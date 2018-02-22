<?php
/**********************************************************
* File: topicEntry.php
* Author: Br. Burton
* 
* Description: This is the PHP file that the user starts with.
*   It has a form to enter a new scripture and topic.
*   It posts to the insertTopic.php page.
***********************************************************/
// The DB connection logic is in another file so it can be included
// in each of our different PHP files.
require("dbConnect.php");
$db = get_db();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Topic Entry</title>
</head>

<body>
<div>

<h1>Enter Player information and their stats</h1>

<form id="mainForm" action="insertStats.php" method="POST">

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


	<label>Current Players:</label><br />

<?php
// This section will now generate the available check boxes for topics
// based on what is in the database
// As before, it would be better to break this out into a separate function
// in a separate file, that handled the DB interaction, and returned
// a list of topics. But to keep things as clear as possible we can
// also query and loop through the results, right here.
try
{
	// For this example, we are going to make a call to the DB to get the scriptures
	// and then for each one, make a separate call to get its topics.
	// This could be done with a single query (and then more processing of the resultset
	// afterward) as follows:
	//	$statement = $db->prepare('SELECT book, chapter, verse, content, t.name FROM scripture s'
	//	. ' INNER JOIN scripture_topic st ON s.id = st.scriptureId'
	//	. ' INNER JOIN topic t ON st.topicId = t.id');
	// prepare the statement
	
	$statement = $db->prepare('SELECT players.last_name, stats.games_played, stats.goals, stats.assists, stats.points, stats.penalty_mins FROM stats JOIN players ON players.player_id=stats.id;');
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
	// Please be aware that you don't want to output the Exception message in
	// a production environment
	echo "Error connecting to DB. Details: $ex";
	die();
}
?>

	<br />


</form>


</div>

</body>
</html>