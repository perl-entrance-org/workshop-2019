#!/usr/bin/env perl
use strict;
use warnings;

# 1. 以下の人物のプロフィールを `%larry_profile` に格納してください。

#     - 名前(name)  : Larry Wall
#     - 誕生(birth) : 1954
#     - 言語(lang)  : Perl

my %larry_hash = (
    name  => 'Larry Wall',
    birth => 1954,
    lang  => 'Perl',
);

# 1. key である `name`、`birth`、`lang` を使って、それぞれの value を出力してください。
print "$larry_hash{name}\n";     # name が表示される  => "Larry"
print "$larry_hash{birth}\n";    # birth が表示される => 1954
print "$larry_hash{lang}\n";     # lang が表示される  => "Perl"

# 1. 時間に余裕のある人は、Larry のプロフィールを充実させましょう。
$larry_hash{product} = 'patch'; # UNIXで最も広く使われているテキスト差分適用プログラム、patchを作り出した
$larry_hash{univercity} = 'Seattle Pacific University'; #1976年にシアトル・パシフィック大学を卒業

