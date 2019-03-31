#!/usr/bin/env perl
use strict;
use warnings;

# 下記のハッシュを作成する
## my を忘れずに

my %saitama_cities = (
    urawa => 486538,
    omiya => 457298,
    yono  => 83620,
);

# a. urawa, omiya, yonoの値の合計をスカラー変数`$saitama_population`に格納する

## 変数に数値を入れる場合は0で初期化しておく
my $saitama_population = 0;

## keysでハッシュのkeyを取り出し、そのままfor文で
## 値を取り出しで合計する
for my $key ( keys %saitama_cities ) {
    $saitama_population += $saitama_cities{$key};
}

# b. ハッシュ`%saitama_cities`に key 'saitama' と, それに対応するvalueとして`$saitama_population`を追加する

## ハッシュに key と value を追加するときは
## ハッシュの先頭のシジルが % から $　に変わっているのに注意
$saitama_cities{saitama} = $saitama_population;

# c. ハッシュ`%saitama_cities`からurawa, omiya, yono を削除する

## deleteをつかう
delete $saitama_cities{urawa};
delete $saitama_cities{omiya};
delete $saitama_cities{yono};

# d. key urawa が削除されているか exists を使って確認する

## 確認する3つのkeyをqwショートカットを使って配列にする
my @cities = qw(urawa omiya yono);

for my $city (@cities) {
    if ( exists $saitama_cities{$city} ) {

        # 消えているはずなのにexistsが「真」を返すのでエラー
        print "ERROR!!!\n";
    }
    else {
        print "$city is merged.\n";
    }
}

# ハッシュ %saitama_cities に格納されている key と valuseを出力する
for my $key ( keys %saitama_cities ) {
    print "$key $saitama_cities{$key}\n"    # saitama 1027456;
}
