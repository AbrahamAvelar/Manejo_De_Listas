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
        %warning(strcat('No se encontr� el gen: ', GeneName) )
        i=NaN;
    end
end