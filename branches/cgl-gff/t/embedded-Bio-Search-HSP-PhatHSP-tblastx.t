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

my $Original_File = 'lib/Bio/Search/HSP/PhatHSP/tblastx.pm';

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

#line 10 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastx", "check type.");

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

#line 94 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 94");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 94 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastx", "check type.");

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

#line 138 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_char = $hsp->whatIsThere('query', 869); # the first match starts here
 my $h_char = $hsp->whatIsThere('hit', 70542); # ditto in subject

 my $h_gap = $hsp->whatIsThere('hit', 70559); # ditto in subject




;

  }
};
is($@, '', "example from line 138");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 138 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_char = $hsp->whatIsThere('query', 869); # the first match starts here
 my $h_char = $hsp->whatIsThere('hit', 70542); # ditto in subject

 my $h_gap = $hsp->whatIsThere('hit', 70559); # ditto in subject




  is($q_char, "S", "check amino acid at postition 869 in query.");
  is($h_char, "S", "check amino acid at postition 70542 in hit.");
  is($h_gap, "E", "check amino acid at postition 70559 in hit.");

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

#line 207 lib/Bio/Search/HSP/PhatHSP/tblastx.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 207");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 207 lib/Bio/Search/HSP/PhatHSP/tblastx.pm

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

#line 250 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




;

  }
};
is($@, '', "example from line 250");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 250 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




  is($name, "Contig190.4:0", "Check the hit's name.");

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

#line 290 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




;

  }
};
is($@, '', "example from line 290");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 290 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




  is($q_natural_begin, 869, "Check the beginning of the query.");
  is($h_natural_begin, 70542, "Check the beginning of the hit.");

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

#line 343 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




;

  }
};
is($@, '', "example from line 343");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 343 lib/Bio/Search/HSP/PhatHSP/tblastx.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastx',
              'sample_data/tblastx.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




  is($q_natural_end, 3412, "Check the end of the query.");
  is($h_natural_end, 73097, "Check the end of the hit.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

