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

my $Original_File = 'lib/Bio/Search/HSP/PhatHSP.pod';

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

#line 10 lib/Bio/Search/HSP/PhatHSP.pod
  use UNIVERSAL qw( isa );



  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/Bio/Search/HSP/PhatHSP.pod
  use UNIVERSAL qw( isa );



  use PROTO;
  my $foo = new PROTO;




  isa_ok($foo, "PROTO", "Check if it's the right type.");

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

#line 98 lib/Bio/Search/HSP/PhatHSP.pod

  use PROTO;
  my $foo = new PROTO;

;

  }
};
is($@, '', "example from line 98");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 135 lib/Bio/Search/HSP/PhatHSP.pod

  use PROTO;
  my $foo;
  my $attribute;

  $foo = new PROTO;
  $foo->attr("testing");
  $attribute = $foo->attr();

;

  }
};
is($@, '', "example from line 135");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

