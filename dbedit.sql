/*
Tutte le operazioni svolte si riferiscono al database appena creato 
e non sono da considerarsi sequenziali
*/

begin;
--select--
-- Ogni sera viene stilato un rapporto che indica quante vaccinazioni sono state fatte nella giornata in tutti i centri vaccinali suddivise per categoria di cittadino.
select c.tipo, count(*)
from appuntamento_vaccinale av join cittadino c on av.cittadino = c.cod
where av.data_appuntamento = CURRENT_DATE
group by c.tipo;

-- Ogni sera, ogni centro vaccinale fa l’inventario del numero di dosi ancora disponibili per ogni vaccino
select *
from possiede_dosi
order by centro, vaccino;

-- Ogni fine settimana, viene stilato un report che indica quante vaccinazioni sono state fatte per ogni vaccino per ognuna delle categorie di cittadini e quante di queste abbiano causato allergie.
with num_tot_vaccino as(
  select c.tipo as tipo_cittadino, l.vaccino as tipo_vaccino, count(*) as num_vaccini
  from appuntamento_vaccinale av join lotto l on av.lotto = l.cod join cittadino c on av.cittadino = c.cod
  group by c.tipo, l.vaccino
), num_tot_report as(
  select c.tipo as tipo_cittadino, l.vaccino as tipo_vaccino, count(*) as num_report
  from report r join appuntamento_vaccinale av on r.appuntamento_vaccinale = av.cod 
    join cittadino c on av.cittadino = c.cod join lotto l on av.lotto = l.cod
  where r.data_report between CURRENT_DATE - 7 and CURRENT_DATE
  group by c.tipo, l.vaccino
  )
select v.tipo_cittadino, v.tipo_vaccino, num_vaccini, num_report
from num_tot_vaccino v, num_tot_report r
where v.tipo_cittadino = r.tipo_cittadino and v.tipo_vaccino = r.tipo_vaccino;

--edit--

update allergia
set cittadino = 15
where cittadino = 1;

update centro_vaccinale
set cod='6'
where cod='4';

update tipo_vaccino
set cod='4'
where cod='2';

update lotto
set cod='0987cx'
where cod='1234cx';

update cittadino 
set cod=1000
where cod=8;

update centro_vaccinale 
set cod=1234 
where cod=2;

update medico
set cod=12
where cod=2;

--delete--

delete from cittadino
where cod = 1;

delete from tipo_vaccino
where cod = 3;  -- non viene portato a termine perché viola vincolo in lotto

delete from appuntamento_vaccinale
where data_appuntamento = '2021/03/03' and ora = '17:30:00' and centro = '2222';

delete from cittadino 
where cod=17;
-- provoca la rimozione anche della entry ('dgvant70a11a123b', 'altro medico', 4444, TRUE) da medico

delete from centro_vaccinale 
where cod=2;    -- non viene portata a termine perché viola un vincolo in medico

delete from lotto 
where cod='cn0987';

delete from cittadino 
where cod=8;
-- queste operazioni non vengono portate a termine perché i valori sono referenziati in altre tabelle

commit;