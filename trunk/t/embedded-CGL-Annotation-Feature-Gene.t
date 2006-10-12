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

my $Original_File = 'lib/CGL/Annotation/Feature/Gene.pm';

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

#line 10 lib/CGL/Annotation/Feature/Gene.pm
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

#line 91 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation::Feature::Exon;

  my $feature;			# the raw CGL Feature
  my $g;			# the gene object.

  $feature = {};		# In real life, a CGL::Annotation::Feature...
  $g = new CGL::Annotation::Feature::Gene($feature);




;

  }
};
is($@, '', "example from line 91");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 91 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation::Feature::Exon;

  my $feature;			# the raw CGL Feature
  my $g;			# the gene object.

  $feature = {};		# In real life, a CGL::Annotation::Feature...
  $g = new CGL::Annotation::Feature::Gene($feature);




  isa_ok($g, "CGL::Annotation::Feature::Gene", "Check its type.");

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

#line 136 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# reference to an exon feature

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);




;

  }
};
is($@, '', "example from line 136");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 136 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# reference to an exon feature

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);




  isa_ok($g, "CGL::Annotation::Feature::Gene", "Check the gene's type.");
  isa_ok($t, "CGL::Annotation::Feature::Transcript", "Check transcript type.");

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

#line 179 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# reference to an transcript feature
  my $begin;			# the beginning

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $begin = $t->nbeg();




;

  }
};
is($@, '', "example from line 179");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 179 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# reference to an transcript feature
  my $begin;			# the beginning

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $begin = $t->nbeg();




  is($begin, 500, "Check the gene's natural begin.");

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

#line 222 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# reference to an transcript feature
  my $end;			# the end.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $end = $t->nend();




;

  }
};
is($@, '', "example from line 222");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 222 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# reference to an transcript feature
  my $end;			# the end.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $end = $t->nend();




  is($end, 2288, "Check the gene's natural end.");

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

#line 266 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# ref to transcript array

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcripts();




;

  }
};
is($@, '', "example from line 266");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 266 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# ref to transcript array

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcripts();




  isa_ok($g, "CGL::Annotation::Feature::Gene", "Did we get a gene.");
  isa_ok($t->[0], "CGL::Annotation::Feature::Transcript", "Did we get transcripts.");
  is(scalar(@{$t}), 1, "Did we get the right number of transcripts?");

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

#line 330 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# reference to an transcript feature
  my $begin;			# the beginning

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript_with_id("mRNA-107699");




;

  }
};
is($@, '', "example from line 330");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 330 lib/CGL/Annotation/Feature/Gene.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an exon feature
  my $t;			# reference to an transcript feature
  my $begin;			# the beginning

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript_with_id("mRNA-107699");




  isa_ok($t, "CGL::Annotation::Feature::Transcript", "Check the type.");

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

#line 413 lib/CGL/Annotation/Feature/Gene.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 413");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 413 lib/CGL/Annotation/Feature/Gene.pm

  use PROTO;
  my $foo = new PROTO;




  isa_ok($foo, "PROTO", "Check if it's the right type.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

