#!/usr/bin/env perl

use strict;
use warnings;

# animal
#   ├─ dog
#   │    ├─ name: 'Taro'
#   │    └─ color: 'brown'
#   └─ cat
#        ├─ name: 'Tama'
#        └─ color: 'white'

my %dog = (
    name => 'Taro',
    color => 'brown',
);
my $dog_ref = \%dog;

my $cat_ref = {
    name => 'Tama',
    color => 'white',
};

my %animal = (
    dog => $dog_ref,
    cat => $cat_ref,
);

print $animal{cat}, "\n";
print $animal{cat}->{color}, "\n";
