<?php
/*************
* This file inserts into the databse preparing to show data
***************/


// get the data from the POST
$first_name = $_POST['txtFirst_name'];
$last_name = $_POST['txtLast_name'];
$position = $_POST['txtPosition'];
$birth_year = $_POST['txtBirth_year'];
$birth_country = $_POST['txtBirth_country'];
$games_played = $_POST['intGames_played'];
$goals = $_POST['intGoals'];
$assits = $_POST['intAssists'];
$points = $_POST['intPoints'];

// 
// 
// echo "first_name=$first_name\n";
// 
// 
// 
// 
require("dbConnect.php");
$db = get_db();
try
{
	
	
	$query = 'INSERT INTO players(first_name, last_name, position, birth_year, birth_country) VALUES(:first_name, :last_name, :position, :birth_year, :birth_country)';
	$statement = $db->prepare($query);
	// Now we bind the values to the placeholders. This does some nice things
	// including sanitizing the input with regard to sql commands.
	$statement->bindValue(':first_name', $first_name);
	$statement->bindValue(':last_name', $last_name);
	$statement->bindValue(':position', $position);
	$statement->bindValue(':birth_year', $birth_year);
	$statement->bindValue(':birth_country', $birth_country);
	$statement->execute();
	
	// 
	// We do this by preparing the query with placeholder values
	
	
	$query = 'INSERT INTO stats(games_played, goals, assists, points, penalty_mins) VALUES(:games_played, :goals, :assits, :points, :penalty_mins)';
	$statement = $db->prepare($query);
	// Now we bind the values to the placeholders. This does some nice things
	// including sanitizing the input with regard to sql commands.
	
	$statement->bindValue(':games_played', $games_played);
	$statement->bindValue(':goals', $goals);
	$statement->bindValue(':assits', $assits);
	$statement->bindValue(':points', $points);
	$statement->bindValue(':penalty_mins', $penalty_mins);
	$statement->execute();
	
}
catch (Exception $ex)
{
	// 
	// 
	echo "Error with DB. Details: $ex";
	die();
}
// redirect 
header("Location: showStats.php");
die(); 
// 
// 
// 
// 
?>