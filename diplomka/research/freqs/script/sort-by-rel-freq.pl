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
use File::Basename qw(dirname basename);

my $MIN_FREQ = -15.5;

my $outdir = shift;
my %ref;

while (<>) {
  chomp;
  my ($logfq, $lemma) = split /\t/;
  $ref{$lemma} = $logfq if $logfq > $MIN_FREQ;
  last if eof;
}

my %freqd;

while (<>) {
  chomp;
  my ($logfq, $lemma) = split /\t/;
  $freqd{$lemma} = $logfq - $ref{$lemma} if exists $ref{$lemma};
  flush() if eof;
}

sub flush {
  my $stem = basename(dirname($ARGV));
  warn("$stem\n");
  open my $outfh, '>', "$outdir/$stem";
  say {$outfh} "$_\t$freqd{$_}" for sort { $freqd{$b} <=> $freqd{$a} } keys %freqd;
  %freqd = ();
}
