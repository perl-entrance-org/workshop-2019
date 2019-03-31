#!/usr/bin/env perl
use strict;
use warnings;

# 標準入力により数値を1つ読み込み, その数値が偶数なら"even", 奇数なら"odd" という文字を出力する even_or_odd.pl を作成しよう


# 数値の入力を促すメッセージを表示
print "input any number > ";

# 標準入力をスカラー変数で受け取る
my $num = <STDIN>;

# 受け取ったスカラー変数から改行を削除する
chomp $num;

# 2で割った余りが0, 割り切れたら偶数
if ( $num % 2 == 0 ) {
    print "even\n";
}
# 2で割った余りが0ではない, 割り切れないので奇数
else {
    print "odd\n";
}
