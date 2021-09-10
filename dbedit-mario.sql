/*
Tutte le operazioni svolte si riferiscono al database appena creato 
e non sono da considerarsi sequenziali
*/

--select
-- OP1
-- Ogni sera viene stilato un rapporto che indica quante vaccinazioni sono state fatte nella giornata in tutti i centri vaccinali suddivise per categoria di cittadino.
select c.tipo, count(*)
from appuntamento_vaccinale av join cittadino c on av.cittadino = c.cf
where av.data_appuntamento = current_date
group by c.tipo;

-- OP2
-- Ogni sera, ogni centro vaccinale fa l’inventario del numero di dosi ancora disponibili per ogni vaccino
select *
from possiede_dosi p join centro_vaccinale c on p.centro = c.cod
where c.citta=*CITTA INDICATA* and c.indirizzo=*INDIRIZZO INDICATO* -- Opzionale, per avere i report su tutti i centri contemporaneamente rimuovere la clausola where (e a questo punto il join diventa superfluo)
order by centro, vaccino;

--OP3
-- Ogni fine settimana, viene stilato un report che indica quante vaccinazioni sono state fatte per ogni vaccino per ognuna delle categorie di cittadini e quante di queste abbiano causato allergie.
select v.nome, c.tipo, 
from 
where

--edit
-- cittadino
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

--delete
-- cittadino 
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