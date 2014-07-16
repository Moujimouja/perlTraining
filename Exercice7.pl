#! /usr/bin/perl
#
use strict;
use warnings;

#Question 1
my @etc = glob('/etc/*');

#Question 2
@etc = grep { not -d $_} @etc;

#Question 3
@etc = sort {-s $a <=> -s $b} @etc;

#Question 4
my @size = map { -s $_ } @etc;

#Question 5
my %hash = map { $_, -s $_} @etc;


#Affichage résultat 1,2,3
foreach my $file (@etc){
	print $file."(".(-s $file).")";
	print "\n";
}

print "\n";

#Affichage résultat 4
print join('|',@size);

#Affichage résultat 5
foreach my $e (keys %hash) {	
	print $e.$hash{$e};
	print "\n";
}


