#!C:\xampp\perl\bin\perl.exe

use DBI;
#use DBD::mysql;

# HTTP HEADER
print "Content-type: text/html \n\n";

$host = "localhost";
$database = "link";
$tablename = "yourlink";
$user = "root";
$pw = "";

# PERL DBI CONNECT()
$driver = "DBI:mysql:database=$database;host=$host";
$connect_me = DBI->connect($driver, $user, $pw);

# SELECT DB
$run_query = $connect_me->prepare("SELECT * FROM $tablename");
$run_query->execute();

print header;
print "<table border=\"1\" width=\"300\"> \n";
print "<tr><td>Id</td><td>Title</td><td>Image1</td><td>Image2</td></tr>\n";

$run_query->execute();
$r = "C:\\xampp\\htdocs\\myfiles\\";
$f = "\\";
$z = "/";
#print $r;
#print $f;
while(@result = $run_query->fetchrow_array())
{
 $id = $result[0];
 $name = $result[1];
 $image1 = $result[2];
 $image2 = $result[3];
 my $url = substr($image1,62);
 # my $url1 = substr($url,);
 $final = $r.$url;
#print $image1;

  #  $final =~ s/$f/$z/;
	#print $image;
    $i++;
    print "<tr>";
    print "<td style='border: 1px solid black;'>";
    print "$name";
    print "</td>";    
    print "<td style='border: 1px solid black;'>";
    print "<img src='$final'>";
    print "</td>";               
    print "<td style='border: 1px solid black;'>";
    print "<img src='$image2'>"; 
    print "</td>";    
    print "<td style='border: 1px solid black;'>";
    print "<a href='finalview.php?rownumber=$id'>";
    print "<input type='button' value= 'view'>";
    print "</a>";
    print "</td>";
	print "<td style='border: 1px solid black;'>";
	print $final;
	print "</td>";
    print "</tr>";
         
#print "<tr><td>$id</td><td>$title</td><td>$xml</td><td>$target</td></tr>\n";
}
print "</table>\n";

