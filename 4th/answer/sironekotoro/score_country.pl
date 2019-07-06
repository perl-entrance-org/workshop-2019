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

### 2-4. 国ごとのPerlハイスコアリストを作る(score_country.pl)

# `$highscore`というハッシュリファレンスを作成し、国（country）ごとの `perl` のスコアが 60 以上の人の名前を格納しましょう。

use Data::Dumper;

my $highscore = {};
my @people = ( $alice, $bob, $carol, $dave, $ellen );

for my $member (@people) {
    my $name = $member->{name};
    my $country = $member->{country};

    my $perl_score = $member->{perl};
    if ($perl_score >= 60){
        push @{$highscore->{$country}} , $name;
    }

}
print Dumper $highscore;