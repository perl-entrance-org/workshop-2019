#!/usr/bin/env perl
use strict;
use warnings;

my $month_name = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
];

print "デリファレンスを使った場合\n";
for my $num ( 0 .. 11 ) {
    print ${$month_name}[$num]
        . "\n";    # 月の省略した英名を表示する
}

print "アロー記法を使った場合\n";
for my $num ( 0 .. 11 ) {
    print $month_name->[$num]
        . "\n";    # 月の省略した英名を表示する
}

print
    "for文の条件式と{ }ブロック内を編集して書いてみる\n";
for my $name ( @{$month_name} ) {
    print $name . "\n";    # 月の省略した英名を表示する
}
