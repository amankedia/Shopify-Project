#!C:\xampp\perl\bin\perl.exe -w
print "Content-type: text/plain/html; charset=iso-8859-1\n\n";
use CGI qw(:standard);
use CGI;
use DBI;
use DBD::mysql;

my $query = new CGI;
my $h_title,$h_xml,$h_target;

 $h_title ="mytitle";
 $h_xml= "myxml";
 $h_target ="mytarget";

$dsn = "DBI:mysql:link:localhost:3306";
$username = "root";
$password = "";

print $query->header("text/html"); 

$dbh = DBI->connect($dsn,$username,$password) or die "unable to connect:$DBI::errstr\n";

$sth = $dbh->prepare("insert into mylink values ($h_title,$h_xml,$h_target) ")
                or die "Couldn't prepare statement: " . $dbh->errstr;
$sth->execute() or die "Couldn't execute statement: " . $sth->errstr;

$sth->finish;
print "$h_title\n";

