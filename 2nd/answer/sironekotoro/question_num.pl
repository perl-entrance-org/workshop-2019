#!/usr/bin/env perl
use strict;
use warnings;

my $answer = 10;

print 'Please Input Number > ';
my $input = <STDIN>;
chomp $input;

if ( $answer == $input ) {
    print "OK\n";
}
elsif ( $answer < $input ) {
    print "Too big\n";
}
elsif ( $answer > $input ) {
    print "Too small\n";
}

# 入力範囲が 5 〜 15 のときに near と表示する
if ( ( $answer - 5 ) <= $input && $input <= ( $answer + 5 ) ) {

    if ( $answer == $input ) {

        # なにもしない
    }
    else {
        print "near\n";
    }
}
