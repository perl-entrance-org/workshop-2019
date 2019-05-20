#!/usr/bin/env perl
use strict;
use warnings;

for my $num ( 1 .. 100 ) {
    if ( $num % 15 == 0 ) {
        print 'fizzbuzz' . "\n";
    }
    elsif ( $num % 3 == 0 ) {
        print 'fizz' . "\n";
    }
    elsif ( $num % 5 == 0 ) {
        print 'buzz' . "\n";
    }
    else {
        print $num . "\n";
    }
}
