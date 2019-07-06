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

# ヒアドキュメントに変数を埋め込む方法

my @people = ( $alice, $bob, $carol, $dave, $ellen );
my @elements
    = ( 'python', 'binary', 'name', 'ruby', 'perl', 'php', 'country' );

print '[' . "\n";
for my $member (@people) {

    print '  {' . "\n";
    my $text = << "EOF";
    "python":$member->{python}
    "binary":$member->{binary}
    "name":"$member->{name}"
    "ruby":$member->{ruby}
    "perl":$member->{perl}
    "php":$member->{php}
    "country":"$member->{country}"
EOF
    print $text;

    # 最後のメンバー以外はカンマをつける
    my $conma = ',';
    if ( $member->{name} eq 'Ellen' ) {
        $conma = '';
    }
    print '  }' . $conma . "\n";
}
print ']' . "\n";

