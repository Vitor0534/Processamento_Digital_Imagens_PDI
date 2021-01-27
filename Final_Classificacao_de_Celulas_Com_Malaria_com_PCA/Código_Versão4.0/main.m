% clear all;
% close all;
% clc;
% %% --
% % Parametros
% % porcentagem -> Porcentagem de dados que serão da classe de treino
% % path -> Caminho da pasta que contém as subpastas que são as classes
% % extensao -> Extensão das imagens
% % tipo, tipo de algoritmos para extração de características
% % tipo = "SIMPLES" -> Emprega apenas o PCA;
% % tipo = "PDI" -> Aplica a técnica de pré-processamento no conjunto de dados 
% % para a proposta de técnica de PDI 2
% 
% porcentagem = 70;
% path = 'D:\Estudos\Eng. de Computação\Processamento Digital de Imagens\PCA e Classificação\Imagens_Separadas';
% extensao = '.png';
% tipo = 'PDI';
% 
% [label_treino, label_teste, dados_treino, dados_teste ....
%     img_treino, img_teste, qtd_classes, P, PC, mn, img_e, img_a] ....
% = funcao(path ,porcentagem, extensao , tipo);
% 
% %%
% % %% --
% % Realiza testes 'online'
%  i = 1;
% while(i)
%     disp('Informe se a imagem está no conjunto de treino ou de teste');
%     temp = input('[1] Para treino\n[2] Para teste\nQualquer outra tecla para sair\nOpção: ');
%     
%     if temp == 1
%         n = size(img_treino);
%     else
%         if temp == 2
%             n = size(img_teste);
%         else
%             disp('Saindo...');
%             break;
%         end
%     end
%     
%     % Garante a opção escolhida
%     if temp == 1 || temp == 2
%         % Pega o valor no indice do vetor para capturar a imagem
%         val = input(strcat('Informe um valor de [', num2str(n),']: '));
%         
%         % Determina a classe e pega a imagem
%         if temp == 1
%             classe = label_treino(val);
%             image = img_treino(val);
%         else
%             classe = label_teste(val);
%             image = img_teste(val);
%         end
%         
%         % Cria o caminho da imagem
%         caminho = strcat(path,'\', classe, '\', image);
%         caminho = caminho{1};
%         
%         x = imread(caminho);
% 
%         x = PDI(x);
%         
%         d = Classificar(PC, ProjetarAmostra(x,mn,P));
%         
%         
%         % Cria o caminho da imagem correspondente no conjunto de treino
%         caminho_treino = strcat(path,'\', label_treino(d), '\', img_treino(d));
%         caminho_treino = caminho_treino{1};
%         
%         figure;
%         
%         imshowpair(imread(caminho), imread(caminho_treino),'montage');
%         title(strcat('Classe Real: ','[',classe,']', ....
%                    ' Classe Predita: [',label_treino(d), ']'));
%                
%         if isequal(label_treino(d), classe)
%            disp('Acertou Miseravel');
%            disp(' ');
%         else
%            disp('Errou');
%            disp(' ');
%         end
%         clear x; 
%         clear d;
%     end
%     
% end
% 
% function [label_treino, label_teste, dados_treino, dados_teste ....
%    img_treino, img_teste, qtd_classes, P, PC, mn, img_e, img_a] ....
%    = funcao(path, porcentagem, extensao, tipo)
%     % Parametros
%     %   porcentagem -> Porcentagem de dados que serão da classe de treino
%     %   path -> Caminho da pasta que contém as subpastas que são as classes
%     %   extensao -> Extensão das imagens
%     % Retornos
%     %   label_treino -> Vetor auxiliar com as labels (classes) da parte da
%     %   parte do banco que será usada como treino
%     %   label_teste -> Vetor auxiliar com as labels (classes) da parte da
%     %   parte do banco que será usada como teste
%     %   dados_treino -> Dados que serão usados como treino da PCA
%     %   dados_teste -> Dados que serão usados como teste da PCA
%     %   qtd_classes -> Quantidade de classes do banco de dados
%     
%     % Para mostrar uma imagem certa e uma imagem errada
%     aux = 0;
%     aux1 = 0;
%     
%     img_a = [];
%     img_e = [];
%    
%     [label_treino, label_teste, dados_treino, dados_teste ....
%         img_treino, img_teste, qtd_classes] = lerImgs(porcentagem, path, extensao, tipo);
% 
%     %% --
%     % Qunatidade de amostras de teste
%     tam = size(dados_teste, 2)
%     qtd_dados = tam;
%     
%     % Gera a PCA
%     [P PC mn] = GerarPCs(dados_treino);
%     
%     % Vetores que contém a quantidade de acertos e erros por cada classe
%     acertos = zeros(qtd_classes, 1);
%     erros = zeros(qtd_classes, 1);
%     
%     % Converte as categorias para números para ser possível contar a
%     % quantidade de erros e acertos
%     
%     %%--   
%     c = grp2idx(categorical(label_treino));
%  
%     for i = 1: tam
%         
%         % Gera a amostra
%         amostra = ProjetarAmostra(dados_teste(:, i),mn,P);
%         d = Classificar(PC,amostra);
%         
%         indice_amostra = c(d);
%         
%         if isequal(label_teste(i), label_treino(d))
%             
%             acertos(indice_amostra) = acertos(indice_amostra) + 1;
%             if(aux == 0)
%                figure;
%                c1 = strcat(path,'\',label_teste(i),'\',img_teste(i));
%                c2 = strcat(path,'\',label_treino(d), '\',img_treino(d));
%                
%                real = imread(c1{1});
%                pred = imread(c2{1});
%                imshowpair(real, pred, 'montage');
%                title( strcat('Classe Real: ','[',label_teste(i),']', ....
%                        ' Classe Predita: [',label_treino(d), ']'));
%                    
%                aux = aux + 1;
%             end
%         else
%             erros(indice_amostra) = erros(indice_amostra) + 1;
%             c1 = strcat(path,'\',label_teste(i),'\',img_teste(i));
%             c2 = strcat(path,'\',label_treino(d), '\',img_treino(d));
%             if(aux1 == 0)
%                f = figure;
%               
%                real = imread(c1{1});
%                pred = imread(c2{1});
%                imshowpair(real, pred, 'montage');
%                title( strcat('Classe Real: ','[',label_teste(i),']', ....
%                        ' Classe Predita: [',label_treino(d), ']'));
%                aux1 = aux1 + 1;
%             end
%             c1 = strcat('\',label_teste(i),'\',img_teste(i));
%             c2 = strcat('\',label_treino(d), '\',img_treino(d));
%             img_e = [img_e, c1];
%             img_a = [img_a, c2];
%         end
%         clear d;
%     end
%     
%     qtd_acerto = sum(acertos);
%     qtd_erro = sum(erros);
% 
%     media_acerto = (100 * qtd_acerto) / qtd_dados;
%     media_erro = (100 * qtd_erro) / qtd_dados;
%     
%     % Converte as labels para categorias
%     labels = categorical(unique(label_treino));
%     
%     % ---- Plots -----
%     % Grafico de barras de porcentagem de acertos e erros
%     figure;
% 
%     bar(labels, ([acertos]./(tam/2))*100);
%     title(strcat('Porcentagem de Acertos e Erros por classe, Amostra N=',num2str(tam)));
%     xlabel('Classe');
%     ylabel('Porcentagem de Acertos');
%    
%     % Grafico de piza de porcentagem da amostra de acertos e erros
%     figure;
%     labels = {'Acertos', 'Erros'};
%     pie([qtd_acerto, qtd_erro]);
%     title(strcat('Proporção acertos e erros, Amostra N=',num2str(tam)));
%     legend(labels);
%     
%     % Quantidade de acerto e erro geral e porcentagem de erro e acerto geral
%     fprintf('\nQuantidade de Acertos: %i\nPorcentagem de Acertos: %.2f\n', qtd_acerto, media_acerto);
%     fprintf('\nQuantidade de Erros: %i\nPorcentagem de Erros: %.2f\n', qtd_erro, media_erro);
%     
%     % Quantidade de acerto e erro por classe
%     % Infectada
%     fprintf('\n --- Classe: Infectada ---');
%     fprintf('\nQuantidade de Acertos: %i\nPorcentagem de Acertos: %.2f\n', acertos(1), acertos(1)/(tam/2)*100);
% 
%     fprintf('\n --- Classe: Não Infectada ---');
%     fprintf('\nQuantidade de Acertos: %i\nPorcentagem de Acertos: %.2f\n\n', acertos(2), acertos(2)/(tam/2)*100);
% end