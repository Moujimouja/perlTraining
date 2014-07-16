#! /usr/bin/perl
use strict;
use warnings;

for (my $i = 0; $i < 100; $i++){
	if($i%3 == 0 and $i%2 != 0){
		print $i."\n";
	}
}
