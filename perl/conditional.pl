#!/usr/bin/perl

use v5.18;
use warnings;

my $num = 7;
my $num2 = 9;

if ( $num > $num2 ) {
    say "$num is greater than $num2";
}
else {
    say "$num is smaller than $num2";
}

say "$num is smaller than $num2" if $num < $num2;

my $big_number = 999;

if ($big_number < 100) {
    say "the number is small";
}
elsif ($big_number > 500 && $big_number < 900) {
    say "the numbers is getting bigger";
}
else {
    say "the number must be huge";
}
