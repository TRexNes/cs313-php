<?php
/**********************************************************
* File: showTopics.php
* Author: Br. Burton
* 
* Description: This file retrieves the scriptures and topics
* from the DB.
***********************************************************/
require("dbConnect.php");
$db = get_db();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Player and Stats List</title>
</head>

<body>
<div>

<h1>Player and Stats List</h1>

<?php
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
	$statement = $db->prepare('SELECT id, games_played, goals, assists, points, penalty_mins  FROM stats');
	$statement->execute();
	// Go through each result
	while ($row = $statement->fetch(PDO::FETCH_ASSOC))
	{
		echo '<p>';
		echo $row['games_played'] . ' ' . $row['goals'] . ' ';
		echo $row['assists'] . ' ' . $row['points'] . ' ';
		echo $row['penalty_mins'] . '</strong>';
		echo '<br />';
		echo 'Players: ';
		// get the topics now for this scripture
		$stmtPlayers = $db->prepare('SELECT first_name, last_name FROM palyers p'
			. ' INNER JOIN stats st ON st.id = p.player_id'
			. ' WHERE st.id = :playerid');
		$stmtTopics->bindValue(':playerId', $row['id']);
		$stmtTopics->execute();
		// Go through each topic in the result
		while ($topicRow = $stmtTopics->fetch(PDO::FETCH_ASSOC))
		{
			echo $topicRow['name'] . ' ';
		}
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