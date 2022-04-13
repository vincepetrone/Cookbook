#!/usr/bin/env perl

use v5.18;
use warnings;

my @array = qw( one two three );

push @array, qw( four five six );

say foreach @array;

my $next = shift @array;
say "after shift $next";

say foreach @array;
unshift @array, qw( one oneone );

say foreach @array;

say foreach @array;
push @array, qw( seven eight );
say foreach @array;

pop @array;
say foreach @array;
