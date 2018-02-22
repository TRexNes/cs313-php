<?php
/**********************************************************
* File: insertTopic.php
* Author: Br. Burton
* 
* Description: Takes input posted from topicEntry.php
*   This file enters a new scripture into the database
*   along with its associated topics.
*
*   This file does NOT do any rendering at all,
*   instead it redirects the user to showTopics.php to see
*   the resulting list.
***********************************************************/
// get the data from the POST
$games_played = $_POST['intGames_played'];
$goals = $_POST['intGoals'];
$assits = $_POST['intAssists'];
$points = $_POST['intPoints'];
$playerIds = $_POST['chkPlayers'];
// For debugging purposes, you might include some echo statements like this
// and then not automatically redirect until you have everything working.
// echo "book=$book\n";
// echo "chapter=$chapter\n";
// echo "verse=$verse\n";
// echo "content=$content\n";
// we could (and should!) put additional checks here to verify that all this data is actually provided
require("dbConnect.php");
$db = get_db();
try
{
	// Add the Scripture
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
	// get the new id ---was scripture
	$playerId = $db->lastInsertId("player_id_seq");
	// Now go through each topic id in the list from the user's checkboxes
	foreach ($playerIds as $playerId)
	{
		echo "PlayerId: $playerId, playerId: $playerId";
		// Again, first prepare the statement
		$statement = $db->prepare('INSERT INTO stats(games_played, goals, assists, points, penalty_mins) VALUES(:games_played, :goals, :assits, :points, :penalty_mins)');
		// Then, bind the values
		$statement->bindValue(':scriptureId', $scriptureId);
		$statement->bindValue(':topicId', $topicId);
		$statement->execute();
	}
}
catch (Exception $ex)
{
	// Please be aware that you don't want to output the Exception message in
	// a production environment
	echo "Error with DB. Details: $ex";
	die();
}
// finally, redirect them to a new page to actually show the topics
header("Location: showStats.php");
die(); // we always include a die after redirects. In this case, there would be no
       // harm if the user got the rest of the page, because there is nothing else
       // but in general, there could be things after here that we don't want them
       // to see.
?>