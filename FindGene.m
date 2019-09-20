function resultado = FindGene( GeneName, ListOfGenes, multiple )
% i = FindGene( GeneName, ListOfGenes, multiple )
if nargin<3
    multiple=0;
end
    bandera=1;
    resultado=[];
    for i=1:length(ListOfGenes)
        if strcmp(GeneName, ListOfGenes(i) );
            bandera=0;
            if multiple
                resultado=[resultado i];
            else
                resultado=i;
                break
            end
        end
    end
    if bandera
        %warning(strcat('No se encontró el gen: ', GeneName) )
        resultado=NaN;
    end
end
