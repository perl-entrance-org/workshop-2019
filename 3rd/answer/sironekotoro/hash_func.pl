#!/usr/bin/env perl
use strict;
use warnings;

my %hash = (
    name  => 'Larry',
    birth => 1954,
    lang  => 'Perl',
);

# 1. 以下の要素を追加してください。
#     - 名前（key）: software
#     - 値（value）: patch
$hash{software} = 'patch';

# 1. `keys` 関数を使って, `%hash` の名前（key）をすべて出力してください。
for my $key ( keys %hash ) {
    print 'key is ' . $key . "\n";

 # print 'value is ' . $hash{$key} . "\n"; # ついでに値も出してみる
 # print  "\n";
}

# 1. `delete` 関数を使って, 1で使ったハッシュから birth の要素を削除してください。
delete $hash{birth};

# `exists` 関数を使って、`name`, `birth`, `lang`, `software` の各要素が存在するか確認してください。`名前（key）`は各要素のkey名が入るものとします。
# - 存在している場合は `名前（key） is exist.` と表示する。
# - 存在しない場合は `名前（key） is not exist.` と表示しする。

print '------------' . "\n"; # 区切り線

my @array = ( 'name', 'birth', 'lang', 'software' );
for my $key (@array) {
    if ( exists $hash{$key} ) {
        print $key . ' is exists' . "\n";
    }
    else {
        print $key . ' is not exists' . "\n";
    }
}
