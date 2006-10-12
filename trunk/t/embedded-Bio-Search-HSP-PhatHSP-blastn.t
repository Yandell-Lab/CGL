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

my $Original_File = 'lib/Bio/Search/HSP/PhatHSP/blastn.pm';

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

#line 10 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastn", "check type.");

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

#line 94 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 94");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 94 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::blastn", "check type.");

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

#line 139 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_char = $hsp->whatIsThere('query', 23); # the first match starts here
 my $h_char = $hsp->whatIsThere('hit', 16827); # ditto in subject

 my $q_gap = $hsp->whatIsThere('query', 38); # there's a query gap here
 my $h_gap = $hsp->whatIsThere('hit', 16847);




;

  }
};
is($@, '', "example from line 139");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 139 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_char = $hsp->whatIsThere('query', 23); # the first match starts here
 my $h_char = $hsp->whatIsThere('hit', 16827); # ditto in subject

 my $q_gap = $hsp->whatIsThere('query', 38); # there's a query gap here
 my $h_gap = $hsp->whatIsThere('hit', 16847);




  is($q_char, "A", "check base at postition 23 in query.");
  is($h_char, "A", "check base at postition 16827 in hit.");
  is($q_gap, "T", "check for the gap at pos 38 in query.");
  is($h_gap, "G", "check base at postition 16847 in hit.");

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

#line 236 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




;

  }
};
is($@, '', "example from line 236");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 236 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




  is($name, "3197985", "Check the name of the sequence that was hit.");

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

#line 276 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




;

  }
};
is($@, '', "example from line 276");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 276 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




  is($q_natural_begin, 23, "check query's natural begin.");
  is($h_natural_begin, 16827, "check hit's natural begin.");

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

#line 329 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




;

  }
};
is($@, '', "example from line 329");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 329 lib/Bio/Search/HSP/PhatHSP/blastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




  is($q_natural_end, 698, "check query's natural begin.");
  is($h_natural_end, 17492, "check hit's natural begin.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

