#!C:\xampp\perl\bin\perl.exe

use DBI;
use warnings FATAL => 'all';
use CGI;
use CGI::Carp qw(fatalsToBrowser);
#use DBD::mysql;

my $cgi = CGI->new;
print "Content-type: text/html \n\n";

$host = "localhost";
$database = "link";
$tablename = "yourlink";
$user = "root";
$pw = "";

$driver = "DBI:mysql:database=$database;host=$host"; 
$connect_me = DBI->connect($driver, $user, $pw) or die "unable to connect:$DBI::errstr\n";

my $statement = qq{SELECT * FROM yourlink};
$query_handle2 = $connect_me->prepare($statement); 

$query_handle2->execute();
my ($id,$title,$image1,$image2); 
$query_handle2->bind_col(1, \$id);
$query_handle2->bind_col(2, \$title);
$query_handle2->bind_col(3, \$image1);
$query_handle2->bind_col(4, \$image2);
while($query_handle2->fetchrow_array)
{
print "<html>";
print "<body>";
print "<div style='width: 100%;'>";
print "<div  style='float:left; width: 50%;height:900px;background-color:white; border:solid;'>";
print "<h2 align='center'><font color='green'>MY DESIGN</font></h2>";

print "<div   style='margin: 0 auto;width: 221px;height:68px;background-color:white;border:solid; '>";
print "<img src='$image1'>";
print "</div>";
print "<div   style='margin: 0 auto;width: 221px;height:250px;background-color:white;border:solid; '>";
print "<br>";
print "<div  style='float:right;width: 90px;height:66px;background-color:white;border:solid; '>";
print "<img src='$image2'>";
print "</div>";
print "<br><br><br><br>";
print "</div>";
print "</div>";
print "</div>";
print "</body>";
print "</html>";
}

