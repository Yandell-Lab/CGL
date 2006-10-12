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

my $Original_File = 'lib/CGL/Annotation.pm';

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

#line 10 lib/CGL/Annotation.pm
  use UNIVERSAL qw( isa );



  # make sure that there's a SO file available.
  BEGIN {
    $ENV{SO_OBO_FILE} = "sample_data/so.obo" unless $ENV{SO_OBO_FILE};
  }

  use CGL::Annotation;
  my $a;			# an annotation.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Annotation.pm
  use UNIVERSAL qw( isa );



  # make sure that there's a SO file available.
  BEGIN {
    $ENV{SO_OBO_FILE} = "sample_data/so.obo" unless $ENV{SO_OBO_FILE};
  }

  use CGL::Annotation;
  my $a;			# an annotation.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");




  isa_ok($a, "CGL::Annotation", "Check if it's the right type.");

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

#line 107 lib/CGL/Annotation.pm

  my $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");




;

  }
};
is($@, '', "example from line 107");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 107 lib/CGL/Annotation.pm

  my $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");




 isa_ok($a, "CGL::Annotation");

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

#line 175 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $i;			# index into transcript list.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $i = 0;
  $t = $a->transcript($i);




;

  }
};
is($@, '', "example from line 175");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 175 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a transcript feature
  my $i;			# index into transcript list.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $i = 0;
  $t = $a->transcript($i);




  can_ok($a, qw(transcript));
  isa_ok($t, CGL::Annotation::Feature::Transcript);

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

#line 218 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $i;			# index of the translation
  my $p;			# reference to a protein feature

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $i = 0;
  $p = $a->translation($i);




;

  }
};
is($@, '', "example from line 218");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 218 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $i;			# index of the translation
  my $p;			# reference to a protein feature

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $i = 0;
  $p = $a->translation($i);




  can_ok($a, qw(translation));
  isa_ok($p, CGL::Annotation::Feature::Protein);

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

#line 262 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene object
  my $i;			# gene identifier

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");

  $i = "gene-107698";			# identifier for gene
  $g = $a->get_gene_by_id($i);




;

  }
};
is($@, '', "example from line 262");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 262 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene object
  my $i;			# gene identifier

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");

  $i = "gene-107698";			# identifier for gene
  $g = $a->get_gene_by_id($i);




  can_ok($a, qw(get_gene_by_id));
  isa_ok($g, CGL::Annotation::Feature::Gene);

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

#line 312 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature.
  my $n;			# gene name

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $n = "At3g23010";			# name of gene of interest
  $g = $a->get_gene_by_name($n);




;

  }
};
is($@, '', "example from line 312");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 312 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene feature.
  my $n;			# gene name

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $n = "At3g23010";			# name of gene of interest
  $g = $a->get_gene_by_name($n);




  can_ok($a, qw(get_gene_by_name));
  isa_ok($g, CGL::Annotation::Feature::Gene);

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

#line 361 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene object
  my $u;			# unique gene name

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $u = "At3g23010-gene-107698";		# uniquename for gene of interest
  $g = $a->get_gene_by_uniquename($u);




;

  }
};
is($@, '', "example from line 361");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 361 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene object
  my $u;			# unique gene name

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $u = "At3g23010-gene-107698";		# uniquename for gene of interest
  $g = $a->get_gene_by_uniquename($u);




  can_ok($a, qw(get_gene_by_uniquename));
  isa_ok($g, CGL::Annotation::Feature::Gene);

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

#line 410 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene object
  my $i;			# index of gene feature.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $i = 0;			# identifier for gene of interest
  $g = $a->gene($i);




;

  }
};
is($@, '', "example from line 410");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 410 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to a gene object
  my $i;			# index of gene feature.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $i = 0;			# identifier for gene of interest
  $g = $a->gene($i);




  can_ok($a, qw(gene));
  isa_ok($g, CGL::Annotation::Feature::Gene);

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

#line 454 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an array of gene objects

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->genes();




;

  }
};
is($@, '', "example from line 454");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 454 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# reference to an array of gene objects

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->genes();




  can_ok($a, qw(genes));
  isa_ok($g, ARRAY);
  isa_ok($g->[0], CGL::Annotation::Feature::Gene);

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

#line 532 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a list of transcripts

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcripts();




;

  }
};
is($@, '', "example from line 532");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 532 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a list of transcripts

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = $a->transcripts();




  can_ok($a, qw(transcripts));
  isa_ok($t, ARRAY);
  isa_ok($t->[0], CGL::Annotation::Feature::Transcript);

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

#line 604 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $i;			# index of the contig of interest.
  my $c;			# reference to a contig feature object

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $i = 0;
  $c = $a->contig($i);




;

  }
};
is($@, '', "example from line 604");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 604 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $i;			# index of the contig of interest.
  my $c;			# reference to a contig feature object

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $i = 0;
  $c = $a->contig($i);




  can_ok($a, qw(contig));
  isa_ok($c, CGL::Annotation::Feature::Contig);

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

#line 647 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $c;			# reference to a list of contigs

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $c = $a->contigs();




;

  }
};
is($@, '', "example from line 647");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 647 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $c;			# reference to a list of contigs

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $c = $a->contigs();




  can_ok($a, qw(contigs));
  isa_ok($c, ARRAY);
  isa_ok($c->[0], CGL::Annotation::Feature::Contig);

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

#line 719 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a list of translations

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->translations();




;

  }
};
is($@, '', "example from line 719");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 719 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# reference to a list of translations

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->translations();




  can_ok($a, qw(translations));
  isa_ok($g, ARRAY);
  isa_ok($g->[0], CGL::Annotation::Feature::Protein);

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

#line 779 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $l;			# a list of exon features.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $l = $a->exons();




;

  }
};
is($@, '', "example from line 779");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 779 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $l;			# a list of exon features.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $l = $a->exons();




  can_ok($a, qw(exons));
  isa_ok($l, ARRAY);
  isa_ok($l->[0], CGL::Annotation::Feature::Exon);

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

#line 826 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# the type, as a string.
  my @l;			# a list of the features.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = 'exon';
  @l = $a->featuresByType($t);




;

  }
};
is($@, '', "example from line 826");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 826 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $t;			# the type, as a string.
  my @l;			# a list of the features.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $t = 'exon';
  @l = $a->featuresByType($t);




  can_ok($a, qw(featuresByType));
  isa_ok(\@l, ARRAY);           # Weird, take the ref so that isa_ok works...
  isa_ok($l[0], CGL::Annotation::Feature);
  isa_ok(new CGL::Annotation::Feature::Exon($l[0]),
         CGL::Annotation::Feature::Exon);

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

#line 876 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $id;			# the id of the feature.
  my $f;			# reference to a Feature object

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $id = "NC_003074.1";
  $f = $a->feature($id);




;

  }
};
is($@, '', "example from line 876");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 876 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $id;			# the id of the feature.
  my $f;			# reference to a Feature object

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $id = "NC_003074.1";
  $f = $a->feature($id);




  can_ok($a, qw(feature));
  isa_ok($f, CGL::Annotation::Feature);
  is($f->id(), "NC_003074.1", "Check for correct feature id.");

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

#line 924 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @f;			# a list of features

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @f = $a->features();




;

  }
};
is($@, '', "example from line 924");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 924 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @f;			# a list of features

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @f = $a->features();




  can_ok($a, qw(features));
  isa_ok(\@f, ARRAY);           # Weird, take the ref so that isa_ok works...

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

#line 964 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @r;			# a list of the NodeRelationship objects in $a.

  $a = new CGL::Annotation;
  @r = $a->relationships();




;

  }
};
is($@, '', "example from line 964");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 964 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @r;			# a list of the NodeRelationship objects in $a.

  $a = new CGL::Annotation;
  @r = $a->relationships();




  can_ok($a, qw(relationships));
  isa_ok(\@r, ARRAY);

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

#line 1005 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $a_rab1;			# reference to a CGL::Annotation
  my $f;			# the interesting feature
  my $f_rab1;			# the interesting feature
  my $t_parts;			# the trace through the parts relationship.
  my $t_whole;			# the trace through the whole relationship.
  my $t_produces_rab1;		# the trace through the parts relationship.
  my $t_producers_rab1;		# the trace through the whole relationship.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $f = $a->feature('gene-107698');
  $t_parts = $a->trace($f, 'parts');
  $f = $a->feature('mRNA-107699');
  $t_whole = $a->trace($f, 'wholes');

  # the rab1 file uses 'derives_from' instead of 'produced_by'
  $a_rab1 = new CGL::Annotation("sample_data/Rab1.chaos.xml");
  $f_rab1 = $a_rab1->feature('mRNA:EMBL/GenBank/SwissProt:AE003734:52204:55287');
  $t_produces_rab1 = $a_rab1->trace($f_rab1, 'produces');
  $f_rab1 = $a_rab1->feature('AAF55873.1');
  $t_producers_rab1 = $a_rab1->trace($f_rab1, 'producers');




;

  }
};
is($@, '', "example from line 1005");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1005 lib/CGL/Annotation.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $a_rab1;			# reference to a CGL::Annotation
  my $f;			# the interesting feature
  my $f_rab1;			# the interesting feature
  my $t_parts;			# the trace through the parts relationship.
  my $t_whole;			# the trace through the whole relationship.
  my $t_produces_rab1;		# the trace through the parts relationship.
  my $t_producers_rab1;		# the trace through the whole relationship.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $f = $a->feature('gene-107698');
  $t_parts = $a->trace($f, 'parts');
  $f = $a->feature('mRNA-107699');
  $t_whole = $a->trace($f, 'wholes');

  # the rab1 file uses 'derives_from' instead of 'produced_by'
  $a_rab1 = new CGL::Annotation("sample_data/Rab1.chaos.xml");
  $f_rab1 = $a_rab1->feature('mRNA:EMBL/GenBank/SwissProt:AE003734:52204:55287');
  $t_produces_rab1 = $a_rab1->trace($f_rab1, 'produces');
  $f_rab1 = $a_rab1->feature('AAF55873.1');
  $t_producers_rab1 = $a_rab1->trace($f_rab1, 'producers');




  can_ok($a, qw(trace));
  isa_ok($t_parts, CGL::Annotation::Trace, "Trace for parts.");
  ok(scalar(@{$t_parts->{features}}) > 0, "Check parts");
  isa_ok($t_whole, CGL::Annotation::Trace, "Trace for wholes.");
  ok(scalar(@{$t_whole->{features}}) > 0, "Check wholes");
  can_ok($a_rab1, qw(trace));
  isa_ok($t_produces_rab1, CGL::Annotation::Trace, "Trace rab1 for produces.");
  ok(scalar(@{$t_produces_rab1->{features}}) > 0, "Check rab1 produces");
  isa_ok($t_producers_rab1, CGL::Annotation::Trace, "Trace rab1 for produces.");
  ok(scalar(@{$t_producers_rab1->{features}}) > 0, "Check rab1 producers");

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

#line 1125 lib/CGL/Annotation.pm

  my $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  my $export_user;		# a reference to the metadata.
  $export_user = $a->meta_data("export_user");




;

  }
};
is($@, '', "example from line 1125");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1125 lib/CGL/Annotation.pm

  my $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  my $export_user;		# a reference to the metadata.
  $export_user = $a->meta_data("export_user");




  can_ok($a, qw(meta_data));
  is($export_user, "cjm", "Check for correct export_user in xml file");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

