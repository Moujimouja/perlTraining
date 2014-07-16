#! /usr/bin/perl

use strict;
use warnings;

my @t = (4,-5,7);
@t = (@t, -2,3);

print (join(',',@t)."\n");

@t = (-0,-1,@t);
$t[2] = 9;

@t = sort {$b <=> $a} grep {$_ > 0} map{$_ * 2} @t;

print (join(',',@t)."\n");


