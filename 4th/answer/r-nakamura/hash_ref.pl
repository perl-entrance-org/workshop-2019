#!/usr/bin/env perl

use strict;
use warnings;

my %hash = ( name => 'Larry', lang => 'Perl' ); # ハッシュを作成
my $hash_ref = \%hash;

print $hash{name} . "\n";    # Larry と表示される
print $hash{lang} . "\n";    # Perl と表示される

print ${$hash_ref}{name} . "\n";    # Larry と表示される
print $hash_ref->{lang} . "\n";    # Perl と表示される

