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

my $Original_File = 'lib/CGL/Ontology/Ontology.pm';

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

#line 10 lib/CGL/Ontology/Ontology.pm

  use CGL::Ontology::SO;
  my $so = new CGL::Ontology::SO("sample_data/so.new.obo");




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Ontology/Ontology.pm

  use CGL::Ontology::SO;
  my $so = new CGL::Ontology::SO("sample_data/so.new.obo");




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

#line 113 lib/CGL/Ontology/Ontology.pm

  use CGL::Ontology::SO;

  # for testing purposes
  $ENV{CGL_SO_SOURCE} = "sample_data/so.new.obo";
  my $so = new CGL::Ontology::SO;

  my $nodes1 = $so->nodes();
  my $nodes2 = $so->nodes(undef);
  my $nodes3 = $so->nodes($nodes1);




;

  }
};
is($@, '', "example from line 113");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 113 lib/CGL/Ontology/Ontology.pm

  use CGL::Ontology::SO;

  # for testing purposes
  $ENV{CGL_SO_SOURCE} = "sample_data/so.new.obo";
  my $so = new CGL::Ontology::SO;

  my $nodes1 = $so->nodes();
  my $nodes2 = $so->nodes(undef);
  my $nodes3 = $so->nodes($nodes1);




  isa_ok($nodes1, "HASH", "Check the getter.");
  is($nodes2, undef, "Check clearing.");
  isa_ok($nodes3, "HASH", "Check the getter.");

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

#line 161 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 161");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 161 lib/CGL/Ontology/Ontology.pm

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

#line 199 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 199");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 199 lib/CGL/Ontology/Ontology.pm

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

#line 238 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 238");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 238 lib/CGL/Ontology/Ontology.pm

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

#line 280 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 280");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 280 lib/CGL/Ontology/Ontology.pm

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

#line 322 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 322");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 322 lib/CGL/Ontology/Ontology.pm

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

#line 377 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 377");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 377 lib/CGL/Ontology/Ontology.pm

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

#line 434 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 434");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 434 lib/CGL/Ontology/Ontology.pm

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

#line 487 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 487");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 487 lib/CGL/Ontology/Ontology.pm

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

#line 532 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 532");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 532 lib/CGL/Ontology/Ontology.pm

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

#line 586 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 586");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 586 lib/CGL/Ontology/Ontology.pm

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

#line 659 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 659");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 659 lib/CGL/Ontology/Ontology.pm

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

#line 735 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 735");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 735 lib/CGL/Ontology/Ontology.pm

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

#line 789 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 789");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 789 lib/CGL/Ontology/Ontology.pm

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

#line 843 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 843");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 843 lib/CGL/Ontology/Ontology.pm

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

#line 889 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 889");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 889 lib/CGL/Ontology/Ontology.pm

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

#line 934 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 934");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 934 lib/CGL/Ontology/Ontology.pm

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

#line 980 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 980");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 980 lib/CGL/Ontology/Ontology.pm

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

#line 1025 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 1025");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1025 lib/CGL/Ontology/Ontology.pm

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

#line 1064 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 1064");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1064 lib/CGL/Ontology/Ontology.pm

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

#line 1100 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 1100");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1100 lib/CGL/Ontology/Ontology.pm

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

#line 1135 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 1135");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1135 lib/CGL/Ontology/Ontology.pm

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

#line 1235 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 1235");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1235 lib/CGL/Ontology/Ontology.pm

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

#line 1281 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 1281");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1281 lib/CGL/Ontology/Ontology.pm

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

#line 1321 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 1321");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1321 lib/CGL/Ontology/Ontology.pm

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

#line 1361 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 1361");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 1361 lib/CGL/Ontology/Ontology.pm

  use PROTO;
  my $foo = new PROTO;




  isa_ok($foo, "PROTO", "Check if it's the right type.");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

