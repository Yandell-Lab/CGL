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

my $Original_File = 'lib/CGL/Annotation/Feature/Contig.pm';

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

#line 10 lib/CGL/Annotation/Feature/Contig.pm
  use UNIVERSAL qw( isa );






;

  }
};
is($@, '', "example from line 10");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 91 lib/CGL/Annotation/Feature/Contig.pm

  use CGL::Annotation::Feature::Contig;

  my $feature;			# the raw CGL Feature
  my $c;			# the contig object

  $feature = {};		# It's actually a CGL::Annotation::Feature
  $c = new CGL::Annotation::Feature::Contig($feature);




;

  }
};
is($@, '', "example from line 91");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 91 lib/CGL/Annotation/Feature/Contig.pm

  use CGL::Annotation::Feature::Contig;

  my $feature;			# the raw CGL Feature
  my $c;			# the contig object

  $feature = {};		# It's actually a CGL::Annotation::Feature
  $c = new CGL::Annotation::Feature::Contig($feature);




  isa_ok($c, "CGL::Annotation::Feature::Contig", "Check its type.");

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

#line 135 lib/CGL/Annotation/Feature/Contig.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $c;			# reference to a contig feature object
  my $loc;
  my $loc10;

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $c = $a->contig(0);
  $loc = $c->location(0);
  $loc10 = $c->location(10);




;

  }
};
is($@, '', "example from line 135");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 135 lib/CGL/Annotation/Feature/Contig.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $c;			# reference to a contig feature object
  my $loc;
  my $loc10;

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $c = $a->contig(0);
  $loc = $c->location(0);
  $loc10 = $c->location(10);




  isa_ok($loc, "CGL::Annotation::FeatureLocation", "Check it's type.");
  is($loc->nbeg, 8174345, "Is it the location we expected?");
  is($loc10, undef, "Test for a crazy location.");

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

#line 179 lib/CGL/Annotation/Feature/Contig.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $c;			# reference to a contig feature object
  my $e_ref;			# ref to list of exons.
  my $e;			# an exon
  my $t;			# a transcript
  my $pos_in_e;
  my $pos_in_t;

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $c = $a->contig(0);
  $e_ref = $a->exons();
  $e = $e_ref->[0];		# snag the first one.
  $pos_in_e = $c->metaPos($e, 501);

  $a = new CGL::Annotation("sample_data/cint.sample.chaos.xml");
  $c = $a->contig(0);
  $t = $a->transcript(0);
  $pos_in_t = $c->metaPos($t, 8000);




;

  }
};
is($@, '', "example from line 179");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 179 lib/CGL/Annotation/Feature/Contig.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $c;			# reference to a contig feature object
  my $e_ref;			# ref to list of exons.
  my $e;			# an exon
  my $t;			# a transcript
  my $pos_in_e;
  my $pos_in_t;

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $c = $a->contig(0);
  $e_ref = $a->exons();
  $e = $e_ref->[0];		# snag the first one.
  $pos_in_e = $c->metaPos($e, 501);

  $a = new CGL::Annotation("sample_data/cint.sample.chaos.xml");
  $c = $a->contig(0);
  $t = $a->transcript(0);
  $pos_in_t = $c->metaPos($t, 8000);




  is($pos_in_e, 1, "Check metaPos in exon.");
  is($pos_in_t, 921, "Check metaPos in transcript.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

