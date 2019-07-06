#!/usr/bin/env perl
use strict;
use warnings;

my @words = ( 'alice loves meat!', 'bob loves sushi!' );

# - このような配列を受け取り, 格納された文字列について, ｢loves｣の後に記述されている好きな食べ物の単語を正規表現で取得し, ｢alice -> meat｣, ｢bob -> sushi｣のように表示するスクリプト, `love_food`を書いてみよう.
# - このコードは, `love_food.pl`という名前で保存するようにしましょう.

for my $element (@words) {
    $element =~ /(\w+) loves (\w+)/;
    print $1 . ' -> ' . $2 . "\n";
}
