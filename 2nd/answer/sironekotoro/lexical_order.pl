#!/usr/bin/env perl
use strict;
use warnings;

# 標準入力を2回利用して文字列を2つ読み込み, 2つの文字列を辞書に登場する順に出力する lexical_order.pl を作成しよう
# 同じ文字列の場合には "equal" と表示すること

# 入力を促すメッセージ
print "input some word > ";

# 最初の文字列を標準入力から受け取る
my $first_str = <STDIN>;

# 改行を削除する
chomp $first_str;

# 入力を促すメッセージ
print "Once again input some word > ";

# 次の文字列を標準入力から受け取る

my $second_str = <STDIN>;

# 改行を削除する
chomp $second_str;

# 文字列が等しければ equal と表示
if ( $first_str eq $second_str ) {
    print "equal\n";
}
# $first_str の方が辞書順で先の場合
elsif ( $first_str lt $second_str ) {
    print "$first_str  $second_str\n";
}
# $second_str の方が辞書順で先の場合
elsif ( $first_str gt $second_str ) {
    print "$second_str $first_str\n";
}
