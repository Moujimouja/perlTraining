#! /usr/bin/perl

use strict;
use warnings;

my %uid;
my @loginUid;
open(my $fd, '<', 'passwd') or die ("Open :$!");

my $ligne;

while(defined($ligne = <$fd>)){
	my ($login, undef, $uid) = split(/:/,$ligne);
	#@loginUid = (@loginUid,$login,$uid);
	$uid{$login} = $uid;	
}

#%uid = @loginUid;

print  "\n UID HASH \n";

foreach my $login (sort keys %uid){
	print $login."\t".$uid{$login};
        print "\n";
}

close($fd);

