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

my $Original_File = 'lib/CGL/Ontology/Node.pm';

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

#line 10 lib/CGL/Ontology/Node.pm
  use UNIVERSAL qw( isa );



  use CGL::Ontology::Node;
  my $foo = new CGL::Ontology::Node;




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Ontology/Node.pm
  use UNIVERSAL qw( isa );



  use CGL::Ontology::Node;
  my $foo = new CGL::Ontology::Node;




  isa_ok($foo, "CGL::Ontology::Node", "Check if it's the right type.");

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

#line 91 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 91");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 91 lib/CGL/Ontology/Node.pm

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

#line 134 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 134");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 134 lib/CGL/Ontology/Node.pm

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

#line 169 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 169");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 169 lib/CGL/Ontology/Node.pm

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

#line 205 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 205");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 205 lib/CGL/Ontology/Node.pm

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

#line 240 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 240");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 240 lib/CGL/Ontology/Node.pm

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

#line 275 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 275");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 275 lib/CGL/Ontology/Node.pm

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

#line 317 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 317");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 317 lib/CGL/Ontology/Node.pm

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

#line 354 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 354");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 354 lib/CGL/Ontology/Node.pm

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

#line 390 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 390");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 390 lib/CGL/Ontology/Node.pm

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

#line 439 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 439");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 439 lib/CGL/Ontology/Node.pm

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

#line 478 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 478");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 478 lib/CGL/Ontology/Node.pm

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

#line 519 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 519");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 519 lib/CGL/Ontology/Node.pm

  use PROTO;
  my $foo = new PROTO;




  isa_ok($foo, "PROTO", "Check if it's the right type.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

