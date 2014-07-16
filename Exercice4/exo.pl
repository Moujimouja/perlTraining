#!/usr/bin/perl 
use strict;
use warnings;

my $param = 4; #@ARGV[1];

sub tableMult{
	my ($n) = @_;
	foreach my $ligne (1..$n){
		foreach my $colonne (1..$n){
			
			printf("%6d", $ligne*$colonne);
		}
	print "\n";

	}
}

tableMult($param);
