#!/usr/bin/env perl
use strict;
use warnings;

my %hash = ( name => 'Larry', lang => 'Perl' ); # ハッシュを作成
my $hash_ref = \%hash;

# $hash_ref{name} この書き方だと、リファレンスではなくて、
# %hash_ref というハッシュの値を参照しに行くという意味になる

# 誤り　: $hash_ref{name}
# 正しい: ${$hash_ref}{name}

print ${$hash_ref}{name} . "\n";    # Larry と表示される
print ${$hash_ref}{lang} . "\n";    # Perl と表示される

# もちろん、アロー記法を使っても良い
print $hash_ref->{name} . "\n";    # Larry と表示される
print $hash_ref->{lang} . "\n";    # Perl と表示される
