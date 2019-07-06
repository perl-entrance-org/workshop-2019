#!/usr/bin/env perl

use strict;
use warnings;

my $alice = {
    name    => 'Alice',
    country => 'England',
    perl    => 60,
    python  => 80,
    ruby    => 80,
    php     => 50,
    binary  => 30,
};
my $bob = {
    name    => 'Bob',
    country => 'America',
    perl    => 40,
    python  => 10,
    ruby    => 20,
    php     => 30,
    binary  => 50,
};
my $carol = {
    name    => 'Carol',
    country => 'England',
    perl    => 100,
    python  => 70,
    ruby    => 80,
    php     => 50,
    binary  => 50,
};
my $dave = {
    name    => 'Dave',
    country => 'Canada',
    perl    => 60,
    python  => 11,
    ruby    => 1,
    php     => 100,
    binary  => 100,
};
my $ellen = {
    name    => 'Ellen',
    country => 'America',
    perl    => 1,
    python  => 15,
    ruby    => 0.5,
    php     => 60,
    binary  => 0.01,
};

### 2-3. 五段階評価(score_star.pl)
# 下記を参考に、各人物の言語ごとの成績を5段階で出力して下さい。
# ```
#  0 - 19 =>
# 20 - 39 => *
# 40 - 59 => **
# 60 - 79 => ***
# 80 - 99 => ****
# 100     => *****
# ```

my @people    = ( $alice, $bob, $carol, $dave, $ellen );
my @languages = ( 'perl', 'python', 'ruby', 'php', 'binary' );

for my $member (@people) {
    print $member->{name} . "\n";
    for my $lang (@languages) {
        my $score = $member->{$lang};
        my $star;
        if ( $score == 100 ) {
            $star = '*****';
        }
        elsif ( $score >= 80 ) {
            $star = '****';
        }
        elsif ( $score >= 60 ) {
            $star = '***';
        }
        elsif ( $score >= 40 ) {
            $star = '***';
        }
        elsif ( $score >= 20 ) {
            $star = '***';
        }
        else{
            $star = '***';
        }
        print '  ' . $lang . ' : ' . $star . "\n";
    }

}

