#!C:\xampp\perl\bin\perl.exe
use DBI;
use warnings FATAL => 'all';
use CGI;
use CGI::Carp qw(fatalsToBrowser);
#use DBD::mysql;
my $cgi = CGI->new;
print "Content-type: text/html \n\n";

# MYSQL CONFIG VARIABLES
$host = "localhost";
$database = "adorn_world";
$tablename = "savedata";
$user = "root";
$pw = "";
# PERL DBI CONNECT()
$driver = "DBI:mysql:database=$database;host=$host"; 
$connect_me = DBI->connect($driver, $user, $pw) or die "unable to connect:$DBI::errstr\n";
#PREPARE THE QUERY
my $statement = qq{SELECT * FROM savedata};
$query_handle2 = $connect_me->prepare($statement); 
# EXECUTE THE QUERY
$query_handle2->execute();
my ($wallcol1,$image11,$image22,$image33); 
$query_handle2->bind_col(1, \$wallcol1);
$query_handle2->bind_col(2, \$image11);
$query_handle2->bind_col(3, \$image22);
$query_handle2->bind_col(4, \$image33);
while($query_handle2->fetchrow_array)
{
print "<html>";
print "<body>";
print "<div style='width: 100%;'>";
  print "<div  style='float:left; width: 50%;height:900px;background-color:gray; border:solid;'>";
print "<h2 align='center'><font color='green'>YOUR ADORN</font></h2>";

  print "<div   style='margin: 0 auto;width: 221px;height:68px;background-color:white;border:solid; '>";
  print "<img src='$image11'>";
print "</div>";
print "<div   style='margin: 0 auto;width: 221px;height:250px;background-color:$wallcol1;border:solid; '>";
print "<br>";
print "<div  style='float:right;width: 90px;height:66px;background-color:white;border:solid; '>";
print "<img src='$image22'>";
print "</div>";
print "<br><br><br><br><br><br>";
print "<div style='margin: 0 auto;width: 79px;height:101px;background-color:white;border:solid; '>";
print "<img src='$image33'>";
print "</div>";
print "</div>";
print "</div>";
print "</div>";
print "</body>";
print "</html>";
}

