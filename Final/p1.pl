#!/usr/bin/perl

use strict;
use warnings;
use CGI qw(:standard);
use v5.10; # for say() function

use DBI;

# connect to MySQL database configurations
my $dsn = "DBI:mysql:perlmysqldb";
my $username = "root";
my $password = "";

# get user's input links
my @links = get_links();

# connect to MySQL database
my %attr = (PrintError=>0,RaiseError=>1 );
my $dbh = DBI->connect($dsn,$username,$password,\%attr);

my $html = HTML::TagParser->new( "page1.html" );
my $h_title = $html->getElementsByName( "name" );
my $elem1 = $html->getElementsById( "mydiv1" );
my $elem2 = $html->getElementsById( "mydiv2" );
my $h_target = "page2.html";
my $h_xml="<?xml version="1.0" ?><design><upper>$elem1</upper><lower>$elem2</lower></design>";

# insert data into the links table
my $sql = "INSERT INTO mylink(title,xml,target)
    VALUES($h_title,$h_xml,$h_target)";
	
	my $stmt = $dbh->prepare($sql);
 
# execute the query
foreach my $link(@links){
  if($stmt->execute($mylink->{title}, $mylink->{xml}, $mylink->{target})){
    say "data inserted successfully";
  }
 
}
$stmt->finish();

# disconnect from the MySQL database
$dbh->disconnect();

#print "Content-type:text/html\n\n";
#print " Name";
#print " xml ";



