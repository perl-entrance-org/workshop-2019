#!/usr/bin/env perl
use strict;
use warnings;

my $signal = 'blue';

if ( $signal eq 'blue' ) {
    print 'WALK' . "\n";
}
elsif ( $signal eq 'yellow' ) {
    print 'Please Stop' . "\n";
}
else {
    print 'Dont WALK' . "\n";
}
