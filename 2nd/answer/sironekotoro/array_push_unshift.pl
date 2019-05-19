#!/usr/bin/env perl
use strict;
use warnings;

# ('Alice', 'Bob', 'Chris') という配列 `@array` を作ってください。
my @array = ('Alice', 'Bob', 'Chris');
# print "@array\n";

# 配列 `@array` の末尾に `Diana` を追加し、 ('Alice', 'Bob', 'Chris', 'Diana') という配列を作ってください。
push @array, 'Diana';
# print "@array\n";

# 配列 `@array` の最初に `Eve` を追加し、 ('Eve', 'Alice', 'Bob', 'Chris', 'Diana') という配列を作ってください。
unshift @array, 'Eve';
# print "@array\n";

# 配列をfor文で表示してください。
for my $name (@array){
    print "$name\n";
}