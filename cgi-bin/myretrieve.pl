#!C:\xampp\perl\bin\perl.exe

use DBI;
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
#use DBD::mysql;

my $q = CGI->new;
my $word = $q->param('word');

# HTTP HEADER
print "Content-type: text/html \n\n";

$host = "localhost";
$database = "link";
$tablename = "mylink";
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
print "<tr><td>Id</td><td>Title</td><td>XML</td><td>Target</td></tr>\n";

$run_query->execute();

while(@result = $run_query->fetchrow_array())
{
 $id = $result[0];
 $title = $result[1];
 $xml = $result[2];
 $target = $result[3];

print "<tr><td>$id</td><td>$title</td><td>$xml</td><td>$target</td></tr>\n";
}
print "</table>\n";




