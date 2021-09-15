/*
Tutte le operazioni svolte si riferiscono al database appena creato 
e non sono da considerarsi sequenziali
*/

begin;
--select--
-- Ogni sera viene stilato un rapporto che indica quante vaccinazioni sono state fatte nella giornata in tutti i centri vaccinali suddivise per categoria di cittadino.
select c.tipo, count(*)
from appuntamento_vaccinale av join cittadino c on av.cittadino = c.cf
where av.data_appuntamento = '2021-01-15'
group by c.tipo;

-- Ogni sera, ogni centro vaccinale fa l’inventario del numero di dosi ancora disponibili per ogni vaccino
select *
from possiede_dosi
order by centro, vaccino;

-- Ogni fine settimana, viene stilato un report che indica quante vaccinazioni sono state fatte per ogni vaccino per ognuna delle categorie di cittadini e quante di queste abbiano causato allergie.


--edit--
update allergia
set cittadino = 'dgzrti85a51a123b'
where cittadino = 'dptfri11a11a123b';


update possiede_dosi
set vaccino = 1
where centro = 2222 and vaccino = 2;    --errore, esiste già come tupla--

update possiede_dosi
set vaccino = 6
where centro = 2222 and vaccino = 2;    --non esiste vaccino 6--


update appuntamento_vaccinale
set ora = '17:30:00'
where data_appuntamento = '2021/03/03' and ora = '09:20:00' and centro = 2222;

update appuntamento_vaccinale
set data_appuntamento = '2021/04/03'
where data_appuntamento = '2021/03/03' and ora = '17:30:00' and centro = 2222;

update appuntamento_vaccinale
set centro = 8888
where data_appuntamento = '2021/03/03' and ora = '17:30:00' and centro = 2222;

-- medico
update cittadino 
set cf='1234567890abcdef'
where cf='zmllei70a11a123b';

update cittadino 
set cf='1234567890abcdef'
where cf='dgvant70a11a123b';
-- queste query non vengono eseguite perché il cf della clausola where è referenziato anche in altre tabelle

-- report
update centro_vaccinale 
set cod='1234' 
where cod='2222';

update lotto
set cod='0987cx'
where cod='1234cx';

update medico
set cod='12'
where cod='2';
-- queste operazioni portano un cambiamento anche nella tupla di report


--delete--
delete from allergia
where cittadino = 'dgzrti85a51ab';  --cf errato--


delete from possiede_dosi
where centro = 2222 and vaccino = 1;


delete from appuntamento_vaccinale
where data_appuntamento = '2021/03/03' and ora = '17:30:00' and centro = '2222';

-- medico 
delete from cittadino 
where cf='dgvant70a11a123b';
-- provoca la rimozione anche della entry ('dgvant70a11a123b', 'altro medico', 4444, TRUE) da medico

-- report
delete from centro_vaccinale 
where cod=2222;

delete from lotto 
where cod='cn0987';

delete from medico 
where cod=2;
-- queste operazioni non vengono portate a termine perché i valori sono referenziati in altre tabelle

delete from cittadino 
where cf='zmllei70a11a123b';
-- l'operazione va a buon fine e porta alla cancellazione del report relativo al cf indicato

commit;