#!/usr/bin/perl 
use strict;
use warnings;

my $param = $ARGV[0];

sub tableMult{
	my ($n) = @_;
	foreach my $ligne (1..$n){
		foreach my $colonne (1..$n){
			
			printf("%6d", $ligne*$colonne);
		}
	print "\n";

	}
}

tableMult($param or 2); #renvoi la premiere valeur qui n'est pas fausse
