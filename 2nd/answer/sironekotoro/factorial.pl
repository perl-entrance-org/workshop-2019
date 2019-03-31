#!/usr/bin/env perl
use strict;
use warnings;

# 入力を促すメッセージ
print "input number > ";

# 数字を標準入力から受け取る
my $num = <STDIN>;

# 改行を削除する
chomp $num;

# 範囲演算子を利用して, 1 から $num までの配列を作る
my @array = ( 1 .. $num );

# 答えを格納するスカラー変数を用意する
# 初期値は1 (1の階乗は1)
my $answer = 1;

# 配列から1つずつ要素を取り出し、$answerに掛けたものを
# $answerに格納する
for my $element (@array) {
    $answer = $answer * $element;
}

# 答えを表示する
print "$answer\n";
