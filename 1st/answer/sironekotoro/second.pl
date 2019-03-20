#!/usr/bin/env perl
use strict;
use warnings;

my $min = ( 150 - ( 150 % 60 ) ) / 60;
print $min . "\n";

my $sec = 150 % 60;
print $sec . "\n";
