#MonModule.pm


package MonModule;

use strict;
use warnings;

use parent  qw(Exporter);
our @EXPORT = qw(&display &parse);

sub display{
        my ($refLogin) = @_;
        my $login;
        foreach $login (sort{$refLogin->{$b}->{uid} <=> $refLogin->{$a}->{uid} or $a cmp $b }  keys %$refLogin){
                print $login."\t ".$refLogin->{$login}->{uid}."\t".$refLogin->{$login}->{gid}."\t";
                # "\t". $refLogin->{$login}->{data}->[0].
                #"\t".$refLogin->{$login}->{data}->[1].
                #"\t".$refLogin->{$login}->{data}->[2]."\n";
                print join(", ",@{$refLogin->{$login}->{data}});
                #print "\n\t".join("\n \t",@{$refLogin->{$login}->{data}});
                print "\n";

                # Autre solution pour le tableau :
                # foreach my $date(@{$refLogin->{$login}->{data}){
                # print $data;
                # }
        }
}

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
                $refLoginParam->{passwd} = $passwd;
                $refLoginParam->{uid} = $uid;
                $refLoginParam->{gid} = $gid;
                # Autre solution :
                # refLoginHash -> {$login} -> {passwd} = $password;
                # refLoginHash -> {$login} -> {uid} = $uid;
                # refLoginHash -> {$login} -> {gid} = $gid;
                # refLoginHash -> {$login} -> {data} -> [0] = $info;
                # refLoginHash -> {$login} -> {data} -> [1] = $home;
                # refLoginHash -> {$login} -> {data} -> [2] = $shell;

                # Autre solution bis:
                # $refLoginHash -> {$login} = {
                #                       passwd => $passwd,
                #                       uid => $uid,
                #                       gid => $gid,
                #                       data => [$info, $home,$shell]
                #                       }


                $data[0] = $info;
                $data[1] = $home;
                $data[2] = $shell;
                $refLoginParam->{data} = \@data; # = \@data;

                $refLoginHash->{$login}=$refLoginParam;
        }
        close($fd);
        return $refLoginHash;
}

1;
