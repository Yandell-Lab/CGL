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

my $Original_File = 'lib/Bio/Search/HSP/PhatHSP/Base.pm';

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

#line 10 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness




  # kinky type check to search up inheritance tree (man UNIVERSAL)
  is($hsp->isa("Bio::Search::HSP::PhatHSP::Base"), 1, "Check type.");

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

#line 95 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness




;

  }
};
is($@, '', "example from line 95");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 95 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness




  # kinky type check to search up inheritance tree (man UNIVERSAL)
  is($hsp->isa("Bio::Search::HSP::PhatHSP::Base"), 1, "Check type.");

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

#line 141 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $q_mid1 = $hsp->whatIsInTheMiddle('query', 23);
 my $q_mid2 = $hsp->whatIsInTheMiddle('query', 25);
 my $h_mid1 = $hsp->whatIsInTheMiddle('hit', 16827);
 my $h_mid2 = $hsp->whatIsInTheMiddle('hit', 16829);




;

  }
};
is($@, '', "example from line 141");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 141 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $q_mid1 = $hsp->whatIsInTheMiddle('query', 23);
 my $q_mid2 = $hsp->whatIsInTheMiddle('query', 25);
 my $h_mid1 = $hsp->whatIsInTheMiddle('hit', 16827);
 my $h_mid2 = $hsp->whatIsInTheMiddle('hit', 16829);




  is($q_mid1, '|', "Check the middle character using query coordinates.");
  is($h_mid1, '|', "Check the middle character using hit coordinates.");
  is($q_mid2, ' ', "Check the middle character using query coordinates.");
  is($h_mid2, ' ', "Check the middle character using hit coordinates.");

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

#line 212 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $h_via_q1 = $hsp->equivalent_pos_in_alignment_partner('query', 23);
 my $q_via_h1 = $hsp->equivalent_pos_in_alignment_partner('hit', 16827);
 # does it handle a gappy position.
 my $h_via_q2 = $hsp->equivalent_pos_in_alignment_partner('query', 43);
 my $q_via_h2 = $hsp->equivalent_pos_in_alignment_partner('hit', 16842);




;

  }
};
is($@, '', "example from line 212");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 212 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $h_via_q1 = $hsp->equivalent_pos_in_alignment_partner('query', 23);
 my $q_via_h1 = $hsp->equivalent_pos_in_alignment_partner('hit', 16827);
 # does it handle a gappy position.
 my $h_via_q2 = $hsp->equivalent_pos_in_alignment_partner('query', 43);
 my $q_via_h2 = $hsp->equivalent_pos_in_alignment_partner('hit', 16842);




  is($h_via_q1, 16827, "Find position in hit using query position 23.");
  is($q_via_h1, 23, "Find position in query using hit position 16827.");
  is($h_via_q2, undef, "Find position in hit using query position 43.");
  is($q_via_h2, undef, "Find position in query using hit position 16842.");

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

#line 273 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $id1 = $hsp->id("Testing321");
 my $id2 = $hsp->id();
 my $id3 = $hsp->id(undef);




;

  }
};
is($@, '', "example from line 273");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 273 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $id1 = $hsp->id("Testing321");
 my $id2 = $hsp->id();
 my $id3 = $hsp->id(undef);




  # kinky type check to search up inheritance tree (man UNIVERSAL)
  is($id1, 'Testing321', "Check the id getter/setter (setting).");
  is($id2, 'Testing321', "Check the id getter/setter (getting).");
  is($id3, undef, "Check the id getter/setter (clearing).");

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

#line 322 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $q_before = $hsp->isContained('query', 20);
 my $q_in = $hsp->isContained('query', 25);
 my $q_after = $hsp->isContained('query', 1000);

 my $h_before = $hsp->isContained('hit', 1000);
 my $h_in = $hsp->isContained('hit', 16900);
 my $h_after = $hsp->isContained('hit', 17500);




;

  }
};
is($@, '', "example from line 322");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 322 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $q_before = $hsp->isContained('query', 20);
 my $q_in = $hsp->isContained('query', 25);
 my $q_after = $hsp->isContained('query', 1000);

 my $h_before = $hsp->isContained('hit', 1000);
 my $h_in = $hsp->isContained('hit', 16900);
 my $h_after = $hsp->isContained('hit', 17500);




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

#line 478 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $name = $hsp->name();




;

  }
};
is($@, '', "example from line 478");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 478 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $name = $hsp->name();




  is($name, "3197985", "Check the name of the hit.");

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

#line 614 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $yes = $hsp->hasRun('|', 6);
 my $no = $hsp->hasRun('|', 10);




;

  }
};
is($@, '', "example from line 614");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 614 lib/Bio/Search/HSP/PhatHSP/Base.pm
 use Bio::Search::HSP::PhatHSP::Base;
 my $hsps = Bio::Search::HSP::PhatHSP::Base::_getTestHSPs('blastn',
              'sample_data/blastn.sample.report');



 my $hsp = $hsps->[0];		# $hits is filled in by test harness
 my $yes = $hsp->hasRun('|', 6);
 my $no = $hsp->hasRun('|', 10);




  is($yes, 1, "Does the hsp has a run of 6 matches (it should)?");
  is($no, 0, "Does the hsp has a run of 10 matches (it shouldn't)?");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

