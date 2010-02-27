#!/usr/bin/perl -w

use Test::More 'no_plan';

package Catch;

sub TIEHANDLE {
	my($class, $var) = @_;
	return bless { var => $var }, $class;
}

sub PRINT  {
	my($self) = shift;
	${'main::'.$self->{var}} .= join '', @_;
}

sub OPEN  {}    # XXX Hackery in case the user redirects
sub CLOSE {}    # XXX STDERR/STDOUT.  This is not the behavior we want.

sub READ {}
sub READLINE {}
sub GETC {}
sub BINMODE {}

my $Original_File = 'lib/Bio/Search/Hit/PhatHit/tblastn.pm';

package main;

# pre-5.8.0's warns aren't caught by a tied STDERR.
$SIG{__WARN__} = sub { $main::_STDERR_ .= join '', @_; };
tie *STDOUT, 'Catch', '_STDOUT_' or die $!;
tie *STDERR, 'Catch', '_STDERR_' or die $!;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 10 lib/Bio/Search/Hit/PhatHit/tblastn.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('tblastn',
              'sample_data/tblastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/Hit/PhatHit/tblastn.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('tblastn',
              'sample_data/tblastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness




  isa_ok($hit, "Bio::Search::Hit::PhatHit::tblastn", "check type.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 94 lib/Bio/Search/Hit/PhatHit/tblastn.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('tblastn',
              'sample_data/tblastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness




;

  }
};
is($@, '', "example from line 94");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 94 lib/Bio/Search/Hit/PhatHit/tblastn.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('tblastn',
              'sample_data/tblastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness




  isa_ok($hit, "Bio::Search::Hit::PhatHit::tblastn", "check type.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 140 lib/Bio/Search/Hit/PhatHit/tblastn.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('tblastn',
              'sample_data/tblastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_natural_begin = $hit->nB('query');
 my $h_natural_begin = $hit->nB('hit');



;

  }
};
is($@, '', "example from line 140");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 140 lib/Bio/Search/Hit/PhatHit/tblastn.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('tblastn',
              'sample_data/tblastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_natural_begin = $hit->nB('query');
 my $h_natural_begin = $hit->nB('hit');



  is($q_natural_begin, 108, "Check the query's natural begin.");
  is($h_natural_begin, 3, "Check the hit's natural begin.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 202 lib/Bio/Search/Hit/PhatHit/tblastn.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('tblastn',
              'sample_data/tblastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_natural_end = $hit->nE('query');
 my $h_natural_end = $hit->nE('hit');



;

  }
};
is($@, '', "example from line 202");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 202 lib/Bio/Search/Hit/PhatHit/tblastn.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('tblastn',
              'sample_data/tblastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_natural_end = $hit->nE('query');
 my $h_natural_end = $hit->nE('hit');



  is($q_natural_end, 398, "Check the query's natural end.");
  is($h_natural_end, 935, "Check the hit's natural end.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

