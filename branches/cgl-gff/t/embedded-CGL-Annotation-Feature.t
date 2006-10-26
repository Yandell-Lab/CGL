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

my $Original_File = 'lib/CGL/Annotation/Feature.pm';

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

#line 10 lib/CGL/Annotation/Feature.pm
  use UNIVERSAL qw( isa );



  # make sure that there's a SO file available.
  BEGIN {
    $ENV{SO_OBO_FILE} = "sample_data/so.obo" unless $ENV{SO_OBO_FILE};
  }

  use CGL::Annotation::Feature;
  my $f = new CGL::Annotation::Feature;




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Annotation/Feature.pm
  use UNIVERSAL qw( isa );



  # make sure that there's a SO file available.
  BEGIN {
    $ENV{SO_OBO_FILE} = "sample_data/so.obo" unless $ENV{SO_OBO_FILE};
  }

  use CGL::Annotation::Feature;
  my $f = new CGL::Annotation::Feature;




  isa_ok($f, "CGL::Annotation::Feature", "Check if it's the right type.");

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

#line 82 lib/CGL/Annotation/Feature.pm
  use UNIVERSAL qw( isa );



  use CGL::Annotation::Feature;
  my $foo = new CGL::Annotation::Feature;




;

  }
};
is($@, '', "example from line 82");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 82 lib/CGL/Annotation/Feature.pm
  use UNIVERSAL qw( isa );



  use CGL::Annotation::Feature;
  my $foo = new CGL::Annotation::Feature;




  isa_ok($foo, "CGL::Annotation::Feature", "Check if it's the right type.");

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

#line 167 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation::Feature;
  my $feat = new CGL::Annotation::Feature;

;

  }
};
is($@, '', "example from line 167");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 206 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;

  my $a;			# an annotation.
  my $some_contig;		# a feature.
  my $residues;			# the residues.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $some_contig = $a->feature("contig-3283");
  $residues = $some_contig->residues();




;

  }
};
is($@, '', "example from line 206");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 206 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;

  my $a;			# an annotation.
  my $some_contig;		# a feature.
  my $residues;			# the residues.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $some_contig = $a->feature("contig-3283");
  $residues = $some_contig->residues();




  like($residues, qr/^TTTAT.*/, "Check the residues for contig-3283.");

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

#line 254 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;

  my $a;			# an annotation.
  my $feature;			# a feature.
  my $nbeg;			# its natural begin.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $feature = $a->feature("contig-3283");

  $nbeg = $feature->nbeg();




;

  }
};
is($@, '', "example from line 254");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 254 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;

  my $a;			# an annotation.
  my $feature;			# a feature.
  my $nbeg;			# its natural begin.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $feature = $a->feature("contig-3283");

  $nbeg = $feature->nbeg();




  is($nbeg, 8174345, "Check the natural begin of contig-3283.");

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

#line 304 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;

  my $a;			# an annotation.
  my $feature;			# a feature.
  my $nend;			# its natural end.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $feature = $a->feature("contig-3283");

  $nend = $feature->nend();




;

  }
};
is($@, '', "example from line 304");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 304 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;

  my $a;			# an annotation.
  my $feature;			# a feature.
  my $nend;			# its natural end.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $feature = $a->feature("contig-3283");

  $nend = $feature->nend();




  is($nend, 8177133, "Check the natural end of contig-3283.");

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

#line 354 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;

  my $a;			# an annotation.
  my $feature;			# a feature.
  my $length;			# its length.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $feature = $a->feature("contig-3283");

  $length = $feature->length();




;

  }
};
is($@, '', "example from line 354");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 354 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;

  my $a;			# an annotation.
  my $feature;			# a feature.
  my $length;			# its length.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $feature = $a->feature("contig-3283");

  $length = $feature->length();




  is($length, 2788, "Check the length of contig-3283.");

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

#line 398 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $u;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $u = $l[0]->uniquename();




;

  }
};
is($@, '', "example from line 398");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 398 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $u;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $u = $l[0]->uniquename();




  is($u, "At3g23010-gene-107698", "Check the unique name getter.");

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

#line 442 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $location;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $location = $l[0]->featureLocation();




;

  }
};
is($@, '', "example from line 442");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 442 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $location;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $location = $l[0]->featureLocation();




  isa_ok($location, "CGL::Annotation::FeatureLocation", "Check return class.");

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

#line 491 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $n;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $n = $l[0]->name();




;

  }
};
is($@, '', "example from line 491");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 491 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $n;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $n = $l[0]->name();




  is($n, "At3g23010", "Check the name getter.");

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

#line 533 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $t;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $t = $l[0]->type();




;

  }
};
is($@, '', "example from line 533");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 533 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $t;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $t = $l[0]->type();




  is($t, "gene", "Check the type getter.");

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

#line 573 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $s;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $s = $l[0]->strand();




;

  }
};
is($@, '', "example from line 573");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 573 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $s;			# the feature's unique name.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $s = $l[0]->strand();




  is($s, 1, "Check the strand getter.");

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

#line 621 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $i;			# the feature's id.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $i = $l[0]->id();




;

  }
};
is($@, '', "example from line 621");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 621 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $i;			# the feature's id.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $i = $l[0]->id();




  is($i, "gene-107698", "Check the id getter.");

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

#line 661 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $i;			# the feature's id.
  my $is_in_scope;
  my $is_not_in_scope;

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $l[0]->inScope(0);
  $is_not_in_scope =   $l[0]->inScope();
  $l[0]->inScope(1);
  $is_in_scope =   $l[0]->inScope();




;

  }
};
is($@, '', "example from line 661");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 661 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $i;			# the feature's id.
  my $is_in_scope;
  my $is_not_in_scope;

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $l[0]->inScope(0);
  $is_not_in_scope =   $l[0]->inScope();
  $l[0]->inScope(1);
  $is_in_scope =   $l[0]->inScope();




  is($is_not_in_scope, 0, "Did setting inScope to false work?");
  is($is_in_scope, 1, "Did setting inScope to true work?");

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

#line 714 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# a gene from the annotation.
  my $note;			# a note from the featureprop.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $note = $g->properties('note');




;

  }
};
is($@, '', "example from line 714");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 714 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my $g;			# a gene from the annotation.
  my $note;			# a note from the featureprop.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $g = $a->gene(0);
  $note = $g->properties('note');




  isa_ok($g, CGL::Annotation::Feature::Gene, "moose");
  is($note,
     'MXC7.4;similartoHcr25bGB:AAC78595(Lycopersiconesculentum)(PlantCell10,19151926(1998));containsPfamprofile:PF00560leucinerichrepeat(17copies)',
     "Check that we properly retrieve a note property."); 

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

#line 764 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my @r;			# the feature's relationships.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  @r = $l[0]->relationships();




;

  }
};
is($@, '', "example from line 764");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 764 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my @r;			# the feature's relationships.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  @r = $l[0]->relationships();




  isa_ok($r[0], CGL::Annotation::FeatureRelationship, "Check relationships");

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

#line 804 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $l[0]->_add_id('feature_id');





;

  }
};
is($@, '', "example from line 804");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 804 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $l[0]->_add_id('feature_id');





  is($l[0]->{id}, 'gene-107698', "Check that _add_id did the right thing.");

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

#line 845 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $so;			# a reference to out so object.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $so = $l[0]->_so();




;

  }
};
is($@, '', "example from line 845");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 845 lib/CGL/Annotation/Feature.pm

  use CGL::Annotation;
  my $a;			# reference to a CGL::Annotation
  my @l;			# a list of gene features.
  my $so;			# a reference to out so object.

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  @l = $a->featuresByType('gene');
  $so = $l[0]->_so();




  isa_ok($so, "CGL::Ontology::SO", "Check if it's the right type.");

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

#line 891 lib/CGL/Annotation/Feature.pm




;

  }
};
is($@, '', "example from line 891");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 969 lib/CGL/Annotation/Feature.pm




;

  }
};
is($@, '', "example from line 969");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 1012 lib/CGL/Annotation/Feature.pm




;

  }
};
is($@, '', "example from line 1012");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 1043 lib/CGL/Annotation/Feature.pm




;

  }
};
is($@, '', "example from line 1043");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

