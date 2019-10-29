use strict;
use warnings;

print 'INPUT YEAR: ';
my $input = <STDIN>;
chomp $input;

# 1. 西暦年号が4で割り切れる年をうるう年とする。
# 2. 例外として、西暦年号が100で割り切れて400で割り切れない年は平年とする

# if文の条件判定を「平年になるもの」に注目した場合
if ( $input % 100 == 0 && $input % 400 != 0 || $input % 4 != 0 ) {
    print "$input is normal year\n";
}
else {
    print "$input is leap year\n";
}

