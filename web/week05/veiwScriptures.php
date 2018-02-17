<!DOCTYPE html>
<html>
<head>

	<title>Scripture List</title>
</head>

<body>
<div>

<h1>Scripture Resources</h1>

     <?php
      
     
            //$script_id = $_GET['id'];   
            
            //echo '<p>Your input id is :    ' . $script_id . '</p> <br />';
      
            
            //********************************************************
            include("dbOpen.php");
            //********************************************************
            
          $statement = $db->prepare("SELECT book, chapter, verse, content FROM scripture");
$statement->execute();
// Go through each result
while ($row = $statement->fetch(PDO::FETCH_ASSOC))
{
	// The variable "row" now holds the complete record for that
	// row, and we can access the different values based on their
	// name
	echo '<p>';
	echo '<strong>' . $row['book'] . ' ' . $row['chapter'] . ':';
	echo $row['verse'] . '</strong>' . ' - ' . $row['content'];
	echo '</p>';
}
 
     
     
           include("dbClose.php");
      
      ?>

    </div>
   
   
</body>
</html>  


</div>

</body>
</html>