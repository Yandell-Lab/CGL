#!/usr/bin/perl -w

#use Test::More tests => $Num_Tests;

use Test::More qw(no_plan);

BEGIN {
  use_ok( 'Bio::Search::HSP::PhatHSP::Base');
  use_ok( 'Bio::Search::HSP::PhatHSP::blastn' );
  use_ok( 'Bio::Search::HSP::PhatHSP::blastp' );
  use_ok( 'Bio::Search::HSP::PhatHSP::blastx' );
  use_ok( 'Bio::Search::HSP::PhatHSP::tblastn' );
  use_ok( 'Bio::Search::HSP::PhatHSP::tblastx' );
}

my $hsps;			# an array of hsps from a report.
my $hsp;			# a single hsp with which to test.

#
# BLASTN +/+
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastn', 'sample_data/blastn.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastn");

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 23), "A",
   "blastn +/+: ask what's at position 23 in the query.");
is($hsp->whatIsThere('hit', 16827), "A",
   "blastn +/+: ask what's at position 16827 in the hit.");

# these should return undef, being before nB.
is($hsp->whatIsThere('query', 22), undef,
   "blastn +/+: ask what's at position 22 in the query.");
is($hsp->whatIsThere('hit', 16826), undef,
   "blastn +/+: ask what's at position 16826 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 698), "A",
   "blastn +/+: ask what's at position 698 in the query.");
is($hsp->whatIsThere('hit', 17492), "A",
   "blastn +/+: ask what's at position 17492 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 699), undef,
   "blastn +/+: ask what's at position 699 in the query.");
is($hsp->whatIsThere('hit', 17493), undef,
   "blastn +/+: ask what's at position 17493 in the hit.");

# There's a gap at pos. 38 in the hsp, should get back the "T" after it.
is($hsp->whatIsThere('query', 38), "T",
   "blastn +/+: ask what's at position 38 in the query (gap test).");
is($hsp->whatIsThere('hit', 16848), "A",
   "blastn +/+: ask what's at position 16848 in the hit (gap test).");

#
# BLASTN -/+
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastn', 'sample_data/blastn.1.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastn");

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 527), "T",
   "blastn -/+: ask what's at position 527 in the query.");
is($hsp->whatIsThere('hit', 398896), "T",
   "blastn -/+: ask what's at position 398896 in the hit.");

# these should return undef, being before nB.
is($hsp->whatIsThere('query', 528), undef,
   "blastn -/+: ask what's at position 528 in the query.");
is($hsp->whatIsThere('hit', 398895), undef,
   "blastn -/+: ask what's at position 398895 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 53), "T",
   "blastn -/+: ask what's at position 698 in the query.");
is($hsp->whatIsThere('hit', 399369), "T",
   "blastn -/+: ask what's at position 399369 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 52), undef,
   "blastn -/+: ask what's at position 52 in the query.");
is($hsp->whatIsThere('hit', 399370), undef,
   "blastn -/+: ask what's at position 399370 in the hit.");

# There's a gap at pos. 515 in the hsp, should get back the "A" after it.
is($hsp->whatIsThere('query', 515), "A",
   "blastn -/+: ask what's at position 515 in the query (gap test).");
is($hsp->whatIsThere('hit', 398921), "G",
   "blastn -/+: ask what's at position 398921 in the hit (gap test).");

#
# BLASTP
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastp', 'sample_data/blastp.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastp");

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 1), "M",
   "blastp: ask what's at position 1 in the query.");
is($hsp->whatIsThere('hit', 1), "M",
   "blastp: ask what's at position 1 in the hit.");

# these should return undef, being before nB.
# (yeah, 0's odd...)
is($hsp->whatIsThere('query', 0), undef,
   "blastp: ask what's at position 0 in the query.");
is($hsp->whatIsThere('hit', 0), undef,
   "blastp: ask what's at position 0 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 623), "W",
   "blastp: ask what's at position 623 in the query.");
is($hsp->whatIsThere('hit', 615), "W",
   "blastp: ask what's at position 615 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 624), undef,
   "blastp: ask what's at position 624 in the query.");
is($hsp->whatIsThere('hit', 616), undef,
   "blastp: ask what's at position 616 in the hit.");

# No gaps in blastp sample, can't test for them....
#is($hsp->whatIsThere('query', 38), "T",
#   "blastp: ask what's at position 38 in the query (gap test).");
#is($hsp->whatIsThere('hit', 16848), "A",
#   "blastp: ask what's at position 16848 in the hit (gap test).");

#
# BLASTP gap tests
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastp', 'sample_data/blastp.1.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastp");

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 148), "A",
   "blastp gap tests: ask what's at position 148 in the query.");
is($hsp->whatIsThere('hit', 384), "A",
   "blastp gap tests: ask what's at position 384 in the hit.");

# these should return undef, being before nB.
is($hsp->whatIsThere('query', 147), undef,
   "blastp gaps: ask what's at position 147 in the query.");
is($hsp->whatIsThere('hit', 383), undef,
   "blastp gap tests: ask what's at position 0 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 353), "P",
   "blastp gap tests: ask what's at position 353 in the query.");
is($hsp->whatIsThere('hit', 588), "P",
   "blastp gap tests: ask what's at position 588 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 354), undef,
   "blastp gap tests: ask what's at position 354 in the query.");
is($hsp->whatIsThere('hit', 589), undef,
   "blastp gap tests: ask what's at position 589 in the hit.");

is($hsp->whatIsThere('query', 225), "W",
   "blastp gap tests: ask what's at position 225 in the query (gap test).");
is($hsp->whatIsThere('hit', 462), "Y",
   "blastp gap tests: ask what's at position 16848 in the hit (gap test).");

#
# BLASTX -/+
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastx', 'sample_data/blastx.1.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastx");
is($hsp->length(),150, "Is this the right hsp?"); # blastx hsp's in odd order.

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 507), "S",
   "blastx -/+: ask what's at position 507 in the query.");
is($hsp->whatIsThere('hit', 4), "S",
   "blastx -/+: ask what's at position 4 in the hit.");

# these should return undef, being before the hsp.
is($hsp->whatIsThere('query', 508), undef,
   "blastx -/+: ask what's at position 508 in the query.");
is($hsp->whatIsThere('hit', 3), undef,
   "blastx -/+: ask what's at position 3 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 58), "G",
   "blastx -/+: ask what's at position 8354 in the query.");
is($hsp->whatIsThere('hit', 152), "G",
   "blastx -/+: ask what's at position 152 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 57), undef,
   "blastx -/+: ask what's at position 57 in the query.");
is($hsp->whatIsThere('hit', 153), undef,
   "blastx -/+: ask what's at position 153 in the hit.");

# There's a stop at pos. 9088 in the hsp.
#is($hsp->whatIsThere('query', 9088), "*",
#   "blastx -/+: ask what's at position 9088 in the query (stop test).");

# There's a gap at pos. 8938 in the hsp, should get back the "T" after it.
is($hsp->whatIsThere('hit', 63), "T",
   "blastx -/+: ask what's at position 63 in the query (gap test).");

#
# BLASTX +/+
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastx', 'sample_data/blastx.2.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastx");
is($hsp->length(),196, "Is this the right hsp?"); # blastx hsp's in odd order.

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 57), "N",
   "blastx +/+: ask what's at position 57 in the query.");
is($hsp->whatIsThere('hit', 436), "S",
   "blastx +/+: ask what's at position 436 in the hit.");

# these should return undef, being before the hsp.
is($hsp->whatIsThere('query', 56), undef,
   "blastx +/+: ask what's at position 56 in the query.");
is($hsp->whatIsThere('hit', 435), undef,
   "blastx +/+: ask what's at position 435 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 629), "S",
   "blastx +/+: ask what's at position 8354 in the query.");

is($hsp->whatIsThere('hit', 628), "S",
   "blastx +/+: ask what's at position 152 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 630), undef,
   "blastx +/+: ask what's at position 630 in the query.");
is($hsp->whatIsThere('hit', 629), undef,
   "blastx +/+: ask what's at position 629 in the hit.");

# There's a stop at pos. 9088 in the hsp.
#is($hsp->whatIsThere('query', 9088), "*",
#   "blastx +/+: ask what's at position 9088 in the query (stop test).");

# There's a gap at pos. 98 in the hsp, should get back the "L" after it.
is($hsp->whatIsThere('query', 99), "L",
   "blastx +/+: ask what's at position 98 in the query (gap test).");

#
# TBLASTN +/+ HSP
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('tblastn', 'sample_data/tblastn.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastn");

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 189), "A",
   "tblastn +/+: ask what's at position 189 in the query.");
is($hsp->whatIsThere('hit', 302), "A",
   "tblastn +/+: ask what's at position 302 in the hit.");

# these should return undef, being before the hsp.
is($hsp->whatIsThere('query', 188), undef,
   "tblastn +/+: ask what's at position 188 in the query.");
is($hsp->whatIsThere('hit', 301), undef,
   "tblastn: ask what's at position 301 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 379), "G",
   "tblastn +/+: ask what's at position 379 in the query.");
is($hsp->whatIsThere('hit', 874), "G",
   "tblastn +/+: ask what's at position 874 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 380), undef,
   "tblastn +/+: ask what's at position 380 in the query.");
is($hsp->whatIsThere('hit', 875), undef,
   "tblastn +/+: ask what's at position 875 in the hit.");

#
# TBLASTN +/- HSP
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('tblastn', 'sample_data/tblastn.1.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastn");

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 70), "K",
   "tblastn +/-: ask what's at position 70 in the query.");
is($hsp->whatIsThere('hit', 13816811), "K",
   "tblastn +/-: ask what's at position 13816811 in the hit.");

# these should return undef, being before the hsp.
is($hsp->whatIsThere('query', 69), undef,
   "tblastn +/-: ask what's at position 69 in the query.");
is($hsp->whatIsThere('hit', 13816812), undef,
   "tblastn +/-: ask what's at position 13816812 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 189), "D",
   "tblastn +/-: ask what's at position 189 in the query.");
is($hsp->whatIsThere('hit', 13816452), "D",
   "tblastn +/-: ask what's at position 13816452 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 190), undef,
   "tblastn +/-: ask what's at position 190 in the query.");
is($hsp->whatIsThere('hit',  13816451), undef,
   "tblastn +/-: ask what's at position 13816451 in the hit.");


#
# TBLASTX +/+
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('tblastx', 'sample_data/tblastx.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastx");

#fail("Try some locations in the middle of the hsp & check for off by a bit.");
# these are at the start of the hsp.
is($hsp->whatIsThere('query', 869), "S",
   "tblastx +/+: ask what's at position 869 in the query.");
is($hsp->whatIsThere('query', 870), "S",
   "tblastx +/+: ask what's at position 870 in the query.");
is($hsp->whatIsThere('query', 871), "S",
   "tblastx +/+: ask what's at position 871 in the query.");
is($hsp->whatIsThere('query', 872), "F",
   "tblastx +/+: ask what's at position 872 in the query.");
is($hsp->whatIsThere('hit', 70542), "S",
   "tblastx +/+: ask what's at position 70542 in the hit.");
is($hsp->whatIsThere('hit', 70543), "S",
   "tblastx +/+: ask what's at position 70543 in the hit.");
is($hsp->whatIsThere('hit', 70544), "S",
   "tblastx +/+: ask what's at position 70544 in the hit.");
is($hsp->whatIsThere('hit', 70545), "L",
   "tblastx +/+: ask what's at position 70545 in the hit.");

# these should return undef, being before the hsp.
is($hsp->whatIsThere('query', 868), undef,
   "tblastx +/+: ask what's at position 868 in the query.");
# step back into the gap via base 3
is($hsp->whatIsThere('hit', 70541), undef,
   "tblastx +/+: ask what's at position 70541 in the hit.");
is($hsp->whatIsThere('hit', 70540), undef,
   "tblastx +/+: ask what's at position 70540 in the hit.");
is($hsp->whatIsThere('hit', 70539), undef,
   "tblastx +/+: ask what's at position 70539 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 3410), "L",
   "tblastx +/+: ask what's at position 3410 in the query.");
is($hsp->whatIsThere('query', 3411), "L",
   "tblastx +/+: ask what's at position 3411 in the query.");
is($hsp->whatIsThere('query', 3412), "L",
   "tblastx +/+: ask what's at position 3412 in the query.");
is($hsp->whatIsThere('hit', 73094), "K",
   "tblastx +/+: ask what's at position 73094 in the hit.");
is($hsp->whatIsThere('hit', 73095), "L",
   "tblastx +/+: ask what's at position 73095 in the hit.");
is($hsp->whatIsThere('hit', 73096), "L",
   "tblastx +/+: ask what's at position 73096 in the hit.");
# tblastx numbers one past last position...
#fail("Check this with Mark."); 
is($hsp->whatIsThere('hit', 73097), L,
   "tblastx +/+: ask what's at position 73097 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 3413), undef,
   "tblastx +/+: ask what's at position 3413 in the query.");
is($hsp->whatIsThere('hit', 73098), undef,
   "tblastx +/+: ask what's at position 73098 in the hit.");

# There's a stop at pos. 1103 in the hsp.
is($hsp->whatIsThere('query', 1103), "*",
   "tblastx +/+: ask what's at position 1103 in the query (stop test).");
# There's a stop at pos. 70773 in the hsp.
is($hsp->whatIsThere('hit', 70773), "*",
   "tblastx +/+: ask what's at position 70773 in the hit (stop test).");

# There's a gap at pos. 1505 in the hsp, should get back the "T" after it.
is($hsp->whatIsThere('query', 1505), "Q",
   "tblastx +/+: ask what's at position 1505 in the query (gap test).");
# There's a gap at pos. 71142 in the hsp, should get back the "T" after it.
is($hsp->whatIsThere('hit', 71142), "R",
   "tblastx +/+: ask what's at position 71142 in the hit (gap test).");


#
# TBLASTX +/- HSP
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('tblastx', 'sample_data/tblastx.1.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastx");

# these are at the start of the hsp.
is($hsp->whatIsThere('query', 325), "G",
   "tblastx +/-: ask what's at position 325 in the query.");
is($hsp->whatIsThere('hit', 2201707), "G",
   "tblastx +/-: ask what's at position 2201707 in the hit.");

# these should return undef, being before the hsp.
is($hsp->whatIsThere('query', 324), undef,
   "tblastx +/-: ask what's at position 324 in the query.");
is($hsp->whatIsThere('hit', 2201708), undef,
   "tblastx +/-: ask what's at position 2201708 in the hit.");

# these are at the end of the hsp.
is($hsp->whatIsThere('query', 924), "D",
   "tblastx +/-: ask what's at position 924 in the query.");
is($hsp->whatIsThere('hit', 2201093), "D",
   "tblastx +/-: ask what's at position 2201093 in the hit.");

# these should return undef, being after nE
is($hsp->whatIsThere('query', 925), undef,
   "tblastx +/-: ask what's at position 925 in the query.");
is($hsp->whatIsThere('hit',  2201092), undef,
   "tblastx +/-: ask what's at position 2201092 in the hit.");




