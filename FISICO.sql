--rollback;
BEGIN;

CREATE TABLE Periodo (
Status_Periodo varchar(10),
Data_Final date,
id_Periodo serial PRIMARY KEY,
Data_Inicio date,
Hora_Inicio time,
Hora_Fim time,
id_Usuario serial
);

CREATE TABLE Torneio (
id_Torneio serial PRIMARY KEY,
Valor_Torneio numeric(5,2),
Nome_Torneio varchar(20),
Status_Torneio varchar(10),
Descricao text,
Qtd_Vagas integer,
Aviso text,
id_Endereco INTEGER,
id_Periodo INTEGER,
id_Categoria INTEGER,
FOREIGN KEY(id_Periodo) REFERENCES Periodo (id_Periodo)
);

CREATE TABLE Evento (
id_Evento serial PRIMARY KEY,
Nome_Evento varchar(20),
Descricao Text,
Valor_Evento numeric(4,2),
Qtd_Vagas integer,
Aviso text,
Restricao varchar(20),
Status_Evento varchar(10),
id_Grupo INTEGER,
id_Categoria INTEGER,
id_Endereco INTEGER,
id_Periodo INTEGER,
FOREIGN KEY(id_Periodo) REFERENCES Periodo (id_Periodo)
);

CREATE TABLE Grupo (
id_Grupo serial PRIMARY KEY,
Nome_Grupo varchar(20),
Aviso text,
Fila_Espera varchar(30),
Status_Grupo varchar(10)
);

CREATE TABLE Categoria (
id_Categoria serial PRIMARY KEY,
Descricao varchar(50)
);

CREATE TABLE Ranking (
id_Ranking serial PRIMARY KEY,
Descricao varchar(40),
Qtd_Ranking integer,
Nota integer,
Tempo time,
Status_Ranking varchar(10),
Tipo varchar(30),
id_Grupo INTEGER,
FOREIGN KEY(id_Grupo) REFERENCES Grupo (id_Grupo)
);

CREATE TABLE Premiacao (
id_Premiacao serial PRIMARY KEY,
Tipo_Premiacao varchar(30),
Custo_Premiacao integer,
Status_Premiacao varchar(10),
Qtd_Premiacao integer,
id_Ranking INTEGER,
id_Caixa INTEGER,
FOREIGN KEY(id_Ranking) REFERENCES Ranking (id_Ranking)
);

CREATE TABLE Banco (
id_Banco serial PRIMARY KEY,
Banco varchar(10),
Agencia integer,
Conta integer,
Operacao integer,
id_Usuario INTEGER
);

CREATE TABLE Caixa (
id_Caixa serial PRIMARY KEY,
Data date,
Status_Caixa varchar(20),
Saldo numeric(5,2),
Entradas numeric(5,2),
Saidas numeric(5,2)
);

CREATE TABLE Pagamento (
id_Pagamento serial PRIMARY KEY,
Valor_Pagamento numeric(5,2),
Mes date,
Nome varchar(20),
Dia date,
Ano date,
Tipo_Pagamento varchar(10),
id_Ranking INTEGER,
FOREIGN KEY(id_Ranking) REFERENCES Ranking (id_Ranking)
);

CREATE TABLE Fidelidade (
id_Fidelidade serial PRIMARY KEY,
Tipo_Fidelidade varchar(20),
Descricao text,
Inicio date,
Fim date,
id_Usuario INTEGER
);

CREATE TABLE Endereco (
id_Endereco serial PRIMARY KEY,
Rua varchar(20),
Bairro varchar(20),
Cidade varchar(20),
UF varchar(2),
CEP varchar(10),
Numero integer,
Complemento varchar(30)
);

CREATE TABLE Contato (
id_Contato serial PRIMARY KEY,
Telefone varchar(30),
Rede_Social varchar(60),
Nome varchar(30),
Celular varchar(20),
Email varchar(30),
Whatsapp varchar(15),
id_Usuario INTEGER,
id_Torneio INTEGER,
id_Evento INTEGER,
FOREIGN KEY(id_Torneio) REFERENCES Torneio (id_Torneio),
FOREIGN KEY(id_Evento) REFERENCES Evento (id_Evento)
);

CREATE TABLE Usuario (
id_Usuario serial PRIMARY KEY,
Senha varchar(20),
Email varchar(30),
Tipo_Sanguineo varchar(3),
Sexo varchar(10),
Genero varchar(10),
Login varchar(20),
cpf varchar(14),
Dt_Nascimento date,
id_Endereco INTEGER,
FOREIGN KEY(id_Endereco) REFERENCES Endereco (id_Endereco)
);

CREATE TABLE UsuPagamento (
id_Usuario INTEGER,
id_Pagamento INTEGER,
FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario),
FOREIGN KEY(id_Pagamento) REFERENCES Pagamento (id_Pagamento)
);

CREATE TABLE PagCaixa (
id_Pagamento INTEGER,
id_Caixa INTEGER,
FOREIGN KEY(id_Pagamento) REFERENCES Pagamento (id_Pagamento),
FOREIGN KEY(id_Caixa) REFERENCES Caixa (id_Caixa)
);

CREATE TABLE PagFidelidade (
id_Pagamento INTEGER,
id_Fidelidade INTEGER,
FOREIGN KEY(id_Pagamento) REFERENCES Pagamento (id_Pagamento),
FOREIGN KEY(id_Fidelidade) REFERENCES Fidelidade (id_Fidelidade)
);

CREATE TABLE UsuRanking (
id_Usuario INTEGER,
id_Ranking INTEGER,
FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario),
FOREIGN KEY(id_Ranking) REFERENCES Ranking (id_Ranking)
);

CREATE TABLE RanTorneio (
id_Ranking INTEGER,
id_Torneio INTEGER,
FOREIGN KEY(id_Ranking) REFERENCES Ranking (id_Ranking),
FOREIGN KEY(id_Torneio) REFERENCES Torneio (id_Torneio)
);

CREATE TABLE UsuTorneio (
id_Usuario INTEGER,
id_Torneio INTEGER,
FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario),
FOREIGN KEY(id_Torneio) REFERENCES Torneio (id_Torneio)
);

CREATE TABLE UsuEvento (
id_Usuario INTEGER,
id_Evento INTEGER,
FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario),
FOREIGN KEY(id_Evento) REFERENCES Evento (id_Evento)
);

CREATE TABLE UsuCategoria (
id_Usuario INTEGER,
id_Categoria INTEGER,
FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario),
FOREIGN KEY(id_Categoria) REFERENCES Categoria (id_Categoria)
);

CREATE TABLE UsuPremiacao (
id_Usuario INTEGER,
id_Premiacao INTEGER,
FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario),
FOREIGN KEY(id_Premiacao) REFERENCES Premiacao (id_Premiacao)
);

ALTER TABLE Periodo ADD FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario);
ALTER TABLE Torneio ADD FOREIGN KEY(id_Endereco) REFERENCES Endereco (id_Endereco);
ALTER TABLE Torneio ADD FOREIGN KEY(id_Categoria) REFERENCES Categoria (id_Categoria);
ALTER TABLE Evento ADD FOREIGN KEY(id_Grupo) REFERENCES Grupo (id_Grupo);
ALTER TABLE Evento ADD FOREIGN KEY(id_Categoria) REFERENCES Categoria (id_Categoria);
ALTER TABLE Evento ADD FOREIGN KEY(id_Endereco) REFERENCES Endereco (id_Endereco);
ALTER TABLE Premiacao ADD FOREIGN KEY(id_Caixa) REFERENCES Caixa (id_Caixa);
ALTER TABLE Banco ADD FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario);
ALTER TABLE Fidelidade ADD FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario);
ALTER TABLE Contato ADD FOREIGN KEY(id_Usuario) REFERENCES Usuario (id_Usuario);

COMMIT;
