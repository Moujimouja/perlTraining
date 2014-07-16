#! /usr/bin/perl

use strict;
use warnings;

my %jours = (janvier=>31,fevrier=>28,mars=>30,avril=>31,mai=>30,juin=>31);
my @param = @ARGV;

foreach my $month (@param){
	if(exists($jours{$month})){
		print $month."-".$jours{$month};	
	}else{
		print "Le mois $month n'existe pas \n";
	}
	print "\n";
}

#Suppression d'un mois
delete($jours{mars});

#Affichage basique du contenu de la table
foreach my $month (keys %jours){
	print $month."\t".$jours{$month};
	print "\n";
}

print "\n";

# Tri par ordre alphabétique de la clé
foreach my $month (sort keys %jours){
	print $month."\t".$jours{$month};
        print "\n";
}

print "\n";

# Tri par ordre alphabétique de la valeurt 
foreach my $month (sort { $jours{$a} <=> $jours{$b} }  keys %jours){
     print $jours{$month}."\t".$month;
     print "\n";
}


