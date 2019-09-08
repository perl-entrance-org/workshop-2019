#!/usr/bin/env perl

use strict;
use warnings;

my $month_name = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
];
for my $num ( 0 .. 11 ) {
    # print "$month_name";    # 月の省略した英名を表示する
    # print "$num\n";
    print $num + 1, "\t$month_name->[$num]\n";    # 月の省略した英名を表示する
}
for my $month (@{$month_name}) {
    print "$month\n"
}
