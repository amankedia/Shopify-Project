<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "link";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT * FROM mylink";
$result = $conn->query($sql);

if ($result->num_rows > 0) 
{
    // output data of each row
	echo "<table border=1 bgcolor=#FFCCCC  align=center>
	<tr>
	<th>Id</th>
	<th>Title</th>
	<th>XML</th>
	<th>Target</th>
	</tr>";
    while($row = $result->fetch_assoc())
	 {
	 	echo "<tr>";
        echo "<td>" . $row["id"]. "</td>";
		echo "<td>" . $row["title"]. "</td>";
		echo "<td>" . $row["xml"]. "</td>";
		echo "<td>" . $row["target"]. "</td>";
		echo "</tr>";
    }
	echo "</table>";
}
 else {
    echo "0 results";
}
$conn->close();
?>
</body>
</html>
