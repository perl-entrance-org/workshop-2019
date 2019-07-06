#!/usr/bin/env perl
use strict;
use warnings;

my @array = ( 'A' .. 'Z' );  # A から Z までの文字が格納された配列を用意する
my $array_ref = \@array;     # 配列リファレンスを作成する

# 正確にデリファレンスできていないのを修正する問題
# @{$array_ref[10]} をデリファレンスすると
# 「配列@array_refの10番目の要素に格納されている配列リファレンス」
# になる
# my @array_ref = ();
# $array_ref[10] = ['hoge', 'fuga'];
# print "@{$array_ref[10]}";  # hoge fuga

# 誤り　：@{$array_ref[10]}
# 正しい：@{$array_ref}[10]

if ( @{$array_ref}[10] eq 'K' ) {
    print "配列の先頭から10番目の要素はKです"; # この行が実行される
}
