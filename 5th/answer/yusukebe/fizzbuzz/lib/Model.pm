package Model;
use Mojo::Base -base;

sub fizzbuzz {
    my $num = shift;
    my $str = '';
    if ( $num % 3 == 0 ) {
        $str .= 'Fizz';
    }
    if ( $num % 5 == 0 ) {
        $str .= 'Buzz';
    }
    if ( $str eq '' ) {
        $str = $num;
    }
    return $str;
}

1;
