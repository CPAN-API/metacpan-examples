#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );

use Search::Elasticsearch;

use lib './lib';
use MetaCPAN::Util qw( es );

my $module = es->search(
    index => 'cpan',
    type  => 'file',
    body  => {
        query  => { match_all => {} },
        filter => {
            and => [
                { term => { 'authorized'     => 'true' } },
                { term => { 'module.name'    => 'Acme::Hoge' } },
                { term => { 'module.version' => '0.03' } }
            ]
        },
    },
);

my $release_name = $module->{hits}{hits}[0]{_source}{release};

my $release = es->search(
    index => 'cpan',
    type  => 'release',
    body  => {
        filter => { term => { 'name' => $release_name } },
    },
);

say $release->{hits}{hits}[0]{_source}{download_url};
