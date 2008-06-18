#!/usr/bin/perl

use strict;
use warnings;

use lib '/home/bmoore/CGL/trunk/lib/';

use Test::More qw(no_plan);

BEGIN {use_ok( 'XML::LibXML' );
       use_ok( 'CGL::Annotation' )}

my $file = '../../../../sample_data/hsap.sample.chaos.xml';

my $cgl = new CGL::Annotation(format => 'chaos',
			      file   => $file,
			     );

isa_ok($cgl, 'CGL::Annotation');

can_ok($cgl, qw(transcript
		translation
		get_gene_by_id
		get_gene_by_name
		get_gene_by_uniquename
		gene
		genes
		transcripts
		contig
		contigs
		sequence_variants
		translations
		exons
		featuresByType
		feature
		features
		relationships
		trace
		meta_data
		transcript_is_in_scope
	      ));


__END__

# Various ways to say "ok"
ok($got eq $expected, $test_name);

is  ($got, $expected, $test_name);
isnt($got, $expected, $test_name);

# Rather than print STDERR "# here's what went wrong\n"
diag("here's what went wrong");

like  ($got, qr/expected/, $test_name);
unlike($got, qr/expected/, $test_name);

cmp_ok($got, '==', $expected, $test_name);
