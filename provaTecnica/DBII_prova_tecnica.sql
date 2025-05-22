CREATE DATABASE lojaPascotto;

USE lojaPascotto;

CREATE TABLE Produtos (
	idProduto INT AUTO_INCREMENT,
    nome VARCHAR(255),
    preco DECIMAL(10,2),
    quantidadeEstoque INT,
    idFornecedor INT,
    PRIMARY KEY(idProduto)
);

CREATE TABLE Fornecedores(
	idFornecedor INT AUTO_INCREMENT,
    nome VARCHAR(255),
    CNPJ VARCHAR(255),
    telefone VARCHAR(255),
    cpf VARCHAR(255),
    PRIMARY KEY (idFornecedor)
);

CREATE TABLE Colaborador (
	idColaborador INT AUTO_INCREMENT,
    nome VARCHAR(255),
    cargo VARCHAR(255),
    salario DECIMAL(10, 2),
    PRIMARY KEY (idColaborador)
);

CREATE TABLE Pedidos (
	idPedido INT AUTO_INCREMENT,
    data_pedido VARCHAR(255),
    idFuncionario INT,
    idProduto INT,
	quantidade INT,
    PRIMARY KEY (idPedido)
);

ALTER TABLE Produtos
ADD CONSTRAINT fk_Produtos_Fornecedor
FOREIGN KEY (idFornecedor) REFERENCES Fornecedores(idFornecedor);

ALTER TABLE Pedidos
ADD CONSTRAINT fk_Pedidos_Funcionario
FOREIGN KEY (idFuncionario) REFERENCES Colaborador(idColaborador);

ALTER TABLE Pedidos
DROP CONSTRAINT fk_Pedidos_Funcionario;

ALTER TABLE Pedidos
ADD CONSTRAINT fk_Pedidos_Produto
FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto);

INSERT INTO Produtos (nome, preco, quantidadeEstoque, idFornecedor) VALUES
('celular', 1200.00, 3, 1),
('notebook', 2000.00, 2, 2);

INSERT INTO Fornecedores (nome, CNPJ, telefone, cpf) VALUES
('Magazine Luiza', '123456789', '11949946379', '123.213.435.-54'),
('Casas bahia', '123456789', '986862040', '123.456.789-21');

INSERT INTO Colaborador (nome, cargo, salario) VALUES 
('José Davi', 'estoquista', 1200.00),
('Geovanna passos', 'patroa', 10.000);

INSERT INTO Pedidos (data_pedido, idFuncionario, idProduto, quantidade) VALUES
('22-05-2025', 2, 1, 1),
('21-05-2025', 1, 2, 2);

ALTER TABLE Fornecedores
DROP COLUMN cpf;

UPDATE Colaborador
SET salario = 15.000
WHERE idColaborador = 2;

ALTER TABLE Fornecedores
ADD email VARCHAR(255);

UPDATE Fornecedores
SET email = 'magazine123@gmail.com'
WHERE idFornecedor = 1;

UPDATE Fornecedores
SET email = 'casasBahia123@gmail.com'
WHERE idFornecedor = 2;

CREATE TABLE Categorias (
	idCategoria INT AUTO_INCREMENT,
    nomeCategoria VARCHAR(255),
    PRIMARY KEY (idCategoria)
);

INSERT INTO Categorias (nomeCategoria) VALUES
('Dispositivos'),
('Computadores');

ALTER TABLE Produtos
ADD idCategoria INT;

UPDATE Produtos
SET idCategoria = 1
WHERE idProduto = 1;

UPDATE Produtos
SET idCategoria = 2
WHERE idProduto = 2;

ALTER TABLE Produtos
ADD CONSTRAINT fk_Produtos_Categorias
FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria);

SELECT
	Produtos.nome AS PRODUTO,
    Fornecedores.nome AS FORNECEDOR
FROM
	Produtos
INNER JOIN
	Fornecedores
ON
	Produtos.idFornecedor = Fornecedores.idFornecedor;