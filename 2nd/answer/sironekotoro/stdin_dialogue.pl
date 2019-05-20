#!/usr/bin/env perl
use strict;
use warnings;

print 'Please tell Your Name ? > ';
my $name = <STDIN>;
chomp $name;

print 'What time is it ? > ';
my $time = <STDIN>;
chomp $time;

# 文字列連結を使って表示する方法
print 'You are ' . $name . '.' . "\n";
# ダブルクォーテーションを使って変数を展開する方法
print "It is $time o'clock\n";