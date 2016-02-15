#!C:\xampp\perl\bin\perl.exe -w

print "Content-type: text/plain/html; charset=iso-8859-1\n\n";

use CGI qw(:standard);
use CGI;
use DBI;

my $query = new CGI;
my $h_title,$h_xml,$h_target;

 $h_title ="mytitle";
 $h_xml= "myxml";
 $h_target ="mytarget";


print $query->header("text/html"); 

my $dbh = DBI->connect("DBI:Oracle:host=localhost:sid=orcl;port=1521",'scott','tiger');

 my $sth = $dbh->prepare("insert into mylink values (?,?,?) ")
                or die "Couldn't prepare statement: " . $dbh->errstr;
  $sth->execute($h_title,$h_xml,$h_target) or die "Couldn't execute statement: " . $sth->errstr;

$sth->finish;
print "$h_title\n";

