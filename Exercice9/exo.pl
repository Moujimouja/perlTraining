#! /usr/bin/perl

use strict;
use warnings;


open(my $fd, '<', 'passwd') or die ("Open :$!");
my $ligne;

while(defined($ligne = <$fd>)){
	chomp $ligne;
	# Question 1: if($ligne =~ m/^jc:/){print $ligne."\n";}
	# Question 2: if($ligne !~ m:/bash:) {print $ligne."\n";}
	# Question 3: $ligne =~ s:/home/:/mnt/home/:; 
	# Question 4: $ligne =~ s/^(.*?):(?:.*?):/$1/;
 	# Question 5: $ligne =~ s/^(.*?):(.*?):(?:.*?):/$2:$1/;
	# Question 6 : $ligne =~ s/^(.*?:.*?:)(.*?:)(.*?:)/$1$3$2/;
	# Question 6 (bis) : $ligne =~ s/^((?:.*?:){2})(.*?:)(.*?:)/$1$3$2/;
	# Question 7:	my ($gid) = $ligne =~ m/(?:.*?:){3}(.*?):/;
	# Question 8: $ligne =~ s/((?:.*?:){3})(.*?):/$1.($2*2).':'/e;
	
	print $ligne."\n";
	
}

close ($fd);
