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

my $Original_File = 'lib/Bio/Search/HSP/PhatHSP/tblastn.pm';

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

#line 10 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastn", "check type.");

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

#line 94 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




;

  }
};
is($@, '', "example from line 94");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 94 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness




  isa_ok($hsp, "Bio::Search::HSP::PhatHSP::tblastn", "check type.");

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

#line 138 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_char = $hsp->whatIsThere('query', 190); # the first match starts here
 my $h_char = $hsp->whatIsThere('hit', 305); # ditto in subject




;

  }
};
is($@, '', "example from line 138");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 138 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_char = $hsp->whatIsThere('query', 190); # the first match starts here
 my $h_char = $hsp->whatIsThere('hit', 305); # ditto in subject




  is($q_char, "W", "check base at postition 190 in query.");
  is($h_char, "W", "check base at postition 305 in hit.");

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

#line 207 lib/Bio/Search/HSP/PhatHSP/tblastn.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 207");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 207 lib/Bio/Search/HSP/PhatHSP/tblastn.pm

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

#line 253 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




;

  }
};
is($@, '', "example from line 253");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 253 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $name = $hsp->name();




  is($name, "16441_3L_14945075_14946008_933_4_937:0", "Check the hit's name.");

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

#line 293 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




;

  }
};
is($@, '', "example from line 293");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 293 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_begin = $hsp->nB('query');
 my $h_natural_begin = $hsp->nB('hit');




  is($q_natural_begin, 189, "check query's natural begin.");
  is($h_natural_begin, 302, "check hit's natural begin.");

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

#line 344 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




;

  }
};
is($@, '', "example from line 344");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 344 lib/Bio/Search/HSP/PhatHSP/tblastn.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('tblastn',
              'sample_data/tblastn.sample.report');



 my $hsp = $hsps->[0];		# $hsps is filled in by test harness
 my $q_natural_end = $hsp->nE('query');
 my $h_natural_end = $hsp->nE('hit');




  is($q_natural_end, 379, "check query's natural end.");
  is($h_natural_end, 874, "check hit's natural end.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

