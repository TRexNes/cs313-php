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

<h1>Enter New Players and Stats</h1>

<form id="mainForm" action="insertTopic.php" method="POST">

	<input type="text" id="txtFirst_name" name="txtFirst_name"></input>
	<label for="txtFirst_name">First Name</label>
	<br /><br />
	
	<input type="text" id="txtLast_name" name="txtLast_name"></input>
	<label for="txtLast_name">Last Name</label>
	<br /><br />
	
	<input type="text" id="txtPosition" name="txtPosition"></input>
	<label for="txtPosition">Position</label>
	<br /><br />

	<input type="text" id="txtBirth_country" name="txtBirth_country"></input>
	<label for="txtBirth_country">Birth_country</label>
	<br /><br />

	<input type="text" id="txtBirth_year" name="txtBirth_year"></input>
	<label for="txtBirth_year">Birth_year</label>
	<br /><br />

	<label for="txtContent">Content:</label><br />
	<textarea id="txtContent" name="txtContent" rows="4" cols="50"></textarea>
	<br /><br />

	<label>Players:</label><br />

<?php
// This section will now generate the available check boxes for topics
// based on what is in the database
// As before, it would be better to break this out into a separate function
// in a separate file, that handled the DB interaction, and returned
// a list of topics. But to keep things as clear as possible we can
// also query and loop through the results, right here.
try
{
	// Notice that we do not use "SELECT *" here. It is best practice
	// to only bring back the fields that you need.
	// prepare the statement
	$statement = $db->prepare('SELECT player_id, last_name FROM players');
	$statement->execute();
	// Go through each result
	while ($row = $statement->fetch(PDO::FETCH_ASSOC))
	{
		$id = $row['player_id'];
		$last_name = $row['last_name'];
		// Notice that we want the value of the checkbox to be the id of the label
		echo "<input type='checkbox' name='chkPlayers[]' id='chkPlayers$id' value='$player_id'>";
		// Also, so they can click on the label, and have it select the checkbox,
		// we need to use a label tag, and have it point to the id of the input element.
		// The trick here is that we need a unique id for each one. In this case,
		// we use "chkTopics" followed by the id, so that it becomes something like
		// "chkTopics1" and "chkTopics2", etc.
		echo "<label for='chkPlayers$id'>$name</label><br />";
		// put a newline out there just to make our "view source" experience better
		echo "\n";
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

	<input type="submit" value="Add to Database" />

</form>


</div>

</body>
</html>