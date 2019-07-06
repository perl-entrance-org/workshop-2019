#!/usr/bin/env perl

use strict;
use warnings;

my $alice = {
    name    => 'Alice',
    country => 'England',
    perl    => 60,
    python  => 80,
    ruby    => 80,
    php     => 50,
    binary  => 30,
};
my $bob = {
    name    => 'Bob',
    country => 'America',
    perl    => 40,
    python  => 10,
    ruby    => 20,
    php     => 30,
    binary  => 50,
};
my $carol = {
    name    => 'Carol',
    country => 'England',
    perl    => 100,
    python  => 70,
    ruby    => 80,
    php     => 50,
    binary  => 50,
};
my $dave = {
    name    => 'Dave',
    country => 'Canada',
    perl    => 60,
    python  => 11,
    ruby    => 1,
    php     => 100,
    binary  => 100,
};
my $ellen = {
    name    => 'Ellen',
    country => 'America',
    perl    => 1,
    python  => 15,
    ruby    => 0.5,
    php     => 60,
    binary  => 0.01,
};

### 2-5. JSON風Dumper(score_jsonize.pl)
# どのような方法でもよいので、`score.pl`で用意されたデータを、次のようなフォーマットで出力してみてください。

# 出力例を見ると、完全なJSONではないっぽい（各要素の末尾にカンマがない）
# 要素の並びは固定っぽい

my @people = ( $alice, $bob, $carol, $dave, $ellen );
my @elements
    = ( 'python', 'binary', 'name', 'ruby', 'perl', 'php', 'country' );

print '[' . "\n";
for my $index ( 0 .. $#people ) {
    print '  {' . "\n";

    for my $element (@elements) {

        # 数値の場合はそのまま、数値じゃない（文字列）の場合は""で囲う
        # 先頭1文字で判断
        my $value = $people[$index]->{$element};
        if ( $value =~ /^\D/ ) {
            $value = '"' . $value . '"';
        }

        print '    ' . '"' . $element . '":' . $value . "\n";

    }

# 最後の要素かどうか判定して、最後の要素じゃなければカンマつける
    my $tail = '';
    if ( $index != $#people ) {
        $tail = ',';
    }

    print '  }' . $tail . "\n";

}
print ']' . "\n";
