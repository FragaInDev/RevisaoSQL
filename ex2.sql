USE revisao

CREATE TABLE carro(
placa		CHAR(7)		NOT NULL,
marca		VARCHAR(30)	NOT NULL,
modelo		VARCHAR(30)	NOT NULL,
cor			VARCHAR(30)	NOT NULL,
ano			INT			NOT NULL

PRIMARY KEY (placa)
)
go
CREATE TABLE peca(
codigo		INT				NOT NULL,
nome		VARCHAR(60)		NOT NULL,
valor		INT				NOT NULL

PRIMARY KEY (codigo)
)
go
CREATE TABLE cliente(
nome			VARCHAR(255)		NOT NULL,
logradouro		VARCHAR(255)		NOT NULL,
numero			INT					NOT NULL,
bairro			VARCHAR(255)		NOT NULL,
telefone		CHAR(9)				NOT NULL,
carro			CHAR(7)				NOT NULL

PRIMARY KEY(carro)
FOREIGN KEY(carro) REFERENCES carro(placa)
)
go
CREATE TABLE servico(
carro			CHAR(7)			NOT NULL,
peca			INT				NOT NULL,
quantidade		INT				NOT NULL,
valor			INT				NOT NULL,
data			Date			NOT NULL

PRIMARY KEY(carro, peca)
	FOREIGN KEY(carro) REFERENCES carro(placa),
	FOREIGN KEY(peca) REFERENCES peca(codigo)
)


/*Telefone do dono do carro Ka, Azul*/
SELECT cl.telefone
FROM cliente cl, carro c
WHERE cl.carro = c.placa
AND c.modelo IN (
	SELECT c.modelo
	FROM carro c
	WHERE c.modelo = 'Ka'
		AND c.cor = 'Azul'
)

/*Endereço concatenado do cliente que fez o serviço do dia 02/08/2009
R: Essa aqui n vai ter nd
*/

/*Placas dos carros de anos anteriores a 2001*/
SELECT placa
FROM carro
WHERE ano < 2001

/*Marca, modelo e cor, concatenado dos carros posteriores a 2005*/
SELECT marca+' '+modelo+' '+cor AS Carro
FROM carro
WHERE ano > 2005

/*Código e nome das peças que custam menos de R$80,00*/
SELECT codigo, nome
FROM peca
WHERE valor < 80