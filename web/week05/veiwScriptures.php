<!DOCTYPE html>
<html>
<head>

	<title>Scripture List</title>
</head>

<body>
<div>

<h1>Scripture Resources</h1>

     <?php
      
     
            $script_id = $_GET['id'];   
            
            //echo '<p>Your input id is :    ' . $script_id . '</p> <br />';
      
            
            //********************************************************
            include("dbOpen.php");
            //********************************************************
            
          echo '<table id="scripture">';
               foreach ($db->query("
                  SELECT scripture_id, book, chapter, verse, content 
                  FROM public.scriptures  
                  WHERE scripture_id = '$script_id' ") as $row)
                  {
                    echo '<tr id="sql_data">';
                      echo '<td><b>' .$row[book].' '. $row[chapter].':' .$row[verse]. '</b> - ' .$row[content].' </td>';
                     echo '</tr>';   /**/
                  }
            
            echo '</table>';
 
     
     
           include("dbClose.php");
      
      ?>

    </div>
   
   
</body>
</html>  


</div>

</body>
</html>