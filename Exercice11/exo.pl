#! /usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

sub parse {
	my ($file) = @_;
	my $refLoginHash;
	my $ligne;
	open(my $fd, '<', $file) or die ("Open :$!");
	
	while(defined($ligne = <$fd>)){
		my @data;		
		my $refLoginParam = {};
		chomp($ligne);
		my ($login, $passwd, $uid, $gid, $info, $home, $shell) = split(/:/,$ligne);
		print $ligne;
		$refLoginParam->{passwd} = $passwd;
		$refLoginParam->{uid} = $uid;
		$refLoginParam->{gid} = $gid;
		
		$data[0] = $info;
		$data[1] = $home;
		$data[2] = $shell;
		$refLoginParam->{data} = \@data; # = \@data;

		$refLoginHash->{$login}=$refLoginParam;
	}
	close($fd);
	return $refLoginHash;
}


my $refLoginHash = parse('passwd');

print Dumper($refLoginHash);


