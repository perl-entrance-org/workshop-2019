#!/usr/bin/env perl
use strict;
use warnings;

my @month_name = (
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
);
my $month_hash_ref = {
    Jan => 1,
    Feb => 2,
    Mar => 3,
    Apr => 4,
    May => 5,
    Jun => 6,
    Jul => 7,
    Aug => 8,
    Sep => 9,
    Oct => 10,
    Nov => 11,
    Dec => 12,
};
for my $name (@month_name) {

    my $month = ${$month_hash_ref}{$name};  # デリファレンスした場合
    # my $month = $month_hash_ref->{$name};  # もちろんアロー記法でも良い

    my $ordinal_number;    # 序数
    if ( $month == 1 ) {
        $ordinal_number = 'st';
    }
    elsif ( $month == 2 ) {
        $ordinal_number = 'nd';
    }
    elsif ( $month == 3 ) {
        $ordinal_number = 'rd';
    }
    else {
        $ordinal_number = 'th';
    }

    print $name . ' is ' . $month . $ordinal_number ."\n";

}
