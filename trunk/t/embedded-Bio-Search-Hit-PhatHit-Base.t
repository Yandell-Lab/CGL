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

my $Original_File = 'lib/Bio/Search/Hit/PhatHit/Base.pm';

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

#line 10 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness




  # kinky type check to search up inheritance tree (man UNIVERSAL)
  is($hit->isa("Bio::Search::Hit::PhatHit::Base"), 1, "check type.");

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

#line 95 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness




;

  }
};
is($@, '', "example from line 95");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 95 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness




  # kinky Test::More type check to search up inheritance tree (man UNIVERSAL)
  is($hit->isa("Bio::Search::Hit::PhatHit::Base"), 1, "check type.");

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

#line 141 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $id1 = $hit->id('Testing321');
 my $id2 = $hit->id();
 my $id3 = $hit->id(undef);




;

  }
};
is($@, '', "example from line 141");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 141 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $id1 = $hit->id('Testing321');
 my $id2 = $hit->id();
 my $id3 = $hit->id(undef);




  # kinky type check to search up inheritance tree (man UNIVERSAL)
  is($id1, 'Testing321', "Check id getter/setter (setting).");
  is($id2, 'Testing321', "Check id getter/setter (getting).");
  is($id3, undef, "Check id getter/setter (unsetting).");

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

#line 190 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_strand = $hit->strand('query');
 my $h_strand = $hit->strand('hit');
 my @strand = $hit->strand();




;

  }
};
is($@, '', "example from line 190");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 190 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_strand = $hit->strand('query');
 my $h_strand = $hit->strand('hit');
 my @strand = $hit->strand();




  is($q_strand, 1, "Check query strand.");
  is($h_strand, 1, "Check hit strand.");
  is(scalar(@strand), 2, "Check the size of the strand array");
  is($strand[0], 1, "Check query strand from the array.");
  is($strand[1], 1, "Check hit strand from the array.");

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

#line 260 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my @hsps = $hit->hsps();
 my $hsp_count = $hit->hsps();




;

  }
};
is($@, '', "example from line 260");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 260 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my @hsps = $hit->hsps();
 my $hsp_count = $hit->hsps();




  isa_ok($hsps[0], "Bio::Search::HSP::PhatHSP::blastn", "check type.");
  is($hsp_count, 2, "Check the number of hsps in the hit.");

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

#line 316 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $percent_aligned = $hit->pAq(775); # query length from blast report.




;

  }
};
is($@, '', "example from line 316");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 316 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $percent_aligned = $hit->pAq(775); # query length from blast report.




  is($percent_aligned, 153.8, "Check percent aligned in query.");

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

#line 366 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $percent_aligned = $hit->pAh();




;

  }
};
is($@, '', "example from line 366");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 366 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $percent_aligned = $hit->pAh();




  is($percent_aligned, 1.613, "Check percent aligned in hit.");

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

#line 411 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my ($q_length, $h_length) = $hit->getLengths();




;

  }
};
is($@, '', "example from line 411");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 411 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my ($q_length, $h_length) = $hit->getLengths();




  is($q_length, 1192, "Check the query length.");
  is($h_length, 1179, "Check the hit length.");

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

#line 502 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_hsps = $hit->revSortFeatures('query');
 my $h_hsps = $hit->revSortFeatures('hit');




;

  }
};
is($@, '', "example from line 502");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 502 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_hsps = $hit->revSortFeatures('query');
 my $h_hsps = $hit->revSortFeatures('hit');




 is($q_hsps->[0]->nE('query'), 742, "Check the end of the first hsp (query).");
 is($h_hsps->[0]->nE('hit'), 17492, "Check the end of the first hsp (hit).");

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

#line 548 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_hsps = $hit->sortFeatures('query');
 my $h_hsps = $hit->sortFeatures('hit');




;

  }
};
is($@, '', "example from line 548");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 548 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $q_hsps = $hit->sortFeatures('query');
 my $h_hsps = $hit->sortFeatures('hit');




 is($q_hsps->[0]->nB('query'), 23, "Check the end of the first hsp (query).");
 is($h_hsps->[0]->nB('hit'), 16596, "Check the end of the first hsp (hit).");

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

#line 595 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $query_length = $hit->queryLength(775);




;

  }
};
is($@, '', "example from line 595");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 595 lib/Bio/Search/Hit/PhatHit/Base.pm
 use Bio::Search::Hit::PhatHit::Base;
 my $hits = Bio::Search::Hit::PhatHit::Base::_getTestHits('blastn',
              'sample_data/blastn.sample.report');



 my $hit = $hits->[0];		# $hits is filled in by test harness
 my $query_length = $hit->queryLength(775);




  is($query_length, 775, "Check the query length.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

