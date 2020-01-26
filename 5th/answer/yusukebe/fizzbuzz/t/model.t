use strict;
use Test::More;

BEGIN {
    use_ok('Model');
}

is Model::fizzbuzz(1), '1';
is Model::fizzbuzz(2), '2';
is Model::fizzbuzz(3), 'Fizz';
is Model::fizzbuzz(4), '4';
is Model::fizzbuzz(5), 'Buzz';
is Model::fizzbuzz(15), 'FizzBuzz';

done_testing;
