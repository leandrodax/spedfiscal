create database spedFiscal; 
use spedFiscal;
##drop database spedFiscal;

##delete from usuario where id in (4,5,6);
##select * from usuario;
##drop table usuario;
create table usuario(
id int auto_increment primary key,
cnpj varchar(14) not null,
razao_social varchar(60) not null,
fantasia varchar(60) not null,
logradouro varchar(60) not null,
bairro varchar(60) not null,
numero varchar(8) not null,
complemento varchar(40) not null,
cep varchar(8) not null,
cidade varchar(40) not null,
estado varchar(2) not null,
representante varchar(80) not null,
usuario varchar(80) not null,
senha varchar(14) not null 
); 
 

##drop table produto;
select * from produto;
create table produto(
id int auto_increment primary key,
cod_produto varchar(20) not null,
descricao varchar(80) not null, 
posse varchar(14) not null, 
tipo_produto varchar(1) not null, 
data_producao varchar(80) not null,
qtd_estoque varchar(14) not null, 
qtd_produzida varchar(14) not null,
data_saida_estoque varchar(14) null,  
ordem_procucao varchar(14) null,  
cod_item_destino varchar(14) null,  
bloco_tipo_produto varchar(4) not null, 
data_alteracao date not null,  
data_criacao date not null, 
id_usuario int,  
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

SELECT p.*, pr.id id_produtor, pr.cod_produtor, pr.nome FROM produto p INNER JOIN produto_produtor pp on pp.id_produto in (p.id,null)  INNER JOIN produtor pr on pp.id_produtor = pr.id;

select * from produtor where id = 0;
select * from produto;
select * from produtor;
select * from produto_produtor;

insert into produtor( cod_produtor, nome, id_usuario) values ('00000', 'Propriedade Informante',1);
##drop table produtor;
create table produtor(
id int auto_increment primary key,
cod_produtor varchar(10) not null,
nome varchar(80) not null,
id_usuario int,   
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

select * from sped;
create table sped(
id int auto_increment primary key,
path_arquivo_xml varchar(120) null,
path_arquivo_txt varchar(120) not null,
processo varchar(1) default'M',
data_processamento date not null,
id_usuario int,   
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

create table produto_produtor(
id int auto_increment primary key, 
id_produto int,   
id_produtor int,   
id_usuario int,   
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_produto) REFERENCES produto(id),
FOREIGN KEY (id_produtor) REFERENCES produtor(id)
);
 
create table sped_produto(
id int auto_increment primary key, 
id_produto int,   
id_sped int,   
FOREIGN KEY (id_produto) REFERENCES produto(id),
FOREIGN KEY (id_sped) REFERENCES sped(id)
);
 
 
update produto  set id_produtor = null where bloco_tipo_produto = 'k235';
select * from produtor ; 
alter table produto  CONVERT TO CHARACTER SET utf8;
alter table produto  modify column descricao varchar(80) not null;
alter table produtor  CONVERT TO CHARACTER SET utf8;
INSERT INTO usuario(razao_social, fantasia,cnpj,logradouro,bairro,numero,cep,complemento,cidade,estado,representante,usuario,senha) 
VALUES('00000000','000000000','000000000','000000000','000000000','000000000','0000','00000000','000000000','00','administrador','administrador@adm','000000000');