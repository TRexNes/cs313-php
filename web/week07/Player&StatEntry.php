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

<h1>Select a player below and enter their updated stats</h1>

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

	<label>Players:</label><br />



	<br />

	<input type="submit" value="Add to Database" />

</form>


</div>

</body>
</html>