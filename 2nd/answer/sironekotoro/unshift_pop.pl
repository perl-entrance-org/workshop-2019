#!/usr/bin/env perl
use strict;
use warnings;

my @array = ( 5 .. 10 );

# 0 から 4 までまとめて先頭に追加する
# 0 から 4 まで 1 つずつ処理してもよい
unshift @array, ( 0 .. 4 );

# この時点で配列の中は
# (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
# となっている
# pop を利用して末尾から 6 つの要素を捨てる

# for文で6回, popを実行して末尾の要素を捨てる
for ( 1 .. 6 ) {
    pop @array;
}

# 結果を表示する
print "@array\n";
