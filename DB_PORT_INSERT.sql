USE DB_MAR

insert into	tb_agente (nome_agente,supervisor)
values('JOAO','FRANCISCO');

SELECT * FROM tb_agente;

insert into	tb_agente (nome_agente,supervisor)
values('JOSIAS','FRANCISCO');

insert into	tb_agente (nome_agente,supervisor)
values('ELIAS','FRANCISCO'),('GABRIEL','GUILHERME'),('GIL','GUILHERME');

SELECT * FROM tb_agente;

INSERT INTO tb_carga(carga,status_carga,peso_carga,data_validade,data_maxima)
values('carga1','ESPERANDO EMBARQUE',2000,'20-12-21','20-02-21'),('carga2','EMBARCADO',1000,'20-09-22','15-04-21'),
('carga3','DESEMBARCADO',3000,'20-12-21','20-02-21'),('carga4','DESEMBARCADO',1500,'20-08-21','20-03-21');

INSERT INTO tb_carga(carga,status_carga,peso_carga,data_validade,data_maxima)
values('carga5','ESPERANDO EMBARQUE',5000,'20-12-21','20-02-21');

SELECT * FROM tb_carga;

INSERT INTO tb_navio (nome_navio)
VALUES('CAUCAIA'),('MESSEJANA'),('BF'),('JOSE WALTER'),('ALVORADA');

SELECT * FROM tb_navio;

INSERT INTO tb_porto(nome_porto)
VALUES('SANTOS'),('PECEM'),('SAN ANDREAS'),('MUCURIPE'),('RIO DE JANEIRO');

SELECT * FROM tb_porto;

INSERT INTO tb_rota(saida,destino)
values('PECEM','SANTOS'),('SAN ANDREAS','SANTOS'),('PECEM','MUCURIPE'),
('MUCURIPE','RIO DE JANEIRO'),('RIO DE JANEIRO','SAN ANDREAS');

SELECT * FROM tb_rota;

INSERT INTO tb_acompanhamento(num_carga,agente,porto,navio,rota,disponibilidade,data_embarque,data_chega)
values(2,4,5,1,3,0,'13-07-2021',''),(2,4,5,1,3,1,'13-07-2020','13-12-2020'),(2,1,3,5,3,0,'15-12-2020','05-01-2021'),
(1,4,5,2,5,0,'10-12-2020','06-01-2021'),(2,4,5,1,3,1,'13-04-2021','');

SELECT * FROM tb_acompanhamento;

DELETE FROM tb_acompanhamento;

select * from  tb_acompanhamento;

INSERT INTO tb_acompanhamento(num_carga,agente,porto,navio,rota,disponibilidade,data_embarque,data_chega)
values(2,4,5,1,3,0,'13-07-2020',NULL)
,(3,5,3,2,1,1,'13-07-2020','13-12-2020'),(4,1,2,3,2,0,'15-12-2020','05-01-2021'),
(1,3,4,5,5,0,'10-12-2020','06-01-2021'),(5,2,1,2,3,1,'13-04-2021',NULL);

SELECT * FROM tb_acompanhamento;


SELECT data_embarque, COUNT(data_embarque) AS CONTAGEM
from tb_acompanhamento
group by data_embarque
ORDER BY COUNT(data_embarque) ASC;

CREATE VIEW VPORTO AS
SELECT * FROM tb_porto;

SELECT * FROM VPORTO;

SELECT c.carga,c.status_carga,c.peso_carga,c.data_validade,c.data_maxima,nome_agente,
n.nome_navio,p.nome_porto,r.destino,r.saida,a.disponibilidade,a.data_embarque,a.data_chega
from tb_acompanhamento a
inner join tb_agente ag on a.agente = ag.cod_agente
inner join tb_carga c on a.num_carga = c.cod_carga
inner join tb_navio n on  a.navio = cod_navio
inner join tb_porto p on a.porto = cod_porto
inner join tb_rota r on a.rota = cod_rota;