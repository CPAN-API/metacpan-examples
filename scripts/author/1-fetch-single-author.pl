#!/usr/bin/env perl

use strict;
use warnings;

use Data::Printer;
use MetaCPAN::Client;

my $mcpan  = MetaCPAN::Client->new( version => 'v1' );
my $author = $mcpan->author('MSTROUT');

p $author;
