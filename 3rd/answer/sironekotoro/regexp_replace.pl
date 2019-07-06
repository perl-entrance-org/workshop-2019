#!/usr/bin/env perl
use strict;
use warnings;

my $str = 'I love ruby';

# - この`$str`に格納された文字列を, 置換を利用して, ｢I love perl｣に書き換えるようなコードを書いてみましょう.
#     - コードは, `regexp_replace.pl`という名前で保存しましょう.

$str =~ s/ruby/perl/;

print $str . "\n";