package CGL::GFF::Parser;

use strict;
use vars qw(@ISA $VERSION);


$VERSION = '0.01';
@ISA = qw/CGL::GFF/;

=head1 NAME

CGL::GFF::Parser - <One line description of module's purpose here>

=head1 VERSION

This document describes CGL::GFF::Parser version 0.01

=head1 SYNOPSIS

     use CGL::GFF::Parser;

=for author to fill in:
     Brief code example(s) here showing commonest usage(s).
     This section will be as far as many users bother reading
     so make it as educational and exemplary as possible.

=head1 DESCRIPTION

=for author to fill in:
     Write a full description of the module and its features here.
     Use subsections (=head2, =head3) as appropriate.

=head1 METHODS

=head2
 Title   : new 
 Usage   : CGL::GFF::Parser->new();
 Function: Creates a Parser object;
 Returns : A Parser object
 Args    : 
=cut

sub new {
    my ($class, $args) = @_;
    my $self = $args || {};
    bless $self, $class;
}

my $features = parse_files($files);
my $group_map = map_groups($features);
remap_groups($group_map, $features);
my $id_type_map = map_id_type($features);
my $parent_type_map = map_parent_type($features, $id_type_map);
my $tree = build_tree($features, $parent_type_map);

sub parse_files {
	my $files = shift;
	my %features;
	for my $file (@{$files}) {
		
		open (my $IN, '<', $file) 
		    or die "Can't open $file for reading\n";
		
		#Parse each line of GFF
		while (<$IN>) { ### Pasrsing $file|===[%]    |
			
			last if /^\#\#FASTA/; #Skip sequence lines at the end.
			next if /^[\#\s]/; #Skip comment lines.
			chomp;
			
			my $feature = parse_gff_line($_);
			next if ! defined $feature;
			push @{$features{$feature->{Source}}}, $feature;
		}
	}
	return \%features;
}
#-----------------------------------------------------------------------------
sub parse_gff_line {
	my $line = shift;

	#Split the line.
	my ($seq_id, $source, $type, $start, $end, $score, 
	    $strand, $phase, $attribute_field) 
	    = split /\t/, $line;

	return undef unless this_type_is_wanted($type);
	
	#Skip lines that have needed feilds undef or eq '.'
	return if grep {! defined $_} ($seq_id, $source, 
				       $type, $attribute_field);
	return if grep {$_ eq '.'}    ($seq_id, $type, $attribute_field);
	
	#Process the attributes field.
	my $attributes = parse_attributes($attribute_field);
	
	my $feature = {SeqID    => $seq_id,
		       Source   => $source,
		       Type     => $type,
		       #Don't need these feilds for this script.
		       #Start    => $start,
		       #End      => $end,
		       #Score    => $score,
		       #Strand   => $strand,
		       #Phase    => $phase,
		       Attribute => $attributes};

	return $feature;
}
#-----------------------------------------------------------------------------
sub this_type_is_wanted {
	my $type = shift;
	
	my @wanted_types = qw(gene mRNA CDS);

	if (grep {$type eq $_} @wanted_types) {
		return 1;
	}
	return undef;
}
#-----------------------------------------------------------------------------
sub parse_attributes {
        my $attribute_field = shift;
        my ($id, $parent, $group);

        my $id_regex     = qr/ID\s+(\S+)/;
        my $parent_regex = qr/FlyBase:(\S+)/;
	my $group_regex  = qr/group\s+(\S+)/;

        ($id)     = $attribute_field =~ $id_regex;
        ($parent) = $attribute_field =~ $parent_regex;
        ($group)  = $attribute_field =~ $group_regex;

	$id     =~ s/[\"\s]//g if $id;
	$parent =~ s/[\"\s]//g if $parent;
	$group  =~ s/[\"\s]//g if $group;

        my $parents = [];
	if ($parent) {
		@{$parents} = split /,/, $parent;
	}
        my $attributes = {ID     => [$id],
                          Parent => $parents,
			  Group  => [$group]};
		
        return $attributes;
}
#-----------------------------------------------------------------------------
sub map_groups {
	my $features = shift;
	my %group_map;
	for my $source (keys %{$features}) {
		#Loop over all features.
		for my $feature (@{$features->{$source}}) {
			my $group  = $feature->{Attribute}{Group}[0];
			my $id     = $feature->{Attribute}{ID}[0];
			my $parent = $feature->{Attribute}{Parent}[0];
			next if ! defined $group;
			#Fill the %group_map hash as a 
			#lookup index for later.
			if ($id || $parent) {
				$group_map{$group}{ID}     ||= [$id];
				$group_map{$group}{Parent} ||= [$parent];
			}
		}
	}
	return \%group_map;
}
#-----------------------------------------------------------------------------
sub remap_groups {
	my ($group_map, $features) = @_;
	for my $source (keys %{$features}) {
		#Loop over all features.
		for my $feature (@{$features->{$source}}) {
			my $group  = $feature->{Attribute}{Group}[0];
			my $id     = $feature->{Attribute}{ID}[0];
			my $parent = $feature->{Attribute}{Parent}[0];
			next if ! defined $group;
			$feature->{Attribute}{ID}[0]     ||= 
			    $group_map->{$group}{ID}[0];
			$feature->{Attribute}{Parent}[0] ||=
			    $group_map->{$group}{Parent}[0];
			print '';
		}
	}
}
#-----------------------------------------------------------------------------
sub map_id_type {
	my $features = shift;
	my %id_type_map;
	for my $source (keys %{$features}) { ### Mapping===[%]     done
		#Loop over all features.
		for my $feature (@{$features->{$source}}) {
			#Fill the %id_type_map hash as a 
			#lookup index for loop below.
			if ($feature->{Attribute}{ID}[0]) {
				my $first_and_only_ID = 
				    $feature->{Attribute}{ID}[0];
				$id_type_map{$first_and_only_ID} = 
				    $feature->{Type};
			}
		}
	}
	return \%id_type_map;
}
#-----------------------------------------------------------------------------
#Map parent type for every type that has a parent so we can lookup parent 
#type by my type.
sub map_parent_type {
	my ($features, $id_type_map) = @_;
	my %parent_type_map;
	for my $source (keys %{$features}) { ### Mapping===[%]     done
		#Loop over all features.
		for my $feature (@{$features->{$source}}) {
			#Get parent type...
			my $parent_type = get_parent_type($feature,
							  $id_type_map);
			next if ! defined $parent_type;
			#...and map it to the hash (i.e. my source, my 
			#type => my parent's type.
			$parent_type_map{$source}{$feature->{Type}} 
			= $parent_type;
		}
	}
	return \%parent_type_map;
}
#-----------------------------------------------------------------------------
sub get_parent_type {
	my ($feature, $id_type_map) = @_;
	#If this feature actually has a parent...
	if ($feature->{Attribute}{Parent}[0]) {
		#...return it's type...
		return $id_type_map->{$feature->{Attribute}{Parent}[0]}
	}
	return undef;
}
#-----------------------------------------------------------------------------
sub build_tree {
	my ($features, $parent_type_map) = @_;
	my %tree;
	#Loop over all features and map their geneology to a family tree
	for my $source (keys %{$features}) { 
		### Building Trees===[%]     done
		for my $feature (@{$features->{$source}}) {
			#Get the current type and initialize a type 
			#storage container.
			my $type_storage = $feature->{Type};
			my $current_type = $feature->{Type};
			my $parent_type;
			#Recursively look up parent type until we reach the 
			#base, and add each parent type to a growing string 
			#which holds the geneology of this type. 
			#(i.e. gene::mRNA::exon).
			while ($parent_type  =
			       $parent_type_map->{$source}{$current_type}) {
				#Some gff files have features that are their 
				#own parents.  Run away! Infinte loop!
				last if 
				    $parent_type eq $current_type;
				#If the current type has a parent - add it to
				#the geneology else end.
				if ($parent_type) {
					#Add to geneology
					$type_storage = $parent_type . 
					    "::$type_storage";
					#Reset current type for next recurse.
					$current_type = $parent_type;
				}
				else {
					$current_type = undef;
				}
			}
			#Tidy up the geneology...
			$type_storage =~ s/::$//;
			#And hash it for uniqueness.
			$tree{$source}{$type_storage} ++;
		}
	}
	return \%tree;
}
#-----------------------------------------------------------------------------
sub print_tree {
	my $tree = shift;

	#For every feature type print it...
	for my $source (sort keys %{$tree}) {
		print "$source (";
		#Print the source and it's members
		print scalar (keys %{$tree->{$source}}) . "):\n";
		print "-" x 80 . "\n";
		#For each leaf in the geneology
		for my $tree_leaf (sort keys %{$tree->{$source}}) {
			#Split the nodes...
			my @nodes = split /::/, $tree_leaf;
			#...pick the leaf...
			my $leaf = pop @nodes;
			#...space the branches...
			for (1 .. scalar @nodes - 1) {
				print "\t";
			}
			#...print the branches and leaf...
			print "  |_____" if scalar @nodes >= 1;
			print "$leaf (";
			#...and print the count of that leaf type.
			print $tree->{$source}{$tree_leaf} . "):\n";
		}
		print "\n\n";
	}
}
#-----------------------------------------------------------------------------
sub print_table {
	my $tree = shift;

	#For every feature type print it...
	for my $source (sort keys %{$tree}) {
		#For each leaf in the geneology
		for my $leaf (sort keys %{$tree->{$source}}) {
			print "${source}::${leaf}\t";
			#...and print the count of that leaf type.
			print $tree->{$source}{$leaf} . "\n";
		}
	}
}
#-----------------------------------------------------------------------------


=head1 DIAGNOSTICS

=for author to fill in:
     List every single error and warning message that the module can
     generate (even the ones that will "never happen"), with a full
     explanation of each problem, one or more likely causes, and any
     suggested remedies.

=over

=item C<< Error message here, perhaps with %s placeholders >>

[Description of error here]

=item C<< Another error message here >>

[Description of error here]

[Et cetera, et cetera]

=back

=head1 CONFIGURATION AND ENVIRONMENT

<CGL::GFF::Parser> requires no configuration files or environment variables.

=head1 DEPENDENCIES

None.

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to:
barry.moore@genetics.utah.edu

=head1 AUTHOR

Barry Moore <barry.moore@genetics.utah.edu>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2006, Barry Moore <barry.moore@genetics.utah.edu>.  All rights reserved.

    This module is free software; you can redistribute it and/or
    modify it under the same terms as Perl itself.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

1;
