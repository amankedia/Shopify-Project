<?php
 $conn= mysql_connect("localhost","root","");
 $db= mysql_select_db("link",$conn);
$rowid = $_GET["rownumber"];
$sql = "SELECT * FROM  mylink where pk= '$rowid'";
$result = mysql_query($sql);
$row= mysql_fetch_array($result);
$id = $row['pk'];
$img1 = $row['i1'];
$img2 = $row['i2'];
$name = $row['name'];
#print $id;
#print $img1;
#print $img2;
#print $name;
?>
<html>
<head>
<style>
#img1, #img2{
border-radius:25px;
padding-top:3%;
margin-top: 2%;
margin-left:40%;
width:15%;
height:20%;
border:1px solid red;
float: left;
text-align:center;
color:blue;
background-color:white;
.nav{
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
<div style="padding-top:1%; padding-left:2%; font-size: 600%; font-family: Times New Roman, Times, serif; height: 20%; color:blue; background-color: #FF00FF;">Shopify...</div>
<br>
<br>
<div style="margin-left:40%"> <b>You selected the following design</b> </div>
<?php
echo '<div id="img1">';
echo '<img src="'.$img1.'">';
echo '</div>';
echo '<div id="img2">';
echo '<img src="'.$img2.'">';
echo '</div>';
#echo '<div class="picbox">';
#$filename=$row['animal_image'];
#echo '<img src="uploads/'.$filename.'" style="width:300px;height:222px">'; 
#echo'</div>';
				 
#echo'<div class="descbox">';
#echo "ANIMAL NAME        :";          echo $row['animal_name']; 
 # echo "<br>";						   
	#					   echo "ANIMAL DESCRIPTION :";          echo $row['animal_desc'];
	#					   echo "<br>";
	#					   echo "ZOO NAME           :";          echo $row['zoo_name'];
	#					   echo "<br>";
	#					   echo'</div>';
	#					echo'</div>';
						?>
						</div>
</body>
</html>