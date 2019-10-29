use strict;
use warnings;

print 'INPUT YEAR: ';
my $input = <STDIN>;
chomp $input;

# 1. 西暦年号が4で割り切れる年をうるう年とする。
# 2. 例外として、西暦年号が100で割り切れて400で割り切れない年は平年とする

# 時間を扱うモジュール（第4章、第5章で学習）を使う
use Time::Piece;

my $year = Time::Piece->strptime( $input, '%Y' );
if ( $year->is_leap_year ) {
    print "$input is leap year\n";
}
else {
    print "$input is normal year\n";
}
