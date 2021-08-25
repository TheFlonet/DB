begin;

-- Domini

drop domain if exists codice_fiscale cascade;

-- Tipi

drop type if exists nome_vaccino cascade;
drop type if exists tipo_cittadino cascade;
drop type if exists tipo_medico cascade;

-- Sequenze

drop sequence if exists id_centro cascade;
drop sequence if exists id_allergia cascade;
drop sequence if exists id_vaccino cascade;

-- Tabelle

drop table if exists cittadino cascade;
drop table if exists centro_vaccinale cascade;
drop table if exists medico cascade;
drop table if exists lotto cascade;
drop table if exists tipo_vaccino cascade;
drop table if exists appuntamento_vaccinale cascade;
drop table if exists possiede_dosi cascade;
drop table if exists allergia cascade;
drop table if exists report cascade;

commit;