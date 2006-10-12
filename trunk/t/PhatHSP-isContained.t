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
# BLASTN
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastn', 'sample_data/blastn.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastn");

is($hsp->isContained('query', 20), 0,
   "blastn: Check for position before the query sequence.");
is($hsp->isContained('query', 25), 1,
   "blastn: Check for position in the query sequence.");
is($hsp->isContained('query', 1000), 0,
   "blastn: Check for position after the query sequence.");

is($hsp->isContained('hit', 1000), 0,
   "blastn: Check for position before the hit sequence.");
is($hsp->isContained('hit', 16900), 1,
   "blastn: Check for position in the hit sequence.");
is($hsp->isContained('hit', 17500), 0,
   "blastn: Check for position after the hit sequence.");


#
# BLASTP
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastp', 'sample_data/blastp.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastp");

is($hsp->isContained('query', 0), 0,
   "blastp: Check for position before the query sequence.");
is($hsp->isContained('query', 10), 1,
   "blastp: Check for position that is a gap in the query sequence.");
is($hsp->isContained('query', 25), 1,
   "blastp: Check for position in the query sequence.");
is($hsp->isContained('query', 1000), 0,
   "blastp: Check for position after the query sequence.");

is($hsp->isContained('hit', 0), 0,
   "blastp: Check for position before the hit sequence.");
is($hsp->isContained('hit', 2), 1,
   "blastp: Check for position that is in the hit sequence.");
is($hsp->isContained('hit', 25), 1,
   "blastp: Check for position that is a gap in the hit sequence.");
is($hsp->isContained('hit', 1000), 0,
   "blastp: Check for position after the hit sequence.");

#
# BLASTX
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('blastx', 'sample_data/blastx.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastx");
is($hsp->length(),256, "Is this the right hsp?"); # blastx hsp's in odd order.

# negative strand....
is($hsp->isContained('query', 8350), 0,
   "blastx: Check for position before the query sequence.");
is($hsp->isContained('query', 8938), 1,
   "blastx: Check for position a gap in the query sequence.");
is($hsp->isContained('query', 9117), 1,
   "blastx: Check for position in the query sequence.");
is($hsp->isContained('query', 9120), 0,
   "blastx: Check for position after the query sequence.");

is($hsp->isContained('hit', 1300), 0,
   "blastx: Check for position before the hit sequence.");
is($hsp->isContained('hit', 1329), 1,
   "blastx: Check for position in the hit sequence.");
is($hsp->isContained('hit', 1585), 0,
   "blastx: Check for position after the hit sequence.");

#
# TBLASTN
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('tblastn', 'sample_data/tblastn.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastn");

is($hsp->isContained('query', 180), 0,
   "tblastn: Check for position before the query sequence.");
is($hsp->isContained('query', 199), 1,
   "tblastn: Check for position in the query sequence.");
is($hsp->isContained('query', 385), 0,
   "tblastn: Check for position after the query sequence.");

is($hsp->isContained('hit', 300), 0,
   "tblastn: Check for position before the hit sequence.");
is($hsp->isContained('hit', 310), 1,
   "tblastn: Check for position in the hit sequence.");
is($hsp->isContained('hit', 890), 0,
   "tblastn: Check for position after the hit sequence.");

#
# TBLASTX
#
$hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
  ('tblastx', 'sample_data/tblastx.sample.report');
$hsp = $hsps->[0];

isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastx");

is($hsp->isContained('query', 860), 0,
   "tblastx: Check for position before the query sequence.");
is($hsp->isContained('query', 873), 1,
   "tblastx: Check for position in the query sequence.");
is($hsp->isContained('query', 3415), 0,
   "tblastx: Check for position after the query sequence.");

is($hsp->isContained('hit', 70540), 0,
   "tblastx: Check for position before the hit sequence.");
is($hsp->isContained('hit', 70546), 1,
   "tblastx: Check for position in the hit sequence.");
is($hsp->isContained('hit', 73100), 0,
   "tblastx: Check for position after the hit sequence.");
