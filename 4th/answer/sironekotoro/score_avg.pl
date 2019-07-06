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

### 2-2. 言語ごとの平均(score_avg.pl)
# `$average` というハッシュリファレンスを新しく作ります。
# このハッシュリファレンスに、各人物の `perl`, `ruby`, `python`の3つのプログラミング言語のスコアの平均値を格納してください。
use Data::Dumper;

my @people = ( $alice, $bob, $carol, $dave, $ellen );
my @script_lang = ( 'perl', 'ruby', 'python' );
my $average     = {};

for my $member (@people) {
    my $name = $member->{name};
    my $sum  = 0;

    for my $lang (@script_lang) {
        $sum += $member->{$lang};
    }
    my $avg = $sum / 3;
    $average->{$name} = $avg;
}
print Dumper $average;
