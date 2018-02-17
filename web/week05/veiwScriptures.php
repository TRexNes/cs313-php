<!DOCTYPE html>
<html>
<head>

	<title>Scripture List</title>
</head>

<body>
<div>

<h1>Scripture Resources</h1>

     <?php
      
     
         if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
                        $var = $_POST["search1"];
      
            
            //********************************************************
            include("dbOpen.php");
            //********************************************************
            
  echo '<table id="scripture">';
               foreach ($db->query("
                  SELECT scripture_id, book, chapter, verse, content 
                  FROM public.scriptures  
                  WHERE book LIKE '%$var%' ") as $row)
                  {
                    echo '<tr id="sql_data">';
                     echo '<td> <a href="week05ta_4.php?id='.$row[scripture_id].'"><b>' .$row[book].' '. $row[chapter].':' .$row[verse]. '</b></a> </td>';
                     echo '</tr>';   /**/
                  }
            
            echo '</table>';
 
     
      
       } else {
                           echo "This is embarrassing - - - There was an error in the REQUEST_METHOD not being POSTed. . . ";
                        }
           include("dbClose.php");
      
      ?>

    </div>
   
   
</body>
</html>  


</div>

</body>
</html>