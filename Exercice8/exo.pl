#! /usr/bin/perl

use strict;
use warnings;

my %uid;
my @loginUid;
open(my $fd, '<', 'passwd') or die ("Open :$!");

my $ligne;

while(defined($ligne = <$fd>)){
	my ($login, undef, $uid) = split(/:/,$ligne);
	$uid{$login} = $uid;	
}



# Trier dans l'ordre alphabétique des logins
foreach my $login (sort keys %uid){
	print $login."\t".$uid{$login};
        print "\n";
}

print "\n\n\n";

#$a $uid{$a}
#$b $uid{$b}
#$login $uid{login}
## Trier dans l'ordre croissant des UID 
foreach my $login (sort {$uid{$a} <=> $uid{$b}} keys %uid){
        print $login."\t".$uid{$login};
        print "\n";
}

print "\n\n\n";

#Comment affiner ce tri par ordre alpha des logins
foreach my $login (sort {$uid{$a} <=> $uid{$b} or $a cmp $b} keys %uid){
        print $login."\t".$uid{$login};
        print "\n";
}


close($fd);

