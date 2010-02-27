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

my $Original_File = 'lib/CGL/Annotation/FeatureLocation.pm';

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

#line 80 lib/CGL/Annotation/FeatureLocation.pm

  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);




;

  }
};
is($@, '', "example from line 80");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 80 lib/CGL/Annotation/FeatureLocation.pm

  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);




  isa_ok($f_loc, "CGL::Annotation::FeatureLocation",
         "Check if it's the right type.");

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

#line 125 lib/CGL/Annotation/FeatureLocation.pm

  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  $f_loc->group("Testing");
  my $group_value = $f_loc->group();
  $f_loc->group(undef);
  my $group_value2 = $f_loc->group();




;

  }
};
is($@, '', "example from line 125");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 125 lib/CGL/Annotation/FeatureLocation.pm

  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  $f_loc->group("Testing");
  my $group_value = $f_loc->group();
  $f_loc->group(undef);
  my $group_value2 = $f_loc->group();




  is($group_value, "Testing", "Check if it's the right value.");
  is($group_value2, undef, "Check if it's the right value (undef).");

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

#line 173 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  my $nbeg = $f_loc->nbeg();
  $f_loc->nbeg(505);
  my $nbeg2 = $f_loc->nbeg();
  $f_loc->nbeg(undef);
  my $nbeg3 = $f_loc->nbeg();




;

  }
};
is($@, '', "example from line 173");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 173 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  my $nbeg = $f_loc->nbeg();
  $f_loc->nbeg(505);
  my $nbeg2 = $f_loc->nbeg();
  $f_loc->nbeg(undef);
  my $nbeg3 = $f_loc->nbeg();




  is($nbeg, 500, "Check if it's the right value. (500)");
  is($nbeg2, 505, "Check if it's the right value.(505)");
  is($nbeg3, undef, "Check if it's the right value (undef).");

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

#line 223 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  my $nend = $f_loc->nend();
  $f_loc->nend(505);
  my $nend2 = $f_loc->nend();
  $f_loc->nend(undef);
  my $nend3 = $f_loc->nend();




;

  }
};
is($@, '', "example from line 223");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 223 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  my $nend = $f_loc->nend();
  $f_loc->nend(505);
  my $nend2 = $f_loc->nend();
  $f_loc->nend(undef);
  my $nend3 = $f_loc->nend();




  is($nend, 26220, "Check if it's the right value. (26220)");
  is($nend2, 505, "Check if it's the right value.(505)");
  is($nend3, undef, "Check if it's the right value (undef).");

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

#line 272 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  $f_loc->srcfeature(505);
  my $srcfeature = $f_loc->srcfeature();
  $f_loc->srcfeature(undef);
  my $srcfeature2 = $f_loc->srcfeature();




;

  }
};
is($@, '', "example from line 272");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 272 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  $f_loc->srcfeature(505);
  my $srcfeature = $f_loc->srcfeature();
  $f_loc->srcfeature(undef);
  my $srcfeature2 = $f_loc->srcfeature();




  is($srcfeature, 505, "Check if it's the right value.(505)");
  is($srcfeature2, undef, "Check if it's the right value (undef).");

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

#line 321 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  my $srcfeature_id = $f_loc->srcfeature_id();
  $f_loc->srcfeature_id(undef);
  my $srcfeature_id2 = $f_loc->srcfeature();




;

  }
};
is($@, '', "example from line 321");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 321 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  my $srcfeature_id = $f_loc->srcfeature_id();
  $f_loc->srcfeature_id(undef);
  my $srcfeature_id2 = $f_loc->srcfeature();




  is($srcfeature_id, 'contig-3088', "Check if it's the right value.(contig-3088)");
  is($srcfeature_id2, undef, "Check if it's the right value (undef).");

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

#line 369 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  $f_loc->strand("+");
  my $strand = $f_loc->strand();
  $f_loc->strand(undef);
  my $strand2 = $f_loc->strand();




;

  }
};
is($@, '', "example from line 369");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 369 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  $f_loc->strand("+");
  my $strand = $f_loc->strand();
  $f_loc->strand(undef);
  my $strand2 = $f_loc->strand();




  is($strand, '+', "Check if it's the right value.(+)");
  is($strand2, undef, "Check if it's the right value (undef).");

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

#line 418 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  my $rank = $f_loc->rank();
  $f_loc->rank(undef);
  my $rank2 = $f_loc->rank();




;

  }
};
is($@, '', "example from line 418");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 418 lib/CGL/Annotation/FeatureLocation.pm
  use CGL::Annotation::FeatureLocation;
  my $location = {'srcfeature_id' => 'contig-3088',
                  'nbeg' => 500,
                  'nend' => 26220,
                  'rank' => 0,
                 };
  my $f_loc = new CGL::Annotation::FeatureLocation ($location);

  my $rank = $f_loc->rank();
  $f_loc->rank(undef);
  my $rank2 = $f_loc->rank();




  is($rank, 0, "Check if it's the right value.(0)");
  is($rank2, undef, "Check if it's the right value (undef).");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

