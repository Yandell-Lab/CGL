use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'CGL',
    VERSION_FROM => 'lib/CGL/Version.pm', # finds $VERSION
    AUTHOR       => 'Mark Yandell (myandell@fruitfly.org)',
    ABSTRACT     => '',
    PREREQ_PM    => {
		     'Test::More' => 0,
		     'Test::Inline' => 0,
		     'Bio::CodonUsage::Table' => 0,
                    },
    EXE_FILES    => [ qw (script/cgl_version
			  script/cgl_tutorial
			  script/cgl_phat_tutorial
			  script/cgl_so_reasoner
			  script/cgl_compare_annotations
			  script/cgl_validate) ],
    clean	=> {FILES => "t/embedded-*t pod2htm[di].tmp Makefile.PL~" },
);


#
# from the Test::Inline::Tutorial man page.
# modified to use explicit dependencies between the .t
# files and their parent .pm's.
# Also extended to add an htmlifypods target to make the html
# version of the POD docs.
#
{
  package MY;
  sub top_targets {
    my($self) = @_;
    my $out = "";
    my $testify = "";

    $out .= "POD2TEST_EXE = pod2test\n";
    $out .= $self->SUPER::top_targets(@_);
    $out =~ s/^(pure_all\b.*)/$1 testifypods/m;

    #
    # build the test files from the embedded tests.
    #
    $out .= "\n\ntestifypods : ";

    foreach my $pod (keys %{$self->{MAN1PODS}},
		     keys %{$self->{MAN3PODS}})
      {
	(my $test = $pod) =~ s/\.(pm|pod)$//;
	$test =~ s|/|-|g;
	$test =~ s/^lib\W//;
	$test =~ s/\W/-/;
	$test = "embedded-$test.t";
	$out .= "t/$test ";
	$testify .= "t/$test : $pod\n\t-\$(POD2TEST_EXE) ".
	  "$pod t/$test\n";
      }
    $out .= "\n\n";
    $out .= $testify, "\n";

    return $out;
  }
}

sub MY::postamble {
  qq{

# based on go-perl's pod generation strategy
# breakage is probably George's fault...
pod :: \
	perl script/cgl_make_pod_html < MANIFEST

pod.tar.gz :: pod\
	tar cvf pod.tar pod && gzip pod.tar

  };  
}
