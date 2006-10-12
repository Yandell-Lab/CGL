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

my $Original_File = 'lib/CGL/Clone.pm';

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

#line 79 lib/CGL/Clone.pm

  use CGL::Clone qw(clone);
  use CGL::Annotation::Feature::Exon;

  my $object;
  my $newObject;

  # In real life, a real CGL::Annotation::Feature::Exon...
  $object = bless {}, CGL::Annotation::Feature::Exon;
  $newObject = clone($object);




;

  }
};
is($@, '', "example from line 79");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 79 lib/CGL/Clone.pm

  use CGL::Clone qw(clone);
  use CGL::Annotation::Feature::Exon;

  my $object;
  my $newObject;

  # In real life, a real CGL::Annotation::Feature::Exon...
  $object = bless {}, CGL::Annotation::Feature::Exon;
  $newObject = clone($object);




  isa_ok($newObject, "CGL::Annotation::Feature::Exon",
         "Check if it's the right type.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

