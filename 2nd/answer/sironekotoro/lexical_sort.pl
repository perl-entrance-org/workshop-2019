#!/usr/bin/env perl
use strict;
use warnings;

# 標準入力を2回利用して文字列を2つ読み込み, 2つの文字列を辞書に登場する順に出力する lexical_order.pl を作成しよう
# 同じ文字列の場合には "equal" と表示すること

# 入力を促すメッセージ
print "input first word > ";

# 最初の文字列を標準入力から受け取る
my $first_str = <STDIN>;

# 改行を削除する
chomp $first_str;

# 入力を促すメッセージ
print "input second word > ";

# 次の文字列を標準入力から受け取る

my $second_str = <STDIN>;

# 改行を削除する
chomp $second_str;

# 入力を促すメッセージ
print "input third(last) word > ";

# 次の文字列を標準入力から受け取る

my $third_str = <STDIN>;

# 改行を削除する
chomp $third_str;

# 入力した3つの文字列を配列に格納する
my @array = ( $first_str, $second_str, $third_str );

# 配列を文字列順にソートし、新しい配列@sorted_arrayに格納する
my @sorted_array = sort { $a cmp $b } @array;

# ソート済みの配列を表示する
print "@sorted_array";
