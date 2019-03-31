#!/usr/bin/env perl
use strict;
use warnings;

my @array = ( 5 .. 10 );

# 0 から 4 までまとめて末尾に追加する
# 0 から 4 まで 1 つずつ処理してもよい
push @array, ( 0 .. 4 );

# for文で6回, shiftを実行して先頭の要素を捨てる
for ( 1 .. 6 ) {
    shift @array;
}

print "@array\n";
