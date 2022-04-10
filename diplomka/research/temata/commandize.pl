#!/usr/bin/perl

use utf8;
use strict;
use warnings;

while (<>) {
  if (/^ /) {
    s{^  }{mplayer};
    s{ +}{#ts=};
    s{^}{  };
  }
  print;
}
