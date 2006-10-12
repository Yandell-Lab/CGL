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

my $Original_File = 'lib/CGL/Version.pm';

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

#line 10 lib/CGL/Version.pm

  use CGL::Version;
  print "CGL Version " . CGL::Version::version();




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Version.pm

  use CGL::Version;
  print "CGL Version " . CGL::Version::version();




  is( $_STDOUT_, "CGL Version 0.08", "Checking explicit call.");

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

#line 73 lib/CGL/Version.pm

  # refer to the version function explicitly.
  use CGL::Version;
  print "CGL Version " . CGL::Version::version();




;

  }
};
is($@, '', "example from line 73");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 73 lib/CGL/Version.pm

  # refer to the version function explicitly.
  use CGL::Version;
  print "CGL Version " . CGL::Version::version();




  is( $_STDOUT_, "CGL Version 0.08", "Checking for correct version number.");

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

#line 84 lib/CGL/Version.pm

  # import the version function into your namespace (yikes!).
  use CGL::Version qw( version );
  print "CGL Version " . version();




;

  }
};
is($@, '', "example from line 84");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 84 lib/CGL/Version.pm

  # import the version function into your namespace (yikes!).
  use CGL::Version qw( version );
  print "CGL Version " . version();




  is( $_STDOUT_, "CGL Version 0.08", "Checking exported call.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

