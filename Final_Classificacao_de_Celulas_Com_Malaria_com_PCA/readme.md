## Principal Component Analysis - Classificação d células de malária

# Português
Este trabalho foi desenvolvido em conjunto com:
	- Vitor de Almeida Silva (github: https://github.com/Vitor0534)
	- Higor Alves Ferreira
	
O projeto tinha como objetivo classificar as células de malária da base de dados: Malaria Cell Images Dataset.
Para tanto, foram empregadas técnicas de processamento digital de imagens (PDI) na base de dados. Depois as imagens processadas eram utilizadas como entrada do classificador (PCA) e a acurácia do teste era verificada.
Download da base de dados:
	- https://www.kaggle.com/iarunava/cell-images-for-detecting-malaria

Para executar o código faça o download da base de dados extraia as imagens em uma pasta denominada "Imagens_Separadas". 
Dentro da pasta "Imagens_Separadas" exisitiram as pastas das classes "Parasitized" e "Uninfected". O código pega o nome das pastas para nomear as classes.
Desta forma, o dirétorio ficará assim definido:
	- Códigos do projeto
	- Imagens_Separadas
		- Parasitized
		- Uninfected
		
Também é necessário modificar a variavel path (linha 15 arquivo main.m) para o diretório atual do projeto.

Para mais informções leia o PDF presente na pasta "Relatorio".



# Inglês
This work was developed in conjunction with:
- Vitor de Almeida Silva (github: https://github.com/Vitor0534)
- Higor Alves Ferreira

The project aimed to classify as malaria cells of the database: Malaria Cell Images Dataset.
For that, digital image processing (PDI) techniques were used in the database. Then the processed images were used as input for the classifier (PCA) and the accuracy of the test was verified.
Download the database:
- https://www.kaggle.com/iarunava/cell-images-for-detecting-malaria

To execute the code download the database extract the images in a folder named "Imagens_Separadas".
Within the folder "Imagens_Separadas" there were the folders of the classes "Parasitized" and "Uninfected". The code takes the name of the folders to name the classes.
In this way, the directory will be defined as follows:
- Project codes
- Separate Images
	- Parasitized
	- Uninfected

It is also necessary to modify the variable path (line 15 file main.m) for the current project directory.

For more information, read the PDF in the "Report" folder.
