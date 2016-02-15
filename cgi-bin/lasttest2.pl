#!C:\xampp\perl\bin\perl.exe

use DBI;
use warnings FATAL => 'all';
use CGI;
use CGI::Carp qw(fatalsToBrowser);
#use DBD::mysql;

my $cgi = CGI->new;
#print $cgi->header, $cgi->start_html;

# HTTP HEADER
print "Content-type: text/html \n\n";

# MYSQL CONFIG VARIABLES
$host = "localhost";
$database = "link";  
$tablename = "mylink";
$user = "root";
$pw = "";

# PERL DBI CONNECT()
$driver = "DBI:mysql:database=$database;host=$host"; 
$connect_me = DBI->connect($driver, $user, $pw) or die "unable to connect:$DBI::errstr\n";

my $title =   $cgi->param('name');
my $img1    =    $cgi->param('mydiv1');
my $img2    =    $cgi->param('mydiv2');
my $data1 = "<?xml version="1.0"?><dress><upper>";
my $data2 = "</upper><lower>";
my $data3 = "</lower></dress>";
my $xml = $data1.$img1.$data2.$img2.$data3;
my $title = "page1.html";

#PREPARE THE QUERY

$query = "INSERT INTO mylink (title,xml,target) VALUES ('$title','$xml','$title')";

$query_handle = $connect_me->prepare($query); 
 
# EXECUTE THE QUERY
$query_handle->execute();

print $cgi->end_html;
print "<h1>insertion successful</h1>"