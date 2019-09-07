#!/usr/bin/env perl

use strict;
use warnings;

my @array = ( 1 .. 100 );           # 1から100までの数字が格納された配列を用意する
my $array_ref   =  \@array;          # 配列リファレンスを作成する
my @deref_array = @{$array_ref};    # 配列リファレンスをデリファレンスする

print "@deref_array\n";             # 1から100までの数字が表示されると正解
