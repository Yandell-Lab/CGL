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

my $Original_File = 'lib/CGL/Annotation/Feature/Protein.pm';

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

#line 10 lib/CGL/Annotation/Feature/Protein.pm
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

#line 92 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation::Feature::Contig;

  my $feature;			# the raw CGL Feature
  my $p;			# the protein object

  $feature = {};		# It's actually a CGL::Annotation::Feature
  $p = new CGL::Annotation::Feature::Protein($feature);




;

  }
};
is($@, '', "example from line 92");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 92 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation::Feature::Contig;

  my $feature;			# the raw CGL Feature
  my $p;			# the protein object

  $feature = {};		# It's actually a CGL::Annotation::Feature
  $p = new CGL::Annotation::Feature::Protein($feature);




  isa_ok($p, "CGL::Annotation::Feature::Protein", "Check its type.");

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

#line 138 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $r;			# the protein's residues

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $p = $t->translation(0);
  $r = $p->residues();




;

  }
};
is($@, '', "example from line 138");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 138 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $r;			# the protein's residues

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $p = $t->translation(0);
  $r = $p->residues();




  isa_ok($p, "CGL::Annotation::Feature::Protein", "Check the type.");
  like($r, qr/^MRLWDND.*/, "Are they the residues we expect.");
  is(length($r), 595, "Check the length of the residues.");

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

#line 189 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $p = $t->translation(0);




;

  }
};
is($@, '', "example from line 189");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 189 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $p = $t->translation(0);




  is($p->length, 595, "Check the length() method.");

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

#line 231 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $begin_in_t;			# location in the transcript.
  my $end_in_t;			# location in the transcript.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $p = $t->translation(0);
  $begin_in_t = $p->metaPos($t, 0);
  $end_in_t = $p->metaPos($t, $p->length);




;

  }
};
is($@, '', "example from line 231");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 231 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $begin_in_t;			# location in the transcript.
  my $end_in_t;			# location in the transcript.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $p = $t->translation(0);
  $begin_in_t = $p->metaPos($t, 0);
  $end_in_t = $p->metaPos($t, $p->length);




  is($begin_in_t, 0, "Check the start of p in t.");
  is($end_in_t, 1785, "Check the end of p in t.");

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

#line 286 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# a gene.
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $start_triplet;		# the proteins first triplet.
  my $final_triplet;		# the proteins last triplet.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);		# XXXX need to go through gene to work!!!
  $t = $g->transcript(0);
  $p = $t->translation(0);
  $start_triplet = $p->triplet($t, 0);
  $final_triplet = $p->triplet($t, $p->length());




;

  }
};
is($@, '', "example from line 286");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 286 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# a gene.
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $start_triplet;		# the proteins first triplet.
  my $final_triplet;		# the proteins last triplet.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);		# XXXX need to go through gene to work!!!
  $t = $g->transcript(0);
  $p = $t->translation(0);
  $start_triplet = $p->triplet($t, 0);
  $final_triplet = $p->triplet($t, $p->length());




  is($start_triplet, "ATG", "Check the first three bases.");
  is($final_triplet, "TAG", "Check the last three bases.");

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

#line 341 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# a gene.
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $aa;			# an amino acid

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);		# XXXX need to go through gene to work!!!
  $t = $g->transcript(0);
  $p = $t->translation(0);
  $aa = $p->aa(0);




;

  }
};
is($@, '', "example from line 341");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 341 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# a gene.
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $aa;			# an amino acid

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);		# XXXX need to go through gene to work!!!
  $t = $g->transcript(0);
  $p = $t->translation(0);
  $aa = $p->aa(0);




  is($aa, "M", "Check the first amino acid.");

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

#line 388 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# a gene.
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $offset;			# offset of exon junction on protein.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);		# XXXX need to go through gene to work!!!
  $t = $g->transcript(0);
  $p = $t->translation(0);
  $offset = $p->exonJunction($t, 0, 1);




;

  }
};
is($@, '', "example from line 388");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 388 lib/CGL/Annotation/Feature/Protein.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# a gene.
  my $t;			# reference to a transcript feature
  my $p;			# reference to a protein feature
  my $offset;			# offset of exon junction on protein.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);		# XXXX need to go through gene to work!!!
  $t = $g->transcript(0);
  $p = $t->translation(0);
  $offset = $p->exonJunction($t, 0, 1);




  is(int($offset), int(135.333), "Check location of the first exon junction.");
  # deal with is() and floating point numbers....

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

