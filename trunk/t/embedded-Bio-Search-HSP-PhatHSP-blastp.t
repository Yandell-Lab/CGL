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

my $Original_File = 'lib/Bio/Search/HSP/PhatHSP/blastp.pm';

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

#line 10 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastp", "check type.");

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

#line 94 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 94");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 94 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastp", "check type.");

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

#line 138 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 138");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 138 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastp", "check type.");

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

#line 179 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $q_before = $hsp->isContained('query', 0);
 my $q_in = $hsp->isContained('query', 25);
 my $q_after = $hsp->isContained('query', 1000);

 my $h_before = $hsp->isContained('hit', 0);
 my $h_in = $hsp->isContained('hit', 53);
 my $h_after = $hsp->isContained('hit', 1000);




;

  }
};
is($@, '', "example from line 179");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 179 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $q_before = $hsp->isContained('query', 0);
 my $q_in = $hsp->isContained('query', 25);
 my $q_after = $hsp->isContained('query', 1000);

 my $h_before = $hsp->isContained('hit', 0);
 my $h_in = $hsp->isContained('hit', 53);
 my $h_after = $hsp->isContained('hit', 1000);




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

#line 240 lib/Bio/Search/HSP/PhatHSP/blastp.pm
  use Bio::Search::HSP::PhatHSP::Base;
  my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
             ('blastp', 'sample_data/blastp.sample.report');



  my $hsp = $hsps->[0];
  my $q_char = $hsp->whatIsThere('query', 1);
  my $h_char = $hsp->whatIsThere('hit', 1);




;

  }
};
is($@, '', "example from line 240");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 240 lib/Bio/Search/HSP/PhatHSP/blastp.pm
  use Bio::Search::HSP::PhatHSP::Base;
  my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs
             ('blastp', 'sample_data/blastp.sample.report');



  my $hsp = $hsps->[0];
  my $q_char = $hsp->whatIsThere('query', 1);
  my $h_char = $hsp->whatIsThere('hit', 1);




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastp");
  # these are at the start of the hsp.
  is($hsp->whatIsThere('query', 1), "M",
     "blastp: ask what's at position 1 in the query.");
  is($hsp->whatIsThere('hit', 1), "M",
     "blastp: ask what's at position 1 in the hit.");

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

#line 314 lib/Bio/Search/HSP/PhatHSP/blastp.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 314");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 314 lib/Bio/Search/HSP/PhatHSP/blastp.pm

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

#line 357 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




;

  }
};
is($@, '', "example from line 357");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 357 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




  is($name, "CG9522-PA.3", "Check the hit's name.");

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

#line 397 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




;

  }
};
is($@, '', "example from line 397");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 397 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




  is($q_natural_begin, 1, "Check the query's natural begin.");
  is($h_natural_begin, 1, "Check the hit's natural begin.");

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

#line 447 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




;

  }
};
is($@, '', "example from line 447");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 447 lib/Bio/Search/HSP/PhatHSP/blastp.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastp',
              'sample_data/blastp.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




  is($q_natural_end, 623, "Check the query's natural end.");
  is($h_natural_end, 615, "Check the hit's natural end.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

