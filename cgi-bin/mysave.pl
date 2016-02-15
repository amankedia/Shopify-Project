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

my $doc1 = XML::LibXML::Document->new();
my $root1 = $doc1->createElement('dress1');
$doc1->setDocumentElement($root1);

my $upper = $doc1->createElement('upper');
$upper->appendChild($doc1->createTextNode($img1));
$root1->appendChild($upper);

my $doc2 = XML::LibXML::Document->new();
my $root2 = $doc2->createElement('dress2');
$doc2->setDocumentElement($root2);

my $lower = $doc2->createElement('lower');
$lower->appendChild($doc2->createTextNode($img2));
$root2->appendChild($lower);

my $xml1 = $doc1->toString;
my $xml2 = $doc2->toString;

my $host = "localhost";
my $database = "link";
my $tablename = "yourlink";
my $user = "root";
my $pw = "";

my $driver = "DBI:mysql:database=$database;host=$host";
my $connect_me = DBI->connect($driver, $user, $pw) or die "unable to connect:$DBI::errstr\n";;


my $run_query = $connect_me->prepare("INSERT INTO $tablename (title,image1,image2) VALUES (?,?,?)");
$run_query->execute($title,$xml1,$xml2);

$run_query->finish;

print "<h1>insertion successful !!<h1>";


