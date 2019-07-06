#!/usr/bin/env perl
use strict;
use warnings;

# - 引数として文字列を受け取り, その文字列に`perl`ないし`Perl`が含まれるなら｢Perl Monger!｣と表示するスクリプトを書いてみましょう.
# - コードは, `perl_checker.pl`という名前で保存するようにしましょう.

# 引数というか、標準入力

my $input = <STDIN>;
chomp $input;

if ($input =~ /[Pp]erl/){
    print 'Perl Monger!' . "\n";
}