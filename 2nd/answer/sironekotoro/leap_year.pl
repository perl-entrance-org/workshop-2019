use strict;
use warnings;

print 'INPUT YEAR: ';
my $input = <STDIN>;
chomp $input;

# 1. 西暦年号が4で割り切れる年をうるう年とする。
# 2. 例外として、西暦年号が100で割り切れて400で割り切れない年は平年とする

# 条件1. 4で割り切れること
if ( $input % 4 == 0 ) {

# 条件2. 例外として、西暦年号が100で割り切れて400で割り切れない年は平年とする
    if ( $input % 100 == 0 && $input % 400 != 0 ) {
        print "$input is normal year\n";
    }
    else {
        print "$input is leap year\n";
    }

}
else {
    print "$input is normal year\n";
}
