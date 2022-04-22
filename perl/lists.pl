#!/usr/bin/env perl

use v5.18;
use warnings;

my @array = qw( one two three );
say foreach @array; printf "\n";

push @array, qw( four five six );
say foreach @array; printf "\n"; 

my $item = shift @array;
say qq(pulled "$item" from array with shift function); printf "\n";
say foreach @array; printf "\n";

unshift @array, qw( one );
say qq(put "one" back at start of array with unshift function); printf "\n";
say foreach @array; printf "\n";

push @array, qw( seven eight nine ten );
say qq(put four more numbers at end of array with push function); printf "\n";
say foreach @array; printf "\n";

my $p = pop @array;
say qq(pulled an item named "$p" from the end of the array with pop function); printf "\n";
say foreach @array;
