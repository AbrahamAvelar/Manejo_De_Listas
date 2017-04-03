function i = FindGene( GeneName, ListOfGenes )
% i = FindGene( GeneName, ListOfGenes )
    bandera=1;
    for i=1:length(ListOfGenes)
        if strcmp(GeneName, ListOfGenes(i) );
            bandera=0;
            break
        end
    end
    if bandera
        %warning(strcat('No se encontró el gen: ', GeneName) )
        i=NaN;
    end
end