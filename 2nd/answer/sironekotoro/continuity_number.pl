#!/usr/bin/env perl
use strict;
use warnings;

# 入力を促すメッセージ
print "input number > ";

# 数字を標準入力から受け取る
my $num = <STDIN>;

# 改行を削除する
chomp $num;

# 範囲演算子を使って配列を作成する
my @array = ( 0 .. $num );

# 配列を表示する;
print "@array\n";
