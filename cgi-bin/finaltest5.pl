#!C:\xampp\perl\bin\perl.exe

use CGI;
use DBI;
use strict;
use warnings;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
use XML::LibXML;

print "Content-type: text/html\n\n";

my $cgi = CGI->new;
my $title =$cgi->param('name');
my $img1 = $cgi->param('mydiv1');
my $img2 = $cgi->param('mydiv2');
my $target = "page1.html"; 

my $doc = XML::LibXML::Document->new();
my $root = $doc->createElement('dress');
$doc->setDocumentElement($root);

my $upper = $doc->createElement('upper');
$upper->appendChild($doc->createTextNode($img1));
$root->appendChild($upper);

my $lower = $doc->createElement('lower');
$lower->appendChild($doc->createTextNode($img2));
$root->appendChild($lower);

my $xml = $doc->toString;

my $host = "localhost";
my $database = "link";
my $tablename = "mylink";
my $user = "root";
my $pw = "";

my $driver = "DBI:mysql:database=$database;host=$host";
my $connect_me = DBI->connect($driver, $user, $pw) or die "unable to connect:$DBI::errstr\n";;


my $run_query = $connect_me->prepare("INSERT INTO $tablename (title,xml,target) VALUES (?,?,?)");
$run_query->execute($title,$xml,$target);

$run_query->finish;

print "<h1>insertion successful !!<h1>";


