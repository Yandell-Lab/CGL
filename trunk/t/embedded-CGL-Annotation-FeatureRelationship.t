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

my $Original_File = 'lib/CGL/Annotation/FeatureRelationship.pm';

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

#line 74 lib/CGL/Annotation/FeatureRelationship.pm

  use CGL::Annotation::FeatureRelationship;
  # fake up some test data, real hash would come from chaos xml....
  my $fr_info = {'feature_relationship' =>
                   {'object_id' => 'gene-290267',
                    'subject_id' => 'STS-290319',
                    'type' => 'part_of'}
                };

  my $relationship = new CGL::Annotation::FeatureRelationship($fr_info);




;

  }
};
is($@, '', "example from line 74");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 74 lib/CGL/Annotation/FeatureRelationship.pm

  use CGL::Annotation::FeatureRelationship;
  # fake up some test data, real hash would come from chaos xml....
  my $fr_info = {'feature_relationship' =>
                   {'object_id' => 'gene-290267',
                    'subject_id' => 'STS-290319',
                    'type' => 'part_of'}
                };

  my $relationship = new CGL::Annotation::FeatureRelationship($fr_info);




  isa_ok($relationship, "CGL::Annotation::FeatureRelationship",
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

#line 138 lib/CGL/Annotation/FeatureRelationship.pm

  use CGL::Annotation::FeatureRelationship;
  # fake up some test data, real hash would come from chaos xml....
  my $fr_info = {'feature_relationship' =>
                   {'object_id' => 'gene-290267',
                    'subject_id' => 'STS-290319',
                    'type' => 'part_of'}
                };
  my $relationship = new CGL::Annotation::FeatureRelationship($fr_info);
  my $object_feature = $relationship->oF();




;

  }
};
is($@, '', "example from line 138");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 138 lib/CGL/Annotation/FeatureRelationship.pm

  use CGL::Annotation::FeatureRelationship;
  # fake up some test data, real hash would come from chaos xml....
  my $fr_info = {'feature_relationship' =>
                   {'object_id' => 'gene-290267',
                    'subject_id' => 'STS-290319',
                    'type' => 'part_of'}
                };
  my $relationship = new CGL::Annotation::FeatureRelationship($fr_info);
  my $object_feature = $relationship->oF();




  is($object_feature, 'gene-290267', "Check the object feature.");

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

#line 182 lib/CGL/Annotation/FeatureRelationship.pm

  use CGL::Annotation::FeatureRelationship;
  # fake up some test data, real hash would come from chaos xml....
  my $fr_info = {'feature_relationship' =>
                   {'object_id' => 'gene-290267',
                    'subject_id' => 'STS-290319',
                    'type' => 'part_of'}
                };
  my $relationship = new CGL::Annotation::FeatureRelationship($fr_info);
  my $subject_feature = $relationship->sF();




;

  }
};
is($@, '', "example from line 182");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 182 lib/CGL/Annotation/FeatureRelationship.pm

  use CGL::Annotation::FeatureRelationship;
  # fake up some test data, real hash would come from chaos xml....
  my $fr_info = {'feature_relationship' =>
                   {'object_id' => 'gene-290267',
                    'subject_id' => 'STS-290319',
                    'type' => 'part_of'}
                };
  my $relationship = new CGL::Annotation::FeatureRelationship($fr_info);
  my $subject_feature = $relationship->sF();




  is($subject_feature, 'STS-290319', "Check the subject of the feature.");

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

#line 226 lib/CGL/Annotation/FeatureRelationship.pm

  use CGL::Annotation::FeatureRelationship;
  # fake up some test data, real hash would come from chaos xml....
  my $fr_info = {'feature_relationship' =>
                   {'object_id' => 'gene-290267',
                    'subject_id' => 'STS-290319',
                    'type' => 'part_of'}
                };
  my $relationship = new CGL::Annotation::FeatureRelationship($fr_info);
  my $logus = $relationship->logus();




;

  }
};
is($@, '', "example from line 226");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 226 lib/CGL/Annotation/FeatureRelationship.pm

  use CGL::Annotation::FeatureRelationship;
  # fake up some test data, real hash would come from chaos xml....
  my $fr_info = {'feature_relationship' =>
                   {'object_id' => 'gene-290267',
                    'subject_id' => 'STS-290319',
                    'type' => 'part_of'}
                };
  my $relationship = new CGL::Annotation::FeatureRelationship($fr_info);
  my $logus = $relationship->logus();




  is($logus, 'part_of', "Check the relationship's.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

