#!/usr/bin/env perl
use strict;
use warnings;

print 'input some words > ';

while ( chomp( my $input = <STDIN> ) ) {

   # - 文字列が`0`の場合, ループを抜ける(`last`を使って...).
    if ( $input eq 0 ) {
        last;
    }

# - 文字列が`perl`ないし`Perl`を含む場合, ｢Find Perl!｣と表示する.
    if ( $input =~ /[Pp]erl/ ) {
        print 'Find Perl!' . "\n";
    }

# - 文字列に大文字小文字問わず, `python`の文字列が含まれる場合, ｢Find Python!｣と表示する.
    if ( $input =~ /python/i ) {
        print 'Find Python!' . "\n";
    }

# - 文字列に`perl`ないし`ruby`ないし`python`が含まれる場合, ｢Love Programming!｣と表示する.
    if ( $input =~ /perl|ruby|python/ ) {
        print 'Love Programming!' . "\n";
    }

# - 文字列の先頭に`papix`がある場合, ｢Find papix!｣と表示する.
    if ( $input =~ /^papix/ ) {
        print 'Find papix!' . "\n";
    }

# - 文字列に`Hello`が含まれる場合, その後に続く単語`xxxx`を使って｢Hello! xxxx!｣と表示する.
#     - 例えば, 文字列に｢Hello papix｣が含まれる場合, ｢Hello! papix!｣と表示すればOKです.
    if ( $input =~ /Hello (\w+)/ ) {
        if ($1) {
            print 'Hello! ' . $1 . "!\n";
        }
    }

    print 'input some words > ';

}

