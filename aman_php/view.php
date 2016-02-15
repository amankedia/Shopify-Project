<html>
<head>
<style>
table, th, td {
     border: 1px solid black;
}
.file{
	margin-left:35%;
}

#results{
	margin-left:47%;
}
#nav{
padding-top:1%;
padding-left:2%;
font-size: 600%;
font-family: "Times New Roman", Times, serif;
height: 20%;
color:blue;
background-color: #FF00FF;
}
</style>
</head>
<body>
<div>
<div id="nav">Shopify...</div>
<br>
<br>		   
<div id="results"><b>Your results</b></div>
		      <?php
				
                   $conn= mysql_connect("localhost","root","");
                   $db= mysql_select_db("link",$conn);
					$i=0;
                     $sql="SELECT * FROM  mylink ";
					 echo '<div class="file">';
					echo '<table>';
                     $result=mysql_query($sql);
                     if($result)
                     while($row= mysql_fetch_assoc($result))   
                     {
						 $i++;
						 echo '<tr>';
						 echo '<td>';
						   echo $row['name']; 
                         echo '</td>';	
						 echo '<td>';
						   echo $row['i1']; 
                         echo '</td>';			   
						 echo '<td>';
						   echo $row['i2']; 
                         echo '</td>';	
						 echo '<td>';
						 echo '<a href="finalview.php?rownumber='.$i.'">';
						 echo '<input type="button" value= "view">';
						 echo '</a>';
						 echo '</td>';
						 echo '</tr>';
						 
                     } 
					 echo '</table>';
					 echo'</div>';
					 
			    ?>
<!-- 		     <table style="width:100%">
 <tr>
    <td>Jill</td>
    <td>Smith</td>
    <td>50</td>
  </tr>
  <tr>
    <td>Eve</td>
    <td>Jackson</td>
    <td>94</td>
  </tr>
</table> -->
</div>
</body>
</html>