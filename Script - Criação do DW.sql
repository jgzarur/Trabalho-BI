SELECT * FROM dim_cliente;


ALTER TABLE dim_produto
ALTER COLUMN preco_mes TYPE NUMERIC(6,2);

---Criação do DW


---Criação da Dimensão cliente

CREATE SEQUENCE dim_cliente_sk_cliente_seq;

CREATE TABLE dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT  nextval('dim_cliente_sk_cliente_seq'),
                cod_cliente VARCHAR(5)NOT NULL,
                companhia_nome VARCHAR(100)NOT NULL,
                Industria VARCHAR(100)NOT NULL,
	            estado VARCHAR(50),
                etl_dt_fim DATE NOT NULL ,
                etl_dt_inicio DATE NOT NULL ,
                etl_versao INTEGER NOT NULL ,
	            CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
                );
				
ALTER SEQUENCE dim_cliente_sk_cliente_seq OWNED BY dim_cliente.sk_cliente;

INSERT INTO dim_cliente(sk_cliente,cod_cliente,companhia_nome,industria,estado,etl_dt_inicio, etl_dt_fim, etl_versao)
VALUES (0,'N/A','N/A','N/A','N/A','1900-01-01','2199-12-31',0 );


---Criação da Dimensão Funcionário

CREATE SEQUENCE dim_funcionario_sk_funcionario_seq;

CREATE TABLE dim_funcionario (
                sk_funcionario INTEGER NOT NULL DEFAULT  nextval('dim_funcionario_sk_funcionario_seq'),
                cod_funcionario VARCHAR(5) NOT NULL,
                nm_funcionario VARCHAR(100) NOT NULL,
                aniversario DATE NOT NULL,
	            departamento VARCHAR(100) NOT NULL,
	            salario_anual NUMERIC(9,2) NOT NULL,
	            cargo_trabalho VARCHAR(100),
	            estado VARCHAR(50),
	            genero VARCHAR (30),
                etl_dt_fim DATE NOT NULL ,
                etl_dt_inicio DATE NOT NULL ,
                etl_versao INTEGER NOT NULL ,
	            CONSTRAINT sk_funcionario PRIMARY KEY (sk_funcionario)
                );
				
ALTER SEQUENCE dim_funcionario_sk_funcionario_seq OWNED BY dim_funcionario.sk_funcionario;

INSERT INTO dim_funcionario(sk_funcionario, cod_funcionario,nm_funcionario, aniversario, departamento,salario_anual,cargo_trabalho,estado,genero,etl_dt_inicio, etl_dt_fim, etl_versao)
VALUES (0,'N/A','N/A','1900-01-01','N/A',0,'N/A','N/A','N/A','1900-01-01','1900-01-01',0);


---Criação da Dimensão Produto

CREATE SEQUENCE dim_produto_sk_produto_seq;

CREATE TABLE dim_produto (
                sk_produto INTEGER NOT NULL DEFAULT  nextval('dim_produto_sk_produto_seq'),
                cod_produto VARCHAR(5),
                nm_produto VARCHAR(50),
	            empresa VARCHAR(30),
	            classificação VARCHAR(30),
	            preco_mes INTEGER,
                etl_dt_fim DATE NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
	            CONSTRAINT sk_produto PRIMARY KEY (sk_produto)
                );
				
ALTER SEQUENCE dim_produto_sk_produto_seq OWNED BY dim_produto.sk_produto;

INSERT INTO dim_produto(sk_produto,cod_produto,nm_produto,empresa,classificação,preco_mes,etl_dt_inicio, etl_dt_fim, etl_versao)
VALUES (0,'N/A','N/A','N/A','N/A',0,'1900-01-01','1900-01-01',0 );


---Criação da Dimensão Região

CREATE SEQUENCE dim_regiao_sk_regiao_seq;

CREATE TABLE dim_regiao (
                sk_regiao INTEGER NOT NULL DEFAULT  nextval('dim_regiao_sk_regiao_seq'),
                cod_regiao VARCHAR(5),
                estado VARCHAR(50),
                regiao VARCHAR(30),
	            divisao VARCHAR(50),
	            estado_abrv VARCHAR (10),
	            etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
	            CONSTRAINT sk_regiao PRIMARY KEY (sk_regiao)
                );
				
ALTER SEQUENCE dim_regiao_sk_regiao_seq OWNED BY dim_regiao.sk_regiao;

INSERT INTO dim_regiao(sk_regiao,cod_regiao,estado,regiao,divisao,estado_abrv,etl_dt_inicio, etl_dt_fim, etl_versao)
VALUES (0,'N/A','N/A','N/A','N/A','N/A','1900-01-01','1900-01-01',0);

SELECT * FROM dim_regiao;

---Criação da Tabela Fato ft_vendas

CREATE SEQUENCE ft_vendas_pk_vendas_seq;

CREATE TABLE ft_vendas (
	            pk_vendas INTEGER NOT NULL,
                sk_funcionario INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_produto INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
	            qntd INTEGER NOT NULL,
                preco_total INTEGER NOT NULL,
	
	            CONSTRAINT pk_vendas PRIMARY KEY (pk_vendas)
                );
				
ALTER SEQUENCE ft_vendas_pk_vendas_seq OWNED BY ft_vendas.pk_vendas;