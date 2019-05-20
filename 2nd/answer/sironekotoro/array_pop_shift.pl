#!/usr/bin/env perl
use strict;
use warnings;

# ('Alice', 'Bob', 'Chris') という配列 `@array` を作ってください。
my @array = ('Alice', 'Bob', 'Chris');

# 配列 `@array` から 'Chris' を取り出し、表示してください。
my $chris = pop @array;
print "$chris\n";

# 配列 `@array` から 'Alice' を取り出し、表示してください。
my $alice = shift @array;
print "$alice\n";
