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

--delete--

commit;