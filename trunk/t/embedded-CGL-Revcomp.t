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

my $Original_File = 'lib/CGL/Revcomp.pm';

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

#line 10 lib/CGL/Revcomp.pm

  use CGL::Revcomp qw(revcomp);
  my $s1 = revcomp("acgt");
  my $s2 = revcomp("AttackAKayak");




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Revcomp.pm

  use CGL::Revcomp qw(revcomp);
  my $s1 = revcomp("acgt");
  my $s2 = revcomp("AttackAKayak");




  is(revcomp("acgt"), "acgt", "Check simple dna string");
  is(revcomp("AttackAKayak"), "mtrtMTmgtaaT",
     "Check funky ambiguity and case.");

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

#line 83 lib/CGL/Revcomp.pm

  use CGL::Revcomp qw(revcomp);
  my $s1 = revcomp("acgt");
  my $s2 = revcomp("AttackAKayak");




;

  }
};
is($@, '', "example from line 83");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 83 lib/CGL/Revcomp.pm

  use CGL::Revcomp qw(revcomp);
  my $s1 = revcomp("acgt");
  my $s2 = revcomp("AttackAKayak");




  is(revcomp("acgt"), "acgt", "Check simple dna string");
  is(revcomp("AttackAKayak"), "mtrtMTmgtaaT",
     "Check funky ambiguity and case.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

