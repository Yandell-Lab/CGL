#-------------------------------------------------------------------------------
#------              CGL::Parser::chaos                                  -------
#-------------------------------------------------------------------------------
package CGL::Parser::chaos;

use strict;
use warnings;

use XML::LibXML;

#-------------------------------------------------------------------------------
#------------------------------- FUNCTIONS -------------------------------------
#-------------------------------------------------------------------------------
sub new {
	my $class = shift;
	my @args  = @_;

	#Turn args array into a hash.
	my %params = @args;

	my $file  = $params{file};

	my $self = {};

	$class = 'CGL::Annotation';

	bless($self, $class);

	if (defined($file)){
		$self->file($file);
		my $parser = new XML::LibXML();
		my $doc = $parser->parse_file($self->file());

		$self->_load_meta_data($doc);
		$self->_load_features($doc);
		$self->_load_relationships($doc);
		$self->_reverse_relationships();
	}

	my $iterator = new CGL::Annotation::Iterator($self);

	while (my $data = $iterator->next_by_transcript()){
		my $t = $data->[0];
		my $g = $data->[1];

		next unless $self->transcript_is_in_scope($t);

		$t->_add_residues_2();
		my $i = 0;
		while (my $p  = $t->translation($i)){
			$p->_add_residues_2($t);
			$i++;
		}

	}

	return $self;
}
#-------------------------------------------------------------------------------
1;

