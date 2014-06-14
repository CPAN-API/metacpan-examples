#!/usr/bin/env perl

use strict;
use warnings;
use feature qw( say );

use MetaCPAN::Client;

my $mcpan    = MetaCPAN::Client->new;
my $html_pod = $mcpan->pod('Carton');
say $html_pod->html;
