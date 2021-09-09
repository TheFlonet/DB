begin;
--select--
select c.tipo, count(*)
from appuntamento_vaccinale av join cittadino c on av.cittadino = c.cf
where av.data_appuntamento = '2021-01-15'
group by c.tipo;

select *
from possiede_dosi
order by centro, vaccino;

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
where data_appuntamento = '2021/03/03' and ora = '09:20:00' and centro = '2222';

update appuntamento_vaccinale
set data_appuntamento = '2021/04/03'
where data_appuntamento = '2021/03/03' and ora = '17:30:00' and centro = '2222';

update appuntamento_vaccinale
set centro = '88888'
where data_appuntamento = '2021/03/03' and ora = '17:30:00' and centro = '2222';



--delete--
delete from allergia
where cittadino = 'dgzrti85a51ab';  --cf errato--


delete from possiede_dosi
where centro = 2222 and vaccino = 1;


delete from appuntamento_vaccinale
where data_appuntamento = '2021/03/03' and ora = '17:30:00' and centro = '2222';

commit;