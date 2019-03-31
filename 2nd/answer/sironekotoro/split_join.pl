#!/usr/bin/env perl
use strict;
use warnings;

# Swiss-Army chainsawという文字列を join と split を用いて Swiss Army chainsawという3つの単語に分けましょう
my $str = 'Swiss-Army chainsaw';

# 半角スペースで区切る
my @temp_word = split / /, $str;

# - でつなげる
my $temp_str = join '-', @temp_word;

# -で区切る
my @word = split /-/, $temp_str;

# 表示する
print "@word\n"
