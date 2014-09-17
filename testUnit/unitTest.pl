#! /usr/bin/perl

use Test::More;
use strict;
use warnings;

#plan tests => 3;

use_ok('MonModule');

my $refLoginHash = parse('passwd');

ok( defined $refLoginHash,  "loginHash est defini" );
isa_ok( $refLoginHash, 'HASH', 'loginHash' );

done_testing();
