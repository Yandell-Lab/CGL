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

my $Original_File = 'lib/Bio/Search/HSP/PhatHSP/blastx.pm';

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

#line 10 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastx", "check type.");

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

#line 94 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 94");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 94 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastx", "check type.");

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

#line 138 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_before = $hsp->isContained('query', 8000);
 my $q_in = $hsp->isContained('query', 8400);
 my $q_after = $hsp->isContained('query', 9125);

 my $h_before = $hsp->isContained('hit', 1300);
 my $h_in = $hsp->isContained('hit', 1350);
 my $h_after = $hsp->isContained('hit', 1610);




;

  }
};
is($@, '', "example from line 138");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 138 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_before = $hsp->isContained('query', 8000);
 my $q_in = $hsp->isContained('query', 8400);
 my $q_after = $hsp->isContained('query', 9125);

 my $h_before = $hsp->isContained('hit', 1300);
 my $h_in = $hsp->isContained('hit', 1350);
 my $h_after = $hsp->isContained('hit', 1610);




  is($q_before, 0, "Check for position before the query sequence.");
  is($q_in, 1, "Check for position in the query sequence.");
  is($q_after, 0, "Check for position after the query sequence.");
  is($h_before, 0, "Check for position before the hit sequence.");
  is($h_in, 1, "Check for position in the hit sequence.");
  is($h_after, 0, "Check for position after the hit sequence.");

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

#line 207 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_char = $hsp->whatIsThere('query', 9118); # the first match starts here
 my $h_char = $hsp->whatIsThere('hit', 1328); # ditto in subject

 my $q_gap = $hsp->whatIsThere('query', 8940); # there's a query gap here
 my $h_gap = $hsp->whatIsThere('hit', 1394);




;

  }
};
is($@, '', "example from line 207");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 207 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_char = $hsp->whatIsThere('query', 9118); # the first match starts here
 my $h_char = $hsp->whatIsThere('hit', 1328); # ditto in subject

 my $q_gap = $hsp->whatIsThere('query', 8940); # there's a query gap here
 my $h_gap = $hsp->whatIsThere('hit', 1394);




  is($q_char, "M", "check base at postition 9118 in query.");
  is($h_char, "M", "check base at postition 1328 in hit.");
  is($q_gap, "K", "check for the gap at pos 8937 in query.");
  is($h_gap, "N", "check base at postition 1394 in hit.");

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

#line 282 lib/Bio/Search/HSP/PhatHSP/blastx.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 282");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 282 lib/Bio/Search/HSP/PhatHSP/blastx.pm

  use PROTO;
  my $foo = new PROTO;




  isa_ok($foo, "PROTO", "Check if it's the right type.");

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

#line 326 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




;

  }
};
is($@, '', "example from line 326");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 326 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




  is($name, "roo|orf1", "check type.");

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

#line 366 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




;

  }
};
is($@, '', "example from line 366");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 366 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




  is($q_natural_begin, 9118, "Check the query's natural begin.");
  is($h_natural_begin, 1328, "Check the hit's natural begin.");

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

#line 422 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




;

  }
};
is($@, '', "example from line 422");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 422 lib/Bio/Search/HSP/PhatHSP/blastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastx',
              'sample_data/blastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




  is($q_natural_end, 8354, "Check the query's natural end.");
  is($h_natural_end, 1583, "Check the hit's natural end.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

