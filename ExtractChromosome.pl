use strict;
use warnings;

my $Chromosome = $ARGV[0];
my $Chromosometwo = $ARGV[1];
my $InputMarkers = $ARGV[2];
my $Outputfile = $ARGV[3];

open my $genotypes, $InputMarkers, or die "no pude abrir Genotypes 1K segregants.csv";
my $firstLine = <$genotypes>; 
close $genotypes;

my @cortado = split(",", $firstLine);
my @indexes;
$indexes[0]=0;
my $contador=0;
for my $element (0..$#cortado){
	if ($cortado[$element] =~ /r$Chromosome\./){
		print "$element\n";
		push @indexes, $element;
		$contador++;		
	}
	if ($cortado[$element] =~ /r$Chromosometwo\./){
		print "$element\n";
		push @indexes, $element;
		$contador++;		
	}
}

my @toOutput;
my $element;
open $genotypes, $InputMarkers, or die "no pude abrir $InputMarkers";
open my $OUTfile,'>', $Outputfile, or die "no pude abrir $Outputfile";

 while( my $line = <$genotypes> ){
	my @cortado = split(",", $line);
	for $element (0..$#indexes){
		push @toOutput, $cortado[$indexes[$element]];
		push @toOutput, ",";
		# print $cortado[$indexes[$element]];
		# print "\n";
	}
	pop @toOutput;
	push @toOutput,  "\n";
}

print "\nThere are $contador markers in chromosome $Chromosome and $Chromosometwo";
print $OUTfile  @toOutput;
#print $OUTfile  join (',', @toOutput);
close $genotypes;
close $OUTfile
