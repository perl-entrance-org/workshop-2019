#!/usr/bin/env perl
use strict;
use warnings;

print 'Plese Input First Number > ';
my $first_num = <STDIN>;
chomp $first_num;

print 'Plese Input Second Number > ';
my $second_num = <STDIN>;
chomp $second_num;

# 足し算
print "$first_num + $second_num = ";
print $first_num + $second_num . "\n";

# 引き算
print "$first_num - $second_num = ";
print $first_num - $second_num . "\n";

# 掛け算
print "$first_num * $second_num = ";
print $first_num * $second_num . "\n";

# 割り算
print "$first_num / $second_num = ";
print $first_num / $second_num . "\n";
