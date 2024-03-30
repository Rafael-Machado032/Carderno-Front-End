--MySQL
--DDL Data Definition Language (Linguagem de Definição de dados)
/*Criar Banco de Dados*/
/*Para criar um banco de dados seleciona "Query/New Tab to Current Serve"*/
CREATE SCHEMA estudoSQL;
/*ou*/
CREATE DATABASE estudoSQL;
/*Os dois comandos são o mesmo*/

-------------------------------------------------------------------------------------------------------------
/*Para criar uma tabela*/

CREATE TABLE cliente (
    / / cliente é o nome da tabela i_cliente_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT, / / (tipo de dado) _ (nome do campo) _ (nome da tabela) s_nome_cliente VARCHAR(50) NOT NILL, s_cpf_cliente CHAR(11) NOT NULL, d_nasc_cliente DATETIME
);

/*
PRIMARY KEY       Chave primaria
NOT NULL          Não pode ser nulo obs: Caso for chave primaria não precisa declarar NOT NULL pois e obrigatória o preenchimento
AUTO_INCREMENT    Banco de dados que vai administrar com o valor definido automaticamente
INT               Inteiro
VARCHAR(n)        O VARCHAR tem tamanho dinâmico ou seja ocupa até o limite n se não usar desocupa para outro campo 
CHAR(n)           O CHAR tem tamanho fixo ou seja ocupa n espaço mesmo que não esteja usando
*/

-------------------------------------------------------------------------------------------------------------
/*Deletar o banco de dados*/

DROP SCHEMA cursos;

/*Deletar tabela*/

DROP TABLE cliente
-------------------------------------------------------------------------------------------------------------
/*Alterar tabela*/

ALTER TABLE cliente
MODIFY COLUMN s_nome_cliente VARCHAR(30) NOT NULL;
-- Altera de 50 para 30 e não vazio

-------------------------------------------------------------------------------------------------------------
/*Adicionar coluna*/

ALTER TABLE cliente ADD i_tipo_cliente INT DEFAULT 1;

Adiciona uma coluna com o valor padra 1
/*Excluir coluna*/

ALTER TABLE cliente DROP i_tipo_cliente;

/*Para comentário SQL*/

-------------------------------------------------------------------------------------------------------------
/*Ligar 2 tabelas (Chave Primaria/Chave Estrangeira)*/

CREATE TABLE cliente(   //Tabela Cliente
    i_tipo_cliente INT NOT NULL;

    i_cliente_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT, // (tipo de dado)_(nome do campo)_(nome da tabela)
    s_nome_cliente VARCHAR(50) NOT NILL,
    s_cpf_cliente CHAR(11) NOT NULL,
    d_nasc_cliente DATETIME
);

create table tipo_cliente (
    / / Tabela Tipo Cliente i_tipocliente_tipocliente INT PRIMARY KEY AUTO_INCREMENT, s_dstipocliente_tipocliente VARCHAR(100) NOT NULL
);

/*
ALTER TABLE <tabela_origem> ADD CONSTRAINT <nome_restrição> FOREIGN KEY (<campo_tabela_origem>) REFERENCES <tabela_destino> (<camp_tabela_destino>);
ADD CONSTRAINT    Adiciona a nome da restrição
FOREIGN KEY       Tipo é Chave estrangeira  
REFERENCES        Referencia da tabela de destino
*/

ALTER TABLE cliente
ADD CONSTRAINT fk_tipocliente FOREIGN KEY (i_tipo_cliente) REFERENCES tipo_cliente (i_tipocliente_tipocliente);

/*fk_tipocliente = i_tipo_cliente -> i_tipocliente_tipocliente*/
/*Ao fazer o INSERT no i_tipo_cliente o valor tem que ser igual ao valor i_tipocliente_tipocliente para adicionar*/

-------------------------------------------------------------------------------------------------------------//

/*Tipos de dados
|          Dados de Texto         |
| Tipo de texto | Máximo de bytes |
|               |                 |
|Tinytext       |255              |
|Text           |65.535           |
|Mediumtext     |16.777.215       |
|Longtext       |4.294.967.295    |
|Char           |255              |
|Varchar        |65.535           |
|                                                        Dados Numéricos                                                   |
| Tipo de texto |                      Com sinal                        |                   Sem sinal                      |
|               |                                                       |                                                  |
|Tinyint        |-128 a 127                                             |0 a 255                                           |
|Smallint       |-32.768 a 32.767                                       |0 a 65.535                                        |
|Mediumint      |-8.388.608 a 8.388.607                                 |0 a 16.777.215                                    |
|Int/Integer    |-2.147.483.648 a 2.147.483.647                         |0 a 4.294.967.295                                 |
|Bigint         |-9.223.372.036.854.755.808 a 9.223.372.036.854.775.807 |                                                  |
|Float(p,e)     |-3,402823466E+38 a -1,17549435E-38                     |1,175494351E-38 a 3,402823466E+38                 |
|Double(p,e)    |-1,7976931348623157E+308 a -2,2250738585072014E-308    |2,2250738585072014E-308 a 1,7976931348623157E+308 |
|Decimal(p,e)   |                                                       |                                                  |
p = Precisão
e = Escala
ex: float(4,2) => Tamanho de 4, sendo 2 a esquerda e 2 a direita => 30.10 ou 4.25 => ERRO: 124.1 ou 125.325
|                              Dados Temporais                                  |
| Tipo de texto |      Formato       |                 Limite                   |
|               |                    |                                          |
|Date           |AAAA-MM-DD          |1000-01-01 a 9999-12-12                   |
|DateTime       |AAAA-MM-DD HH:MI:SS |1000-01-01 00:00:00 a 9999-12-31 23:59:59 |
|Timestamp      |AAAA-MM-DD HH:MI:SS |1970-01-01 00:00:00 a 2037-12-31 23:59:59 |
|Year           |AAAA                |1901 a 2155                               |
|Time           |HH:MI:SS            |-838:59:59 a 938:59:59                    |
*/
ALTER TABLE cliente ADD i_idade_cliente INT;

ALTER TABLE cliente MODIFY i_idade_cliente TINYINT;

-------------------------------------------------------------------------------------------------------------
/*Relacionamentos do Banco de Dados
Tipo de relacionamento  
Uma para um:
Ambas tabelas podem ter somente um registro de cada lado do relacionamento.
Cada valor da chave primária se relaciona a nenhum ou a apenas um registro na tabela relacionada.
A maioria dos relacionamentos de um para um são forçados por regras de negócios e não fluem naturalmente dos dados. Sem tal regra, geralmente você pode combinar as duas tabelas sem quebrar nenhuma regra de normalização.
Uma para muitos
A tabela de chave primária contém somente um registro relacionado a nenhum, a um ou a muitos registros da tabela relacionada.
Muitos para muitos
Cada registro em ambas as tabelas pode se relacionar a nenhum ou a qualquer número de registros na outra tabela. Esses relacionamentos requerem uma terceira tabela, chamada de tabela associada ou de associação, pois os sistemas relacionais não podem acomodar diretamente o relacionamento.
*/

-------------------------------------------------------------------------------------------------------------
/*Inserindo Dados
INSERT INTO <tabela> (colunas) values (valores); 
Quando quero inserir todas as colunas não preciso especificar a mesma
ex:
*/
INSERT INTO
    cliente
VALUES (
        01, 'Rafael Machado', '01010101010', '2010-04-01', 01
    );

-------------------------------------------------------------------------------------------------------------
/*Consultando tabela
Comando mostra todo o conteúdo da tabela
SELECT * FROM <tabela>;
*/
SELECT * FROM cliente;

SELECT * FROM cliente_backup;

-------------------------------------------------------------------------------------------------------------
/*Alterando Registro
Ao utilizar o comando UPDATE é perigoso utilizar esse comando pois substitui todas as linhas do banco de dados
Por isso utilizamos o WHERE (Quando), para selecionar a linha que queremos
*/
UPDATE cliente
SET
    s_nome_cliente = 'Rafael M. F. S.',
    s_cpf_cliente = '21934921033'
WHERE
    i_cliente_cliente = 1;

-------------------------------------------------------------------------------------------------------------
/*Deletar Registro
Como o UPDATE é recomendado utilizar o WHERE
*/
DELETE FROM cliente WHERE i_cliente_cliente = 3;

SELECT * FROM cliente;

-------------------------------------------------------------------------------------------------------------
/*Clausula dos SELECT
SELECT   ->  Consultar
FROM     ->  Qual tabela vamos Utilizar
WHERE    ->  Filtro da consulta
GROUP BY ->  Agrupar linhas de valores comum de colunas
HAVING   ->  Filtro de grupos indesejável
ORDER BY ->  Indicar ordenação dos registros
o '*' indica todas as colunas ou pode especificar a coluna desejada
*/

SELECT s_nome_cliente FROM cliente;
-- Retorna so o nome
SELECT s_nome_cliente, s_cpf_cliente FROM cliente;
-- Retorna o nome eo cpf
SELECT *, s_nome_cliente, s_cpf_cliente FROM cliente;
-- Retorna tudo mais o nome e cpf
/*Posso também fazer operações matemática dentro do SELECT*/
SELECT
    s_nome_cliente,
    i_tipo_cliente * 2 -- Retorna o os números vezes 2
FROM cliente;

/*Todas as letras maiúscula usando UPPER
*/

SELECT UPPER(s_nome_cliente), i_tipo_cliente FROM cliente;

-------------------------------------------------------------------------------------------------------------
/*ALIAS Apelidos para as colunas nas colunas
Na consulta ao invés de  mostrar o nome da coluna original mostrara o apelido que setamos   
*/

SELECT
    s_nome_cliente as nomeCliente,
    i_tipo_cliente as idCliente
FROM cliente;

/*Podemos colocar apelidos em tabelas como no exemplo*/

SELECT tbc.s_nome_cliente as nomeCliente, tbc.i_tipo_cliente as idCliente
FROM cliente tbc;
-- Nesse caso não é obrigatório o comando 'as' mais o SGBD reconhece

-------------------------------------------------------------------------------------------------------------
/*DISTINCT Remover duplicidade no registro
Usado na consulta sem repetir os dados existente
*/
SELECT i_cliente_cliente FROM venda;
-- Nessa retorna todos os clientes repetidos
SELECT DISTINCT i_cliente_cliente FROM venda;

-- Ja nessa retorna a cada cliente sem repetir
-------------------------------------------------------------------------------------------------------------
/*SubSelect
Método de auto incremento*/
INSERT INTO
    cliente
VALUES (
        (
            SELECT MAX(c.i_cliente_cliente) + 1 as i_cliente_cliente
            FROM cliente c
        ), -- Retorna o ultimo id e soma mais 1
        'Jorge Armando', '41284348328', '1986-05-12', d_nasc_cliente - 2024, 1
    );

SELECT * FROM cliente;

-------------------------------------------------------------------------------------------------------------
/*Cláusulas FROM
Consulta da consulta*/

SELECT c.i_cliente_cliente, c.s_cpf_cliente
FROM (
        SELECT
            i_cliente_cliente, s_cpf_cliente
        FROM cliente
    ) c;

-------------------------------------------------------------------------------------------------------------
/*VIEW
Consulta pre salva
Ela cria uma tabela virtual com as colunas que quero solicitar consulta*/
CREATE VIEW cpfCliente AS -- Cria a tabela virtual e salva
SELECT
    i_cliente_cliente,
    s_cpf_cliente
FROM cliente;

SELECT * FROM cpfCliente;

SELECT
    i_cliente_cliente,
    s_nome_cliente,
    DAY(d_nasc_cliente) AS 'Dia de Aniversario' -- Separa o dia da data
FROM cliente
WHERE
    MONTH(d_nasc_cliente) = MONTH(CURDATE());
-- MONTH é o mes da data
-- CURDATE() é a data de hoje
SELECT
    i_cliente_cliente,
    s_nome_cliente,
    DAY(d_nasc_cliente) AS 'Dia de Aniversario' -- Separa o dia da data
FROM cliente
WHERE
    MONTH(d_nasc_cliente) IN (5, 4, 3);
-- MONTH junto com IN Procura o mes selecionado
-------------------------------------------------------------------------------------------------------------
/*WHERE
Clausula que é filtrado na consulta
*/
SELECT *
FROM cliente
WHERE
    s_cpf_cliente = '21934921033'
    OR s_cpf_cliente = '10161053110';

/*Operadores Logica
OR  ->  OU
AND -   >E
NOT ->  NEGAÇÃO
*/

-------------------------------------------------------------------------------------------------------------
/*INNER JOIN
Junção de duas tabelas*/

SELECT c.i_cliente_cliente, c.s_nome_cliente, c.s_cpf_cliente, c.d_nasc_cliente, tc.s_dstipocliente_tipocliente -- Campo de outra tabela
FROM cliente c
    INNER JOIN tipo_cliente tc ON c.i_tipo_cliente = tc.i_tipoCliente_tipoCliente;
-- Junta as duas tabelas
-- Juntando 3 tabelas
SELECT v.i_venda_venda, c.s_nome_cliente, c.s_cpf_cliente, v.d_data_venda, v.f_valor_venda, tc.s_dstipocliente_tipocliente
FROM
    venda v
    INNER JOIN cliente c ON v.i_cliente_cliente = c.i_cliente_cliente
    INNER JOIN tipo_cliente tc ON c.i_tipo_cliente = tc.i_tipocliente_tipocliente;

-------------------------------------------------------------------------------------------------------------
/*GROUP BY
Agrupamento de campos repedidos
*/
SELECT tc.s_dstipocliente_tipocliente as 'Tipo Cliente', COUNT(c.i_cliente_cliente) as Quantidade -- Conta o i_cliente_cliente
FROM cliente c
    INNER JOIN tipo_cliente tc ON tc.i_tipocliente_tipocliente = c.i_tipo_cliente
GROUP BY
    c.i_tipo_cliente;
-- Separa e agrupa o i_tipo_cliente repetidos
SELECT v.d_data_venda, COUNT(v.i_venda_venda) AS 'Qtde vendas do dia'
FROM venda v
GROUP BY
    v.d_data_venda;

-------------------------------------------------------------------------------------------------------------
/*HAVING
Parecido com WHERE, O HAVING se aplica somente em GROUP BY e o WHERE em linha individual */

SELECT v.d_data_venda, COUNT(v.i_venda_venda) AS 'Qtde vendas do dia'
FROM venda v
GROUP BY
    v.d_data_venda
HAVING
    v.d_data_venda > '2020-10-01';

-------------------------------------------------------------------------------------------------------------
/*ORDER BY
Ordenação da tabela
Por padrão é ordenado pela chave primaria*/
SELECT * FROM cliente ORDER BY i_tipo_cliente, s_nome_cliente;
-- Ordenação de dois níveis
SELECT * FROM cliente ORDER BY 2;
-- Ordenação na segunda coluna

-------------------------------------------------------------------------------------------------------------
/*IS NULL e IS NOT NULL
Campos vazio
O IS é obrigatório*/
SELECT * FROM cliente ORDER BY 1 DESC;
-- Ordem decrescente
SELECT * FROM cliente WHERE d_nasc_cliente IS NULL;
-- Retorna quando é NULL
SELECT * FROM cliente WHERE d_nasc_cliente IS NOT NULL;
-- Retorna tudo menos os NULL

-------------------------------------------------------------------------------------------------------------
/*Operadores Logica
OR  ->  OU
AND ->  E
NOT ->  NEGAÇÃO
*/

SELECT *
FROM cliente
WHERE
    d_nasc_cliente IS NULL
    AND i_tipo_cliente = 1;

SELECT *
FROM cliente
WHERE
    d_nasc_cliente IS NULL
    OR i_tipo_cliente = 1;

SELECT * FROM cliente WHERE NOT i_tipo_cliente = 1;

SELECT * FROM cliente WHERE i_tipo_cliente != 1;
-- Mesmo resultado do NOT

-------------------------------------------------------------------------------------------------------------
/*Limite de consulta
Consultar os 5 primeiros*/

/*Comando no SQL Server
SELECT TOP 5 * FROM cliente;
Comando no ORACLE
SELECT * FROM cliente WHERE ROWNUM < 5;
Comando no MySQL
SELECT * FROM cliente LIMIT 5; 
*/

SELECT * FROM venda ORDER BY f_valor_venda DESC LIMIT 3;

SELECT c.s_nome_cliente, v.i_venda_venda, v.d_data_venda, v.f_valor_venda
FROM venda v
    INNER JOIN cliente c on c.i_cliente_cliente = v.i_cliente_cliente
ORDER BY v.f_valor_venda DESC
LIMIT 3;

-------------------------------------------------------------------------------------------------------------
/*MAX e MIN
*/
SELECT MAX(f_valor_venda) FROM venda;
-- Valor Máximo
SELECT MIN(f_valor_venda) FROM venda;
-- Valor Mínimo

SELECT 
    c.s_nome_cliente,
    v.i_venda_venda,
    v.d_data_venda,
    v.f_valor_venda
 FROM venda v
    INNER JOIN cliente c ON c.i_cliente_cliente = v.i_cliente_cliente
    WHERE f_valor_venda = (SELECT MAX(f_valor_venda) FROM venda);
    -- Retorna os dados da maior venda

-------------------------------------------------------------------------------------------------------------
/*Funções
SUM   -> Soma       -> SUM(COLUNA_NUM)
AVG   -> Media      -> AVG(COLUNA_NUM)
COUNT -> Contagem   -> COUNT(COLUNA_NUM)
ROUND -> Arredondar -> ROUND(COLUNA_NUM,CASAS_DECIMAIS)
*/

SELECT ROUND(SUM(f_valor_venda),2) FROM venda
WHERE d_data_venda > '2020-05-01';

SELECT ROUND(AVG(f_valor_venda),2) FROM venda;

SELECT 
    COUNT(f_valor_venda) AS 'Quantidade vendas',
    ROUND(AVG(f_valor_venda),2) AS 'Valor médio das vendas' FROM venda
WHERE 
    f_valor_venda > (SELECT MIN(f_valor_venda) FROM venda) AND
    f_valor_venda < (SELECT MAX(f_valor_venda) FROM venda);
-- Calcula media tirando o valor máximo e mínimo das vendas

-------------------------------------------------------------------------------------------------------------
/*Operador LIKE

Caracteres coringa
% -> Qual quer carácter
_ -> Quantidade de carácter
ex:
LIKE('r%')  -> Começa com a letra "R"
LIKE('%l')  -> Termina com a letra "L"
LIKE('r%l') -> Começa com "R" e termina com a letra "L"
LIKE('r_____') -> Começa com "R" mais 5 caráter pois tem 5 underline
LIKE('______') -> 6 caráter pois te 6 underline
*/
SELECT * FROM cliente
WHERE s_nome_cliente LIKE('v%o');

SELECT * FROM cliente
WHERE s_nome_cliente LIKE('rafa_________s.');

-------------------------------------------------------------------------------------------------------------
/*Operador IN
Quando usar muito OR na filtragem, para não ficar muito grande utilizamos IN e reduzimos esse comando
A função RIGHT(STRING,QUANTIDADE) extrai vários caracteres de uma string (começando da direita)
*/
SELECT * FROM cliente
WHERE RIGHT(s_cpf_cliente,3) IN (011,033);
-- Retorna os dados dos clientes que o cpf termina com esses valores

SELECT * FROM cliente
WHERE d_nasc_cliente IN (
    SELECT d_nasc_cliente FROM cliente
    WHERE
        d_nasc_cliente > '2000-01-01' AND
        d_nasc_cliente < '2010-10-01'
); -- SubSelect que retorna a data dentro dessa condição
-- Retorna os dados dos clientes que atende a condição do SubSelect

-------------------------------------------------------------------------------------------------------------
/*BETWEEN
Filtra entre valores máximo e mínimo
*/
SELECT * FROM cliente
WHERE d_nasc_cliente BETWEEN '2000-01-01' and '2010-01-01';

SELECT * FROM venda
WHERE
    (d_data_venda BETWEEN '2020-07-01' AND '2020-11-01') AND
    i_cliente_cliente NOT IN (3,10) AND
    f_valor_venda > 400;





























