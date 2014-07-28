#! /usr/bin/perl

use strict;
use warnings;
use MonModule;

my $refLoginHash = parse('passwd');

foreach my $login (keys %$refLoginHash){
	$refLoginHash->{$login}->{gid}*=2;	
}

# Question X : Afficher à l'aide du Dumper :
#print Dumper($refLoginHash);

display($refLoginHash);
