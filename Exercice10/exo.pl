#! /usr/bin/perl

use strict;
use warnings;

my $ligne;
my $nbRequest = 0;
my $nbNot200 = 0;
my $bytesTotal = 0;
my %request;
my %ips;
my %volumeIP;

while(defined($ligne = <>)){
	if(my ($ip, $url, $status, $size ) = $ligne =~ m/(.*?) .*?".*? (.*?) .*?" (.*?) (.*?) /){
		#print $ip."\t".$url."\t".$status."\t".$size."\n";
		$nbRequest++;
		if($status != 200){
			$nbNot200++;
		}
		$bytesTotal+=$size;
		$request{$url} ++;
		$ips{$ip}++;
		$volumeIP{$ip}+=$size;
	}
}
print "Nombre de requêtes : $nbRequest \n";
print "Nombre de requêtes differente de 200 : $nbNot200 \n";
print "Total transfert : ".($bytesTotal/1000)." kb \n";
print "\n\n\n";
print "-----------------TOP 3 DES URLs--------------------------- \n";

my $top3 = 0;
foreach my $url (sort {$request{$b} <=> $request{$a}} keys %request){
	print $url." a été consultée ". $request{$url}." fois \n";
	$top3++;
	if($top3 >= 3){
		last;
	}	
}
my $top10=1;
print "\n\n\n";

print "-------------------TOP 10 DES IPS ---------------------- \n";
foreach my $ip (sort {$ips{$b} <=> $ips{$a}} keys %ips){
	print $ip." s'est connecté ".$ips{$ip}." fois pour un total de ".$volumeIP{$ip}." \n";
	$top10++;
	if($top10 >= 10){
		last;
	}
}


