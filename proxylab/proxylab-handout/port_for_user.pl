#! /usr/bin/perl -w
use strict;
use Digest::MD5;

# Come up with a port number for a given user, with a low probability of
# clashes. 
my $maxport = 65536;
my $minport = 1024;

sub hashname {
    my $name = shift;

    my $hash = Digest::MD5::md5_hex($name);
    # take only the last 32 bits => last 8 hex digits
    $hash = substr($hash, -8);
    $hash = hex($hash);
    my $port = $hash % ($maxport - $minport) + $minport;
    print "$name: $port\n";
}

if($#ARGV == -1) {
    my ($username) = getpwuid($<);
    hashname($username);
} else {
    foreach(@ARGV) {
        hashname($_);
    }
}
