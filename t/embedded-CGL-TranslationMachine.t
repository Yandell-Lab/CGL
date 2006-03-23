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

my $Original_File = 'lib/CGL/TranslationMachine.pm';

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

#line 10 lib/CGL/TranslationMachine.pm
  use UNIVERSAL qw( isa );



  use CGL::TranslationMachine;
  my $t = new CGL::TranslationMachine;




;

  }
};
is($@, '', "example from line 10");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 10 lib/CGL/TranslationMachine.pm
  use UNIVERSAL qw( isa );



  use CGL::TranslationMachine;
  my $t = new CGL::TranslationMachine;




  isa_ok($t, "CGL::TranslationMachine", "Check if it's the right type.");

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

#line 87 lib/CGL/TranslationMachine.pm

  use CGL::TranslationMachine;
  my $t = new CGL::TranslationMachine;




;

  }
};
is($@, '', "example from line 87");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 87 lib/CGL/TranslationMachine.pm

  use CGL::TranslationMachine;
  my $t = new CGL::TranslationMachine;




  isa_ok($t, "CGL::TranslationMachine", "Check if it's the right type.");

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

#line 127 lib/CGL/TranslationMachine.pm
  $seq = "atgaaaaaauaa";



  use CGL::TranslationMachine;
  my $t = new CGL::TranslationMachine;
  my ($longest_orf,$offset) = $t->longest_translation($seq);




;

  }
};
is($@, '', "example from line 127");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 127 lib/CGL/TranslationMachine.pm
  $seq = "atgaaaaaauaa";



  use CGL::TranslationMachine;
  my $t = new CGL::TranslationMachine;
  my ($longest_orf,$offset) = $t->longest_translation($seq);




  is($longest_orf, "MKK", "Did it find the right orf?");
  is($offset, 0, "Did it get the offset right?");

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

#line 186 lib/CGL/TranslationMachine.pm
  $seq = "atgatgatgaaaaaauaa";



  use CGL::TranslationMachine;
  my $t = new CGL::TranslationMachine;
  my $aaseq = $t->translate_from_offset($seq, 6);




;

  }
};
is($@, '', "example from line 186");

{
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 186 lib/CGL/TranslationMachine.pm
  $seq = "atgatgatgaaaaaauaa";



  use CGL::TranslationMachine;
  my $t = new CGL::TranslationMachine;
  my $aaseq = $t->translate_from_offset($seq, 6);




  is($aaseq, "MKK*", "Did it find the right orf?");

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

    undef $main::_STDOUT_;
    undef $main::_STDERR_;

