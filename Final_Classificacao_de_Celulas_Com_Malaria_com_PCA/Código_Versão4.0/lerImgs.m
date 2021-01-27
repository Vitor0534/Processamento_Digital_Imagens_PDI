function [label_treino, label_teste, dados_treino, dados_teste ....
    img_treino, img_teste, qtd_classes] = lerImgs(porcentagem, path, extensao, tipo)
    % Parametros
    %   porcentagem -> Porcentagem de dados que serão da classe de treino
    %   path -> Caminho da pasta que contém as subpastas que são as classes
    %   extensao -> Extensão das imagens
    %   Tipo -> Indica o tipo de operação que será empregada nas imagens
    % Retornos
    %   label_treino -> Vetor auxiliar com as labels (classes) da parte da
    %   parte do banco que será usada como treino
    %   label_teste -> Vetor auxiliar com as labels (classes) da parte da
    %   parte do banco que será usada como teste
    %   dados_treino -> Dados que serão usados como treino da PCA
    %   dados_teste -> Dados que serão usados como teste da PCA
    %   qtd_classes -> Quantidade de classes do banco de dados
    
    dados_treino = [];
    dados_teste = [];
    label_treino = [];
    label_teste = [];
    img_treino = [];
    img_teste = [];
    
    % Acessa as pastas
    S = dir(fullfile(path));
    
    % Percore cada pasta que contém as classes
    qtd_classes  = numel(S) - 2;
    for pasta = 3:numel(S)
        % Concatena as strings para formar o nome de cada pasta
        pasta_classe = S(pasta).name;
        caminho = strcat(S(pasta).folder,'\', pasta_classe,'\');
        classe = dir(fullfile(caminho,strcat('*',extensao)));
        
        % Quantidade treino e teste
        qtd_dados = (size(classe, 1));
        
        % Separa a porcentagem de treino
        qtd_treino = round((qtd_dados * porcentagem) / 100);
        i = 1;
        for i = 1: qtd_treino
            
            
            w = fullfile(caminho,classe(i).name);
            x = imread(w);
            
            
            % Faz o Surf
            if (tipo == "SURF")
                y = SURF(x);
                
            end
            
%             % Faz o HOG
            if (tipo == "HOG")
                y = HOG(x);
            end
            
            if (tipo == "SIMPLES")
                y = SIMPLES(x);
            end
            
            if (tipo == "PDI")
                y = PDI(x);
            end
            
            
            
            %y = reshape(x,[size(x,1)*size(x,2),1]);
            dados_treino = [dados_treino, y];
            label_treino = [label_treino, string(pasta_classe)];
            img_treino = [img_treino, string(classe(i).name)];
        end
        % Separa a porcentagem de teste
        for j = i+1: qtd_dados
            w = fullfile(caminho,classe(j).name);
            x = imread(w);
            

            % Faz o Surf
            if (tipo == "SURF")
                y = SURF(x);
            end
            
%             % Faz o HOG
            if (tipo == "HOG")
                y = HOG(x);
            end
            
            if (tipo == "SIMPLES")
                y = SIMPLES(x);
            end
            
            if (tipo == "PDI")
                y = PDI(x);
            end
            
            dados_teste = [dados_teste, y];
            label_teste = [label_teste, string(pasta_classe)];
            img_teste = [img_teste, string(classe(j).name)];
        end
    end
end

% SURF
function [y] =  SURF(x)
%x = rgb2gray(x);
     %x = imresize(x, [100 100]);
    points = detectSURFFeatures(x);
    teste2 = points.selectStrongest(25);
    teste2 = extractFeatures(x,teste2);
    y = gpuArray(reshape(teste2,[size(teste2,1)*size(teste2,2),1])); 
end

% HOG
function [y] =  HOG(x)
    [y,~] = extractHOGFeatures(x);
     y=y';
end

function [y] =  SIMPLES(x)
    x = rgb2gray(x);
    x = imresize(x, [100 100]);
    y = (reshape(x,[size(x,1)*size(x,2),1]));
end