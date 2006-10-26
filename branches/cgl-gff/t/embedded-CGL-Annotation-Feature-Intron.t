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

my $Original_File = 'lib/CGL/Annotation/Feature/Intron.pm';

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

#line 12 lib/CGL/Annotation/Feature/Intron.pm
  use UNIVERSAL qw( isa );






;

  }
};
is($@, '', "example from line 12");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 93 lib/CGL/Annotation/Feature/Intron.pm

  use CGL::Annotation::Feature::Intron;

  my $feature;			# the raw CGL Feature
  my $i;			# the intron object

  $feature = {};		# It's actually a CGL::Annotation::Feature
  $i = new CGL::Annotation::Feature::Intron($feature);




;

  }
};
is($@, '', "example from line 93");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 93 lib/CGL/Annotation/Feature/Intron.pm

  use CGL::Annotation::Feature::Intron;

  my $feature;			# the raw CGL Feature
  my $i;			# the intron object

  $feature = {};		# It's actually a CGL::Annotation::Feature
  $i = new CGL::Annotation::Feature::Intron($feature);




  isa_ok($i, "CGL::Annotation::Feature::Intron", "Check its type.");

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

#line 140 lib/CGL/Annotation/Feature/Intron.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to array of exon features

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $e = $t->exons();




;

  }
};
is($@, '', "example from line 140");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 140 lib/CGL/Annotation/Feature/Intron.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to array of exon features

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $e = $t->exons();




  isa_ok($g, "CGL::Annotation::Feature::Gene", "Check the gene's type.");
  isa_ok($t, "CGL::Annotation::Feature::Transcript", "Check transcript type.");
  isa_ok($e->[0], "CGL::Annotation::Feature::Exon", "Check the exon's type.");
  is(scalar(@{$e}), 2, "Check the number of exons.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

