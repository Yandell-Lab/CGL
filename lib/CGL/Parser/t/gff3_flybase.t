#!/usr/bin/perl

use strict;
use warnings;

use lib '/home/bmoore/CGL/trunk/lib/';

use Test::More qw(no_plan);

BEGIN {use_ok( 'CGL::Annotation' )}

my $gff_file   = '../../../../sample_data/3L_FBgn0036594.gff3';
my $fasta_file = '../../../../sample_data/3L_FBgn0036594.fasta';
my $format     = 'gff3_flybase';

my $cgl = new CGL::Annotation(format     => $format,
			      gff_file   => $gff_file,
			      fasta_file => $fasta_file,
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