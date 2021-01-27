clear all;
close all;
clc;

% Parametros
% porcentagem -> Porcentagem de dados que serão da classe de treino
% path -> Caminho da pasta que contém as subpastas que são as classes
% extensao -> Extensão das imagens
% tipo, tipo de algoritmos para extração de características
%tipo = "SURF";
%tipo = "HOG";
porcentagem = 70;
path = 'D:\Estudos\Eng. de Computação\Processamento Digital de Imagens\Listas\Lista 6\Emoções';
extensao = '.tiff';
tipo = "SIMPLES";

[label_treino, label_teste, dados_treino, dados_teste ....
    img_treino, img_teste, qtd_classes] = funcao(path ,porcentagem, extensao , tipo);

function [label_treino, label_teste, dados_treino, dados_teste ....
    img_treino, img_teste, qtd_classes] = funcao(path, porcentagem, extensao, tipo)
    % Parametros
    %   porcentagem -> Porcentagem de dados que serão da classe de treino
    %   path -> Caminho da pasta que contém as subpastas que são as classes
    %   extensao -> Extensão das imagens
    % Retornos
    %   label_treino -> Vetor auxiliar com as labels (classes) da parte da
    %   parte do banco que será usada como treino
    %   label_teste -> Vetor auxiliar com as labels (classes) da parte da
    %   parte do banco que será usada como teste
    %   dados_treino -> Dados que serão usados como treino da PCA
    %   dados_teste -> Dados que serão usados como teste da PCA
    %   qtd_classes -> Quantidade de classes do banco de dados
    
    % Para mostrar uma imagem certa e uma imagem errada
    aux = 0;
    aux1 = 0;
   
    [label_treino, label_teste, dados_treino, dados_teste ....
        img_treino, img_teste, qtd_classes] = lerImgs(porcentagem, path, extensao, tipo);
    
    % Qunatidade de amostras de teste
    tam = size(dados_teste, 2);
    qtd_dados = tam;
    
    % Gera a PCA
    [P PC mn] = GerarPCs(dados_treino);
    
    % Vetores que contém a quantidade de acertos e erros por cada classe
    acertos = zeros(qtd_classes,1)';
    erros = zeros(qtd_classes,1)'; 

    acertos = zeros(qtd_classes, 1);
    erros = zeros(qtd_classes, 1);
    
    % Converte as categorias para números para ser possível contá a
    % quantidade de erros e acertos
    c = grp2idx(categorical(label_treino));
    
    for i = 1: tam
        
        % Gera a amostra
        amostra = ProjetarAmostra(dados_teste(:, i),mn,P);
        d = round(Classificar(PC,amostra));
        
        indice_amostra = c(d);
        
        if isequal(label_teste(i), label_treino(d))
            acertos(indice_amostra) = acertos(indice_amostra) + 1;
            if(aux == 0)
               figure;
               if (strcat(path,'\',label_teste(i),'\',img_teste(i)) == ....
               strcat(path,'\',label_treino(d), '\',img_treino(d)))
                    disp('asd')
               end
               pred = imread(strcat(path,'\',label_teste(i),'\',img_teste(i)));
               real = imread(strcat(path,'\',label_treino(d), '\',img_treino(d)));
               imshowpair(pred, real, 'montage');
               title(strcat('Classe Predita: [',label_teste(i), ....
                   '] Classe Real: ','[',label_treino(d),']'));
               aux = aux + 1;
            end
        else
            erros(indice_amostra) = erros(indice_amostra) + 1;
            if(aux1 == 0)
               figure;
               if (strcat(path,'\',label_teste(i),'\',img_teste(i)) == ....
               strcat(path,'\',label_treino(d), '\',img_treino(d)))
                    disp('asd')
               end
               pred = imread(strcat(path,'\',label_teste(i),'\',img_teste(i)));
               real = imread(strcat(path,'\',label_treino(d), '\',img_treino(d)));
               imshowpair(pred, real, 'montage');
               title(strcat('Classe Predita: [',label_teste(i), ....
                   '] Classe Real: ','[',label_treino(d),']'));
               aux1 = aux1 + 1;
            end
            
        end
    end
    
    qtd_acerto = sum(acertos);
    qtd_erro = sum(erros);

    media_acerto = (100 * qtd_acerto) / qtd_dados;
    media_erro = (100 * qtd_erro) / qtd_dados;
    
    % Converte as labels para categorias
    labels = categorical(unique(label_treino));
    
    % ---- Plots -----
    % Grafico de barras de porcentagem de acertos e erros
    figure;
    bar(labels, [acertos erros]/(tam/qtd_classes)*100);
    legend('Acertos', 'Erros');
    title(strcat('Porcentagem de Acertos e Erros por classe, Amostra N=',num2str(tam)));
    xlabel('Classe');
    ylabel('Porcentagem de Acertos');
    
    % Grafico de barras de quantidade de acertos e erros
    figure;
    bar(labels, [acertos erros]);
    legend('Acertos', 'Erros');
    title(strcat('Quantidade de Acertos e Erros por classe, Amostra N=',num2str(tam)));
    xlabel('Classe');
    ylabel('Porcentagem de Acertos');
    
    % Grafico de piza de porcentagem da amostra de acertos e erros
    figure;
    labels = {'Amostra', 'Acertos', 'Erros'};
    pie([tam, qtd_acerto, qtd_erro]);
    title(strcat('Proporção treino, acertos e erros, Amostra N=',num2str(tam)));
    legend(labels);
    
    % Quantidade de acerto e erro geral e média de erro e acerto geral
    fprintf('\nQuantidade de Acertos: %i\nPorcentagem de Acertos: %.2f\n', qtd_acerto, media_acerto);
    fprintf('\nQuantidade de Erros: %i\nPorcentagem de Erros: %.2f\n', qtd_erro, media_erro);
    close all;
end