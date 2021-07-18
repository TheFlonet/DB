begin;

-- Domini

drop domain if exists CodiceFiscale;
drop domain if exists NomeAllergia;
drop domain if exists NomeVaccino;
drop domain if exists TipoCittadino;
drop domain if exists TipoMedico;

-- Tabelle

drop table if exists Allergia cascade;
drop table if exists AppuntamentoVaccinale cascade;
drop table if exists CentroVaccinale cascade;
drop table if exists Cittadino cascade;
drop table if exists Dichiara cascade;
drop table if exists Dispone cascade;
drop table if exists Lotto cascade;
drop table if exists Medico cascade;
drop table if exists Possiede cascade;
drop table if exists Report cascade;
drop table if exists RiscontroAllergico cascade;
drop table if exists Vaccino cascade;

commit;