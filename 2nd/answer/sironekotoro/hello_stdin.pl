#!/usr/bin/env perl
use strict;
use warnings;

print 'Your Name?> ';

my $input = <STDIN>;
chomp $input;
print 'Hello ' . $input . '!' . "\n";

print 'Your OS?> ';
my $os = <STDIN>;
chomp $os;
print $os . ' is useful OS!' . "\n";
