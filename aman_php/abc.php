<?php
ob_start();
session_start();

$servername="localhost";
$username="root";
$password="";
$databasename="link";

//connection

$conn=mysql_connect($servername,$username,$password);
mysql_select_db($databasename,$conn);

$email=$_POST['name'];
$password=$_POST['i1'];
$zz=$_POST['i2'];
$query="insert into mylink values('','$email','$password','$zz')";
$result=mysql_query($query);
header("location:page1.html");
?>