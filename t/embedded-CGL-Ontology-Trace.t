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

my $Original_File = 'lib/CGL/Ontology/Trace.pm';

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

#line 10 lib/CGL/Ontology/Trace.pm
  use UNIVERSAL qw( isa );



  use CGL::Ontology::Trace;
  my $foo = new CGL::Ontology::Trace;




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Ontology/Trace.pm
  use UNIVERSAL qw( isa );



  use CGL::Ontology::Trace;
  my $foo = new CGL::Ontology::Trace;




  isa_ok($foo, "CGL::Ontology::Trace", "Check if it's the right type.");

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

#line 91 lib/CGL/Ontology/Trace.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 91");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 91 lib/CGL/Ontology/Trace.pm

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

#line 130 lib/CGL/Ontology/Trace.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 130");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 130 lib/CGL/Ontology/Trace.pm

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

#line 165 lib/CGL/Ontology/Trace.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 165");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 165 lib/CGL/Ontology/Trace.pm

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

#line 200 lib/CGL/Ontology/Trace.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 200");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 200 lib/CGL/Ontology/Trace.pm

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

#line 243 lib/CGL/Ontology/Trace.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 243");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 243 lib/CGL/Ontology/Trace.pm

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

#line 285 lib/CGL/Ontology/Trace.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 285");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 285 lib/CGL/Ontology/Trace.pm

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

#line 329 lib/CGL/Ontology/Trace.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 329");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 329 lib/CGL/Ontology/Trace.pm

  use PROTO;
  my $foo = new PROTO;




  isa_ok($foo, "PROTO", "Check if it's the right type.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

