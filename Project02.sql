
CREATE DATABASE	 DB_MAR

USE DB_MAR

create table tb_carga(
cod_carga integer not null identity(1,1),
carga varchar(30) not null,
status_carga varchar(30) not null,
peso_carga integer not null,
data_validade date not null,
data_maxima date not null);

create table tb_agente(
cod_agente integer not null identity(1,1),
nome_agente varchar(30) not null,
supervisor varchar(30) not null);

create table tb_porto(
cod_porto integer not null identity(1,1),
nome_porto varchar(30) not null);

create table tb_navio(
cod_navio integer not null identity(1,1),
nome_navio varchar(30) not null);

create table tb_rota(
cod_rota integer not null identity(1,1),
saida varchar(30) not null,
destino varchar(30) not null);

create table tb_acompanhamento(
num_carga integer not null,
agente integer not null,
porto integer not null,
navio integer not null,
rota integer not null,
disponibilidade integer not null,
data_embarque date not null,
data_chega date);


alter table tb_carga
add constraint pk_carga
primary key(cod_carga);

alter table tb_agente
add constraint pk_agente
primary key(cod_agente);

alter table tb_navio
add constraint pk_navio
primary key(cod_navio);

alter table tb_porto
add constraint pk_porto
primary key(cod_porto);

alter table tb_rota
add constraint pk_rota
primary key(cod_rota);

alter table tb_acompanhamento
add constraint fk_carga
foreign key(num_carga)
references tb_carga(cod_carga);

alter table tb_acompanhamento
add constraint fk_agente
foreign key(agente)
references tb_agente(cod_agente);

alter table tb_acompanhamento
add constraint fk_navio
foreign key(navio)
references tb_navio(cod_navio);

alter table tb_acompanhamento
add constraint fk_porto
foreign key(porto)
references tb_porto(cod_porto);

alter table tb_acompanhamento
add constraint fk_rota
foreign key(rota)
references tb_rota(cod_rota);





