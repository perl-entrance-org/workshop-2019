#!/usr/bin/env perl
use strict;
use warnings;

my $foo = 'P';
my $bar = 'e';
my $buz = 'r';
my $hoge = 'l';

# 回答例1
print $foo . $bar . $buz . $hoge . "\n";

# 回答例2
print "$foo$bar$buz$hoge" . "\n";

# 回答例3
print "$foo$bar$buz$hoge\n";
