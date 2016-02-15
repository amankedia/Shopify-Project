#!/usr/bin/perl
use strict;
use warnings;
use CGI::Carp qw/fatalsToBrowser/;
use CGI;
my $q=CGI->new;
print $q->header,
$q->start_html('hello world'),
$q->h1('hello world'),
$q->end_html;