#!/usr/bin/env perl

use strict;
use warnings;

my @dog     = ( 'shiba', 'bull' );
my $dog_ref = \@dog;

my $cat_ref = [ 'mike', 'kuro' ];

my $birds_ref = [ 'eagle', 'crow' ];

my @animal  = ( $dog_ref, $cat_ref, $birds_ref );

print $animal[2], "\n";
print $animal[2]->[0], "\n";
