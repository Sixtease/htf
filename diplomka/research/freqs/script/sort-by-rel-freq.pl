#!/usr/bin/env perl

# orders words by how much more frequent they are here than in reference
# arg1: output directory
# arg2: reference frequency wordlist
# arg3 .. n: frequency wordlists in question
# prints to output directory/: form \t log(myFreq) - log(refFreq)

use utf8;
use strict;
use warnings;
use 5.010;

my $ref_fn = shift;
my %ref;

while (<>) {
  my ($logfq, $lemma) = split /\t/;
  $ref{$lemma} = $logfq;
  last if eof;
}

while (<>) {
}
