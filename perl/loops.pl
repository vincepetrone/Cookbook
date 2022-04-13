#!/usr/bin/perl

use v5.18;
use warnings;

my @array = qw( one two three four five six seven eight );

#while ( @array ) {
#    say shift @array;
#}

# say shift @array until scalar @array == 0;
# say shift @array while @array;

#foreach my $s (@array) {
#    say $s;
#}

#say foreach @array;
#say $_ foreach @array;

#foreach (@array) {
#    say $_;
#}

while (@array) {
    my $s = shift @array;
    #next if $s eq "three";
    last if $s eq "three";
    say $s;
}
