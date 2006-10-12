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

my $Original_File = 'lib/CGL/Annotation/Iterator.pm';

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

#line 10 lib/CGL/Annotation/Iterator.pm



  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $ref;			# an array reference
  my $g;			# a gene
  my $t;			# a transcript
  my $p;			# a translation (protein...)

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);
  $g = $iter->next_by_gene();
  $ref = $iter->next_by_transcript;
  ($t, $g) = @{$ref};
  $ref = $iter->next_by_translation;
  ($p, $t, $g) = @{$ref};




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Annotation/Iterator.pm



  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $ref;			# an array reference
  my $g;			# a gene
  my $t;			# a transcript
  my $p;			# a translation (protein...)

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);
  $g = $iter->next_by_gene();
  $ref = $iter->next_by_transcript;
  ($t, $g) = @{$ref};
  $ref = $iter->next_by_translation;
  ($p, $t, $g) = @{$ref};




  isa_ok($iter, "CGL::Annotation::Iterator", "Check if it's the right type.");
  isa_ok($g, "CGL::Annotation::Feature::Gene", "Check its type.");
  isa_ok($t, "CGL::Annotation::Feature::Transcript", "Check its type.");
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

#line 106 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $g;			# a gene
  my $t;			# a transcript
  my $p;			# a translation (protein...)

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);




;

  }
};
is($@, '', "example from line 106");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 106 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $g;			# a gene
  my $t;			# a transcript
  my $p;			# a translation (protein...)

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);




  isa_ok($iter, "CGL::Annotation::Iterator", "Check if it's the right type.");

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

#line 156 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $g_1;			# a gene
  my $g_2;			# another gene (should be the same one...)

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);

  $g_1 = $iter->next_by_gene();
  $iter->reset();
  $g_2 = $iter->next_by_gene();




;

  }
};
is($@, '', "example from line 156");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 156 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $g_1;			# a gene
  my $g_2;			# another gene (should be the same one...)

  $a = new CGL::Annotation("sample_data/atha.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);

  $g_1 = $iter->next_by_gene();
  $iter->reset();
  $g_2 = $iter->next_by_gene();




  is($g_1, $g_2, "Check reset.");

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

#line 204 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $g;			# a gene
  my $count = 0;		# counts the genes

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);
  $g = $iter->next_by_gene();

  $iter->reset();
  while ($iter->next_by_gene()) {
    $count++;
  }




;

  }
};
is($@, '', "example from line 204");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 204 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $g;			# a gene
  my $count = 0;		# counts the genes

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);
  $g = $iter->next_by_gene();

  $iter->reset();
  while ($iter->next_by_gene()) {
    $count++;
  }




  isa_ok($g, "CGL::Annotation::Feature::Gene", "Check that returned a gene.");
  is($count, 2, "Check that it counted right.");

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

#line 270 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $ref;			# results ref.
  my $g;			# a gene
  my $t;			# a transcript
  my $count = 0;		# counts the transcripts

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);
  $ref = $iter->next_by_transcript();
  ($t, $g) = @{$ref};

  $iter->reset();
  while ($iter->next_by_transcript()) {
    $count++;
  }




;

  }
};
is($@, '', "example from line 270");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 270 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $ref;			# results ref.
  my $g;			# a gene
  my $t;			# a transcript
  my $count = 0;		# counts the transcripts

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);
  $ref = $iter->next_by_transcript();
  ($t, $g) = @{$ref};

  $iter->reset();
  while ($iter->next_by_transcript()) {
    $count++;
  }




  isa_ok($t, "CGL::Annotation::Feature::Transcript", "Check its type.");
  is($count, 3, "Check that it counts right.");

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

#line 351 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $ref;			# results ref.
  my $g;			# a gene
  my $t;			# a transcript
  my $p;			# a translation (protein)
  my $count = 0;		# counts the transcripts

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);
  $ref = $iter->next_by_translation();
  ($p, $t, $g) = @{$ref};

  $iter->reset();
  while ($iter->next_by_transcript()) {
    $count++;
  }




;

  }
};
is($@, '', "example from line 351");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 351 lib/CGL/Annotation/Iterator.pm

  use CGL::Annotation;
  use CGL::Annotation::Iterator;

  my $a;			# reference to a CGL::Annotation
  my $iter;			# iterator
  my $ref;			# results ref.
  my $g;			# a gene
  my $t;			# a transcript
  my $p;			# a translation (protein)
  my $count = 0;		# counts the transcripts

  $a = new CGL::Annotation("sample_data/dmel.sample.chaos.xml");
  $iter = new CGL::Annotation::Iterator($a);
  $ref = $iter->next_by_translation();
  ($p, $t, $g) = @{$ref};

  $iter->reset();
  while ($iter->next_by_transcript()) {
    $count++;
  }




  isa_ok($p, "CGL::Annotation::Feature::Protein", "Check the type.");
  is($count, 3, "Check that it counts right.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

