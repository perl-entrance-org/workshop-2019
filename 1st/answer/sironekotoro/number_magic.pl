#!/usr/bin/env perl
use strict;
use warnings;

# 変数`$foo`に 10　を代入します
my $foo = 10;

# 変数`$hoge`に 変数`$foo` を代入します
my $hoge = $foo;

# 変数`$hoge`に 1 を加えます
$hoge += 1;

# 変数`$hoge`に 2 を掛けます
$hoge = $hoge * 2;

# 変数`$hoge`に 6 を加えます
$hoge = $hoge + 6;

# 変数`$hoge`を 2 で割ります
$hoge = $hoge / 2;

# 変数`$hoge`から 変数`$foo`を引きます
$hoge = $hoge - $foo;

# 変数`$hoge`を表示して改行します
print "$hoge\n";