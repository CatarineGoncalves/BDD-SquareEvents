CREATE DATABASE BancoDeDadosEvents;


USE BancoDeDadosEvents;


CREATE TABLE TipoUsuario (
IdTipoUsuario INT PRIMARY KEY IDENTITY NOT NULL,
NomeTipoUsuario VARCHAR(255) NOT NULL unique
);

CREATE TABLE Comunidade (
IdComunidade INT PRIMARY KEY IDENTITY NOT NULL,
IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario),
NomeComunidade VARCHAR (255),
NomeResponsavelComunidade VARCHAR (255) NOT NULL,
ContatoComunidade VARCHAR (255) NOT NULL unique,
)



CREATE TABLE UPLOADTw (
IdUpload INT PRIMARY KEY IDENTITY NOT NULL,
ImgUser VARCHAR (255) ,
ImgEvento VARCHAR (255),
ImgSala VARCHAR (255)
)

SELECT * FROM Usuario
DROP table Usuario

CREATE TABLE Usuario (
IdUsuario INT PRIMARY KEY IDENTITY NOT NULL,
IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario),
Email VARCHAR (255) NOT NULL unique,
Senha VARCHAR (255)NOT NULL,
NomeUser VARCHAR (255)NOT NULL,
StatusUser BIT DEFAULT(0) NOT NULL,
Upload INT FOREIGN KEY REFERENCES UPLOADTw (IdUpload),
);



CREATE TABLE Categoria (
IdCategoria INT PRIMARY KEY IDENTITY NOT NULL,
NomeCategoria VARCHAR (255) NOT NULL,
StatusCategoria BINARY NOT NULL
)



CREATE TABLE Sala (
IdSala INT PRIMARY KEY IDENTITY NOT NULL,
NomeSala VARCHAR (255) NOT NULL,
DescricaoSala VARCHAR (255) NOT NULL
)



CREATE TABLE Padrinho (
IdPadrinho INT PRIMARY KEY IDENTITY NOT NULL,
IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario),
IdEvento INT FOREIGN KEY REFERENCES Evento (IdEvento)
)



CREATE TABLE Evento (
IdEvento INT PRIMARY KEY IDENTITY NOT NULL,
NomeEvento VARCHAR (255) NOT NULL,
DataEvento DATE NOT NULL,
LocalizacaoEvento VARCHAR (255) NOT NULL,
HoraEvento DATETIME NOT NULL,
DescricaoEvento VARCHAR (255) NOT NULL,
IdSala INT FOREIGN KEY REFERENCES Sala (IdSala),
LibrasEvento BINARY NOT NULL,
AlimentacaoEvento BINARY NOT NULL,
RestricaoAlimentacao VARCHAR(255) NOT NULL,
StatusEvento BINARY  NOT NULL,
CondicaoEvento BINARY NOT NULL,
IdUpload INT FOREIGN KEY REFERENCES UPLOADTw (IdUpload),
IdCategoria INT FOREIGN KEY REFERENCES Categoria (IdCategoria) NOT NULL,
IdUsuario INT FOREIGN KEY REFERENCES Usuario  (IdUsuario) NOT NULL,
)



INSERT INTO TipoUsuario (NomeTipoUsuario)
values                  ('Administrador'),
                        ('Funcionário'),
                        ('Comunidade')

INSERT INTO Usuario (IdTipoUsuario,Email,Senha,NomeUser,StatusUser,Upload)
Values              (1,'administrador@thoughtworks.com','adm132','Lucas',1,1),
                    (2,'funcionario@thoughtworks.com','func132','Sérgio',1,1),
                    (3,'comunidade@comunidade.com','fe12345','Fernanda',1,1)


INSERT INTO Comunidade (IdUsuario,NomeComunidade,NomeResponsavelComunidade,ContatoComunidade)
Values                (4,'Reprograma','Fernanda Lima','11940403434')


INSERT INTO UPLOADTw (ImgEvento,ImgSala,ImgUser)
Values               ('./imagens/imgevento','./imagens/imgsala','./imagens/imguser')
		

INSERT INTO Categoria (NomeCategoria,StatusCategoria)
Values                ('Entretenimento',1),
			          ('Tecnologia',1),
			          ('Inclusão',1)

INSERT INTO Sala (NomeSala,DescricaoSala)
Values ('Lounge','Espaço mais descontraído'),
       ('Sala de reunião','Espaço mais formal')

INSERT INTO Padrinho (IdUsuario,IdEvento)
Values (4,2)

INSERT INTO Evento (NomeEvento,DataEvento,LocalizacaoEvento,HoraEvento,DescricaoEvento,IdSala,LibrasEvento,AlimentacaoEvento,RestricaoAlimentacao,StatusEvento,CondicaoEvento,IdUsuario,IdCategoria)
VALUES             ('C#','10/12/19','ThoughWorks sede','19:00','Vai ser muito legal',1,1,1,'Gluten',1,1,4,1)
