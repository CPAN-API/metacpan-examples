#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );

use Data::Printer;
use MetaCPAN::Util qw( es );

my $files = es()->search(
    index => 'v0',
    type  => 'file',
    size  => 10,
    query => {
        filtered => {
            query  => { match_all => {} },
            filter => {
                and => [
                    { term => { 'path'      => 'cpanfile' } },
                    { term => { 'directory' => \0 } },
                ]
            },
        },
    },
    fields => [ 'release', 'author' ],
);

my @hits = @{ $files->{hits}->{hits} };
p @hits;
