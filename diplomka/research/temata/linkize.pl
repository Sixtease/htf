#!/usr/bin/perl

use utf8;
use strict;
use warnings;

while (<>) {
  if (/^ /) {
    s{^  }{http://radio.makon.cz/zaznam/};
    s{ +}{#ts=};
    s{^}{  };
  }
  print;
}
