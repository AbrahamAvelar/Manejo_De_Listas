function [Indices] = FindGeneList( ListOfGenes1 , ListOfGenes2 )
% Indices = FindGeneList( ListOfGenes1, ListOfGenes2 )
    for i=1:length(ListOfGenes1)    
        i/length(ListOfGenes1)
        GeneName = ListOfGenes1(i);
        x = FindGene( GeneName, ListOfGenes2);
        Indices(i) = x;
    end
end