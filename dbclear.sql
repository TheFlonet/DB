begin;

-- Domini

drop domain if exists CodiceFiscale cascade;
drop domain if exists NomeAllergia cascade;
drop domain if exists NomeVaccino cascade;
drop domain if exists TipoCittadino cascade;
drop domain if exists TipoMedico cascade;

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