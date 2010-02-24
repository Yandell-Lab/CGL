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

my $Original_File = 'lib/CGL/Annotation/Trace.pm';

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

#line 10 lib/CGL/Annotation/Trace.pm
  use UNIVERSAL qw( isa );



  use CGL::Annotation::Trace;
  my $foo = new CGL::Annotation::Trace;




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/Annotation/Trace.pm
  use UNIVERSAL qw( isa );



  use CGL::Annotation::Trace;
  my $foo = new CGL::Annotation::Trace;




  isa_ok($foo, "CGL::Annotation::Trace", "Check if it's the right type.");

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

#line 89 lib/CGL/Annotation/Trace.pm

  use PROTO;
  my $foo = new PROTO;




;

  }
};
is($@, '', "example from line 89");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 89 lib/CGL/Annotation/Trace.pm

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

#line 128 lib/CGL/Annotation/Trace.pm

  # this is an un-natural example, features aren't really
  # strings....
  use CGL::Annotation::Trace;
  my $t;			# a trace object
  my $count_zero;		# a counter
  my $count_two;		# another counter

  $t = new CGL::Annotation::Trace;

  $count_zero = $t->depth();

  $t->add_feature("Dummy Feature", 0); # strings don't really make sense...
  $t->add_feature("A dummy feature at level 1", 1);
  $t->add_feature("Another dummy feature at level 1", 1);

  $count_two = $t->depth();




;

  }
};
is($@, '', "example from line 128");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 128 lib/CGL/Annotation/Trace.pm

  # this is an un-natural example, features aren't really
  # strings....
  use CGL::Annotation::Trace;
  my $t;			# a trace object
  my $count_zero;		# a counter
  my $count_two;		# another counter

  $t = new CGL::Annotation::Trace;

  $count_zero = $t->depth();

  $t->add_feature("Dummy Feature", 0); # strings don't really make sense...
  $t->add_feature("A dummy feature at level 1", 1);
  $t->add_feature("Another dummy feature at level 1", 1);

  $count_two = $t->depth();




  is($count_zero, 0, "Did it start off empty.");
  is($count_two, 2, "Does it count correctly.");

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

#line 199 lib/CGL/Annotation/Trace.pm

  # this is an un-natural example, features aren't really
  # strings....
  use CGL::Annotation::Trace;
  my $t;			# a trace object

  $t = new CGL::Annotation::Trace;

  $t->add_feature("Dummy Feature", 0); # strings don't really make sense...
  $t->add_feature("A dummy feature at level 1", 1);
  $t->add_feature("Another dummy feature at level 1", 1);




;

  }
};
is($@, '', "example from line 199");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 199 lib/CGL/Annotation/Trace.pm

  # this is an un-natural example, features aren't really
  # strings....
  use CGL::Annotation::Trace;
  my $t;			# a trace object

  $t = new CGL::Annotation::Trace;

  $t->add_feature("Dummy Feature", 0); # strings don't really make sense...
  $t->add_feature("A dummy feature at level 1", 1);
  $t->add_feature("Another dummy feature at level 1", 1);




  like(($t->features(0))[0], qr/Dummy.*/, "Check lvl 0 structure");
  like(($t->features(1))[0], qr/A dummy.*/, "Check lvl 0, index 0 structure");
  like(($t->features(1))[1], qr/Another dummy.*/, "Check lvl 1, index 1");

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

#line 251 lib/CGL/Annotation/Trace.pm

  # this is an un-natural example, features aren't really
  # strings....
  use CGL::Annotation::Trace;
  my $t;			# a trace object

  $t = new CGL::Annotation::Trace;

  $t->add_feature("Dummy Feature", 0); # strings don't really make sense...
  $t->add_feature("A dummy feature at level 1", 1);
  $t->add_feature("Another dummy feature at level 1", 1);




;

  }
};
is($@, '', "example from line 251");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 251 lib/CGL/Annotation/Trace.pm

  # this is an un-natural example, features aren't really
  # strings....
  use CGL::Annotation::Trace;
  my $t;			# a trace object

  $t = new CGL::Annotation::Trace;

  $t->add_feature("Dummy Feature", 0); # strings don't really make sense...
  $t->add_feature("A dummy feature at level 1", 1);
  $t->add_feature("Another dummy feature at level 1", 1);




  like(($t->features(0))[0], qr/Dummy.*/, "Check lvl 0 structure");
  like(($t->features(1))[0], qr/A dummy.*/, "Check lvl 0, index 0 structure");
  like(($t->features(1))[1], qr/Another dummy.*/, "Check lvl 1, index 1");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

