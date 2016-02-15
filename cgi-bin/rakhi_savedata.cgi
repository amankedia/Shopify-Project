#!C:\xampp\perl\bin\perl.exe
use DBI;
use warnings FATAL => 'all';
use CGI;
use CGI::Carp qw(fatalsToBrowser);
#use DBD::mysql;
my $cgi = CGI->new;
print $cgi->header, $cgi->start_html;
# HTTP HEADER
#print "Content-type: text/html \n\n";
# MYSQL CONFIG VARIABLES
$host = "localhost";
$database = "adorn_world";  
$tablename = "savedata";
$user = "root";
$pw = "";
# PERL DBI CONNECT()
$driver = "DBI:mysql:database=$database;host=$host"; 
$connect_me = DBI->connect($driver, $user, $pw) or die "unable to connect:$DBI::errstr\n";

my $wallcol =   $cgi->param('c');
my $image1	=	$cgi->param('r');
my $image2	=	$cgi->param('w');
my $image3	=	$cgi->param('d');
#my $position	=	$cgi->param('position');

print "$image1";
#print "$price";
#PREPARE THE QUERY

$query = "INSERT INTO savedata (wallcolour,roof,window,door) VALUES ('$wallcol','$image1','$image2','$image3')";

$query_handle = $connect_me->prepare($query); 
 
# EXECUTE THE QUERY
$query_handle->execute();

print $cgi->end_html;


