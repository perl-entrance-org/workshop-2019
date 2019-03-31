#!/usr/bin/env perl
use strict;
use warnings;

# 標準入力により数値を1つ読み込み, その数字が「2でも3でも割り切れる」なら"Multiple of six"という文字列を出力する logical_operators.pl を作成しよう

# 入力を促すメッセージ
print "input number > ";

# 数字を標準入力から受け取る
my $num = <STDIN>;

# 改行を削除する
chomp $num;

# 「2で割った時の余りが0」かつ「3で割った時の余りが0」
if ( $num % 2 == 0 && $num % 3 == 0 ) {
    print "Multiple of six\n";
}
