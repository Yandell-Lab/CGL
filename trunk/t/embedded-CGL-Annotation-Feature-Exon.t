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

my $Original_File = 'lib/CGL/Annotation/Feature/Exon.pm';

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

#line 10 lib/CGL/Annotation/Feature/Exon.pm
  use UNIVERSAL qw( isa );



  use CGL::Annotation::Feature::Exon;

  my $feature;			# the raw CGL Feature
  my $e;			# the exon object.

  $feature = {};		# In real life, a CGL::Annotation::Feature...
  $e = new CGL::Annotation::Feature::Exon($feature);




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Annotation/Feature/Exon.pm
  use UNIVERSAL qw( isa );



  use CGL::Annotation::Feature::Exon;

  my $feature;			# the raw CGL Feature
  my $e;			# the exon object.

  $feature = {};		# In real life, a CGL::Annotation::Feature...
  $e = new CGL::Annotation::Feature::Exon($feature);




  isa_ok($e, "CGL::Annotation::Feature::Exon", "Check its type.");

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

#line 99 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation::Feature::Exon;

  my $feature;			# the raw CGL Feature
  my $e;			# the exon object.

  $feature = {};		# In real life, a CGL::Annotation::Feature...
  $e = new CGL::Annotation::Feature::Exon($feature);




;

  }
};
is($@, '', "example from line 99");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 99 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation::Feature::Exon;

  my $feature;			# the raw CGL Feature
  my $e;			# the exon object.

  $feature = {};		# In real life, a CGL::Annotation::Feature...
  $e = new CGL::Annotation::Feature::Exon($feature);




  isa_ok($e, "CGL::Annotation::Feature::Exon", "Check its type.");

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

#line 143 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $l;			# it's length.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $e = $t->exon(0);
  $l = $e->length();




;

  }
};
is($@, '', "example from line 143");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 143 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $l;			# it's length.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $e = $t->exon(0);
  $l = $e->length();




  is($l, 1788, "Check an exon's length.");

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

#line 185 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $p;			# the transcript's translation.
  my $e;			# reference to an exon feature
  my @coding;			# true if it's coding....

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $p = $t->translation(0);
  $e = $t->exon(0);
  $coding[0] = $e->isCoding($p, $t);
  $e = $t->exon(1);
  $coding[1] = $e->isCoding($p, $t);




;

  }
};
is($@, '', "example from line 185");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 185 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $p;			# the transcript's translation.
  my $e;			# reference to an exon feature
  my @coding;			# true if it's coding....

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $p = $t->translation(0);
  $e = $t->exon(0);
  $coding[0] = $e->isCoding($p, $t);
  $e = $t->exon(1);
  $coding[1] = $e->isCoding($p, $t);




  is($coding[0], 1, "Test if the first exon is coding.");
  is($coding[1], 1, "Test if the second exon is coding.");

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

#line 248 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# a transcript
  my $e;			# an exon
  my $c;			# a contig

  my $pos_in_t;
  my $pos_in_c;

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $e = $t->exon(0);
  $pos_in_t = $e->metaPos($t, 0);

  $a = new CGL::Annotation("sample_data/cint.sample.chaos.xml");
  $c = $a->contig(0);
  $t = $a->transcript(0);
  $e = $t->exon(0);
  $pos_in_c = $e->metaPos($c, 0);




;

  }
};
is($@, '', "example from line 248");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 248 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# a transcript
  my $e;			# an exon
  my $c;			# a contig

  my $pos_in_t;
  my $pos_in_c;

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $e = $t->exon(0);
  $pos_in_t = $e->metaPos($t, 0);

  $a = new CGL::Annotation("sample_data/cint.sample.chaos.xml");
  $c = $a->contig(0);
  $t = $a->transcript(0);
  $e = $t->exon(0);
  $pos_in_c = $e->metaPos($c, 0);




  is($pos_in_t, 0, "Check an exon's position in its transcript.");
  is($pos_in_c, 9550, "Check an exon's position in its contig.");

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

#line 324 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t_dmel;			# a transcript in the dmel annot.
  my $t_atha;			# a transcript in the atha annot.
  my $e;			# reference to an exon feature
  my $i_dmel;			# position of dmel exon in dmel transcript.
  my $i_atha;			# position of atha exon in dmel transcript.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t_dmel = $a->transcript(0);
  $e = $t_dmel->exon(1);
  $i_dmel = $e->order($t_dmel);

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t_atha = $a->transcript(0);
  $e = $t_atha->exon(0);
  $i_atha = $e->order($t_dmel);	# shouldn't find it here!




;

  }
};
is($@, '', "example from line 324");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 324 lib/CGL/Annotation/Feature/Exon.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t_dmel;			# a transcript in the dmel annot.
  my $t_atha;			# a transcript in the atha annot.
  my $e;			# reference to an exon feature
  my $i_dmel;			# position of dmel exon in dmel transcript.
  my $i_atha;			# position of atha exon in dmel transcript.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t_dmel = $a->transcript(0);
  $e = $t_dmel->exon(1);
  $i_dmel = $e->order($t_dmel);

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t_atha = $a->transcript(0);
  $e = $t_atha->exon(0);
  $i_atha = $e->order($t_dmel);	# shouldn't find it here!




  is($i_dmel, 1, "Check that it finds the correct position in dmel.");
  is($i_atha, undef, "Check that it's not found in atha.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

