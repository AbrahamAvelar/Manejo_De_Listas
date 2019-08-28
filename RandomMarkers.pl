use strict;
use warnings;
#system("awk -v min=2 -v max=52467 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'");
# head -n5 Genotypes\ 1K\ segregants.csv | cut -d "," -f52467
my $NoOfMarkers = $ARGV[0];
my $Outputfile = $ARGV[1];
my $Inputfile = $ARGV[2];

my @RN;
my @toOutput;
$RN[0]=0;
$RN[1]=1;
for (my $i=2; $i<$NoOfMarkers+2; $i++){
	$RN[$i]= int rand(52466)+2;
}
my @sortedRN = sort {$a <=> $b} @RN;

my %seen = ();
my @uniqRN;
foreach my $item (@sortedRN) {
    push(@uniqRN, $item) unless $seen{$item}++;
}
#print join ("\n", @uniqRN);

open my $info, $Inputfile, or die "no pude abrir Genotypes 1K segregants.csv";
open my $OUTfile, '>', $Outputfile, or die "no pude abrir $Outputfile";
 while( my $line = <$info> ){
 	#print $line;
	my @cortado = split(",", $line);
	for my $element (0..$#uniqRN){
		push @toOutput, $cortado[$uniqRN[$element]];
		push @toOutput, ",";
		#print $uniqRN[$element];
		#print "\n";
	}
	pop @toOutput;
	push @toOutput,  "\n";
}
#print @toOutput;

print $OUTfile  @toOutput;
#print $OUTfile  join (',', @toOutput);
close $info;
close $OUTfile
