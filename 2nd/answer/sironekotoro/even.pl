#!/usr/bin/env perl
use strict;
use warnings;

for my $num ( 1 .. 100 ) {
    if ( $num % 2 == 0 ) {
        print "$num\n";
    }
}
