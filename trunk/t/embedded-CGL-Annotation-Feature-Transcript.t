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

my $Original_File = 'lib/CGL/Annotation/Feature/Transcript.pm';

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

#line 10 lib/CGL/Annotation/Feature/Transcript.pm
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

#line 94 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation::Feature::Transcript;

  my $feature;			# the raw CGL Feature
  my $t;			# the transcript object.

  $feature = {};		# In real life, a CGL::Annotation::Feature...
  $t = new CGL::Annotation::Feature::Transcript($feature);




;

  }
};
is($@, '', "example from line 94");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 94 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation::Feature::Transcript;

  my $feature;			# the raw CGL Feature
  my $t;			# the transcript object.

  $feature = {};		# In real life, a CGL::Annotation::Feature...
  $t = new CGL::Annotation::Feature::Transcript($feature);




  isa_ok($t, "CGL::Annotation::Feature::Transcript", "Check its type.");

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

#line 138 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $e = $t->exon_with_id('exon-107701');




;

  }
};
is($@, '', "example from line 138");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 138 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcript(0);
  $e = $t->exon_with_id('exon-107701');




  isa_ok($e, "CGL::Annotation::Feature::Exon", "Did we get an exon?");
  is($e->id(), 'exon-107701', "Did we get the exon we expected?");

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

#line 184 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $i;			# reference to an intron feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $i = $t->intron_with_id("CG4852-region-ext1.3:588:647");




;

  }
};
is($@, '', "example from line 184");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 184 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $i;			# reference to an intron feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $i = $t->intron_with_id("CG4852-region-ext1.3:588:647");




  isa_ok($i, "CGL::Annotation::Feature::Intron", "Did we get back an intron?");
  is($i->id(), 'CG4852-region-ext1.3:588:647', "Is it the expected intron?");

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

#line 230 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $r;			# the transcript's residue

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $r = $t->residues();




;

  }
};
is($@, '', "example from line 230");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 230 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $r;			# the transcript's residue

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $r = $t->residues();




  like($r, qr/^GTGACC.*/, "Do the residues look correct?");
  is(length($r), 1365, "Are the residues the correct length?");

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

#line 277 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $i0;			# a location
  my $i1;			# a location

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $i0 = $t->nbeg();
  $t = $a->transcript(1);
  $i1 = $t->nbeg();




;

  }
};
is($@, '', "example from line 277");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 277 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $i0;			# a location
  my $i1;			# a location

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $i0 = $t->nbeg();
  $t = $a->transcript(1);
  $i1 = $t->nbeg();




  is($i0, 1, "Does the first transcript begin at the right place?");
  is($i1, 6, "Does the second transcript begin at the right place?");

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

#line 320 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $i0;			# a location
  my $i1;			# a location

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $i0 = $t->nend();
  $t = $a->transcript(1);
  $i1 = $t->nend();




;

  }
};
is($@, '', "example from line 320");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 320 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $i0;			# a location
  my $i1;			# a location

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $i0 = $t->nend();
  $t = $a->transcript(1);
  $i1 = $t->nend();




  is($i0, 1425, "Does the first transcript begin at the right place?");
  is($i1, -1990, "XXXX Does the second transcript begin at the right place?");

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

#line 363 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $s;			# strand

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $s = $t->strand();




;

  }
};
is($@, '', "example from line 363");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 363 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $s;			# strand

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $s = $t->strand();




  is($s, 1, "Is the strand correct?");

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

#line 409 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $l;			# its length.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $l = $t->length();




;

  }
};
is($@, '', "example from line 409");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 409 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $l;			# its length.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $t = $a->transcript(0);
  $l = $t->length();




  is($l, 1365, "Check the transcript's length.");

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

#line 453 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# refrence to a gene feature
  my $t;			# reference to a transcript feature
  my $acc;			# the acceptor

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $acc = $t->acceptor(1, 4, 4);	# grab four bases on either side.




;

  }
};
is($@, '', "example from line 453");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 453 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# refrence to a gene feature
  my $t;			# reference to a transcript feature
  my $acc;			# the acceptor

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $acc = $t->acceptor(1, 4, 4);	# grab four bases on either side.




  is($acc, 'GCAG|ATCT', "Check the first acceptor.");

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

#line 513 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# refrence to a gene feature
  my $t;			# reference to a transcript feature
  my $d;			# the donor

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $d = $t->donor(0, 4, 4);	# grab four bases on either side.




;

  }
};
is($@, '', "example from line 513");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 513 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# refrence to a gene feature
  my $t;			# reference to a transcript feature
  my $d;			# the donor

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $d = $t->donor(0, 4, 4);	# grab four bases on either side.




  is($d, 'TTCG|GTAA', "Check the first donor.");

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

#line 571 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $e_num;			# how many exons are there?

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $e = $t->exon(1);
  $e_num = $t->exonNumber($e);




;

  }
};
is($@, '', "example from line 571");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 571 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $e_num;			# how many exons are there?

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $e = $t->exon(1);
  $e_num = $t->exonNumber($e);




  is($e_num, 1, "Can we retrieve an exon's position in transcript.");

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

#line 621 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $yes;			# boolean
  my $no;			# bolean

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $e = $t->exon(0);
  $yes = $t->isFirstExon($e);
  $e = $t->exon(1);
  $no = $t->isFirstExon($e);




;

  }
};
is($@, '', "example from line 621");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 621 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $yes;			# boolean
  my $no;			# bolean

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(0);
  $t = $g->transcript(0);
  $e = $t->exon(0);
  $yes = $t->isFirstExon($e);
  $e = $t->exon(1);
  $no = $t->isFirstExon($e);




  is($yes, 1, "Did we recognize the first exon?");
  is($no, 0, "Did we recognize NOT the first exon?");

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

#line 671 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $yes;			# boolean
  my $no;			# bolean

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->exon(2);
  $yes = $t->isLastExon($e);
  $e = $t->exon(0);
  $no = $t->isLastExon($e);




;

  }
};
is($@, '', "example from line 671");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 671 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $yes;			# boolean
  my $no;			# bolean

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->exon(2);
  $yes = $t->isLastExon($e);
  $e = $t->exon(0);
  $no = $t->isLastExon($e);




  is($yes, 1, "Did we recognize the last exon?");
  is($no, 0, "Did we recognize NOT the last exon?");

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

#line 721 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $start;			# exon start in transcript

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->exon(2);
  $start = $t->exonStartInTranscript($e);




;

  }
};
is($@, '', "example from line 721");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 721 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $start;			# exon start in transcript

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->exon(2);
  $start = $t->exonStartInTranscript($e);




  is($start, 322, "Can we find an exon's start?");

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

#line 771 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $end;			# exon start in transcript

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->exon(2);
  $end = $t->exonEndInTranscript($e);




;

  }
};
is($@, '', "example from line 771");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 771 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature
  my $end;			# exon start in transcript

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->exon(2);
  $end = $t->exonEndInTranscript($e);




  is($end, 569, "Can we find an exon's end?");

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

#line 821 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $p;			# reference to a translation feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $p = $t->fetchTranslationById('385099');
  $id = $p->id();




;

  }
};
is($@, '', "example from line 821");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 821 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $p;			# reference to a translation feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $p = $t->fetchTranslationById('385099');
  $id = $p->id();




  isa_ok($p, "CGL::Annotation::Feature::Protein", "Check its type.");
  is($id, "385099", "Check the protein's id.");

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

#line 869 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $p = $t->translation(0);
  $id = $p->id();




;

  }
};
is($@, '', "example from line 869");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 869 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $p = $t->translation(0);
  $id = $p->id();




  isa_ok($p, "CGL::Annotation::Feature::Protein", "Check its type.");
  is($id, "385099", "Check the protein's id.");

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

#line 913 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $p;			# reference to a translation feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->firstCodingExon('385099');




;

  }
};
is($@, '', "example from line 913");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 913 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $p;			# reference to a translation feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->firstCodingExon('385099');




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

#line 969 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $p;			# reference to a translation feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->lastCodingExon('385099');




;

  }
};
is($@, '', "example from line 969");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 969 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $p;			# reference to a translation feature

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->lastCodingExon('385099');




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

#line 1026 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i;			# a location in the transcript.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $i = $t->translationStartInTranscript('385099');




;

  }
};
is($@, '', "example from line 1026");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1026 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i;			# a location in the transcript.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $i = $t->translationStartInTranscript('385099');




  is($i, 141, "Check start in transcript.");

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

#line 1086 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i;			# a location in the transcript.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $i = $t->translationEndInTranscript('385099');




;

  }
};
is($@, '', "example from line 1086");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1086 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i;			# a location in the transcript.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $i = $t->translationEndInTranscript('385099');




  is($i, 477, "Check end in transcript.");

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

#line 1147 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $c;			# reference to a contig feature
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i_e;			# a position in an exon
  my $i_p;			# a position in a protein
  my $i_c;			# a position in a contig

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $c = $a->contig(0);
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->lastCodingExon('385099');
  $p = $t->translation(0);
  
  $i_e = $t->metaPos($e, 322);
  $i_p = $t->metaPos($p, 322);
  $i_c = $t->metaPos($c, 0);




;

  }
};
is($@, '', "example from line 1147");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1147 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $c;			# reference to a contig feature
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i_e;			# a position in an exon
  my $i_p;			# a position in a protein
  my $i_c;			# a position in a contig

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $c = $a->contig(0);
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->lastCodingExon('385099');
  $p = $t->translation(0);
  
  $i_e = $t->metaPos($e, 322);
  $i_p = $t->metaPos($p, 322);
  $i_c = $t->metaPos($c, 0);




  is($i_e, 0, "Check position in the exon.");
  is(int($i_p), 60, "Check position in the translation (handle fractional frame).");
  is($i_c, 6, "Check position in the contig.");

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

#line 1247 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $codon;			# the start codon

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $codon = $t->startCodon('385099');




;

  }
};
is($@, '', "example from line 1247");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1247 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $codon;			# the start codon

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $codon = $t->startCodon('385099');




  is($codon, "ATG", "Check the protein's start codon.");

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

#line 1290 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $codon;			# the start codon

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $codon = $t->stopCodon('385099');




;

  }
};
is($@, '', "example from line 1290");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1290 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $codon;			# the start codon

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $codon = $t->stopCodon('385099');




  is($codon, "TAA", "Check the protein's stop codon.");

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

#line 1333 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $splice;			# the splice junction.


  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $splice = $t->spliceJunction(0);




;

  }
};
is($@, '', "example from line 1333");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1333 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $splice;			# the splice junction.


  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $splice = $t->spliceJunction(0);




  is($splice, 192, "Check the protein's stop codon.");

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

#line 1384 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e_0;			# reference to an exon
  my $e_1;			# ditto...
  my $junction;			# an exon junction

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e_0 = $t->exon(0);
  $e_1 = $t->exon(1);
  $junction = $t->exonJunction($e_0, $e_1);




;

  }
};
is($@, '', "example from line 1384");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1384 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e_0;			# reference to an exon
  my $e_1;			# ditto...
  my $junction;			# an exon junction

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e_0 = $t->exon(0);
  $e_1 = $t->exon(1);
  $junction = $t->exonJunction($e_0, $e_1);




  is($junction, 192, "Check an exon junction.");

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

#line 1435 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature.
  my $id;			# the exon id.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->exon(0);
  $id = $e->id();




;

  }
};
is($@, '', "example from line 1435");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1435 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e;			# reference to an exon feature.
  my $id;			# the exon id.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e = $t->exon(0);
  $id = $e->id();




  isa_ok($e, "CGL::Annotation::Feature::Exon", "Check its type.");
  is($id, "1277106", "Check the exon's id.");

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

#line 1481 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e_ref;			# reference to an array of exon features.
  my $id;			# the exon id.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e_ref = $t->exons();
  $id = $e_ref->[0]->id();




;

  }
};
is($@, '', "example from line 1481");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1481 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e_ref;			# reference to an array of exon features.
  my $id;			# the exon id.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e_ref = $t->exons();
  $id = $e_ref->[0]->id();




  isa_ok($e_ref->[0], "CGL::Annotation::Feature::Exon", "Check its type.");
  is($id, "1277106", "Check the exon's id.");

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

#line 1574 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $p_ref;			# reference to an array of protein features
  my $id;			# reference to an array of protein features

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $p_ref = $t->translations();
  $id = $p_ref->[0]->id();




;

  }
};
is($@, '', "example from line 1574");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1574 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $p_ref;			# reference to an array of protein features
  my $id;			# reference to an array of protein features

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $p_ref = $t->translations();
  $id = $p_ref->[0]->id();




  isa_ok($p_ref, "ARRAY", "Check its type.");
  isa_ok($p_ref->[0], "CGL::Annotation::Feature::Protein", "Check an element's type.");
  is($id, "385099", "Check the protein's id.");

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

#line 1620 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i;			# reference to an intron feature.
  my $id;			# the exon id.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $i = $t->intron(0);
  $id = $i->id();




;

  }
};
is($@, '', "example from line 1620");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1620 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i;			# reference to an intron feature.
  my $id;			# the exon id.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $i = $t->intron(0);
  $id = $i->id();




  isa_ok($i, "CGL::Annotation::Feature::Intron", "Check its type.");
  is($id, "CG4852-region-ext1.3:-186:-283", "Check the exon's id.");

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

#line 1666 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i_ref;			# reference to an array of intron features.
  my $id;			# the exon id.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $i_ref = $t->introns();
  $id = $i_ref->[0]->id();




;

  }
};
is($@, '', "example from line 1666");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1666 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $i_ref;			# reference to an array of intron features.
  my $id;			# the exon id.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $i_ref = $t->introns();
  $id = $i_ref->[0]->id();




  isa_ok($i_ref, "ARRAY", "Check its type.");
  isa_ok($i_ref->[0], "CGL::Annotation::Feature::Intron", "Check its type.");
  is($id, "CG4852-region-ext1.3:-186:-283", "Check the exon's id.");

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

#line 1721 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e_pairs_ref;		# reference to an array of refs to exon pairs.
  my $e_pair_ref;		# reference to a pair of exons
  my ($e1, $e2);		# the exon pair.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e_pairs_ref = $t->exonPairs();
  $e_pair_ref = $e_pairs_ref->[0]; 
  ($e1, $e2) = @{$e_pair_ref};




;

  }
};
is($@, '', "example from line 1721");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1721 lib/CGL/Annotation/Feature/Transcript.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature
  my $t;			# reference to a transcript feature
  my $e_pairs_ref;		# reference to an array of refs to exon pairs.
  my $e_pair_ref;		# reference to a pair of exons
  my ($e1, $e2);		# the exon pair.

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $g = $a->gene(1);
  $t = $g->transcript(0);
  $e_pairs_ref = $t->exonPairs();
  $e_pair_ref = $e_pairs_ref->[0]; 
  ($e1, $e2) = @{$e_pair_ref};




  isa_ok($e1, "CGL::Annotation::Feature::Exon", "Check its type.");
  isa_ok($e2, "CGL::Annotation::Feature::Exon", "Check its type.");
  is($e1->id(), "1277106", "Check the exon's id.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

