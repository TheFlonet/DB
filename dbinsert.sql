begin;

-- Cittadino
insert into Cittadino
value ('0123456789abcdef', 'Nome01', 'Cognome01', 10, null, 1234567890, 'Via del non lo so 7', 'Torino', FALSE, 'altro');

-- CentroVaccinale
insert into CentroVaccinale
value (111111, 'Via ritrovata 15', 'Torino');
insert into CentroVaccinale
value (222222, 'Via retta 87', 'Milano');
insert into CentroVaccinale
value (333333, 'Via Roma 1', 'Roma');
insert into CentroVaccinale
value (444444, 'Via della speranza 42', 'Napoli');
insert into CentroVaccinale
value (555555, 'Via degli artisti 7', 'Genova');

-- Medico

-- Lotto
insert into Lotto
value (123456, '2020-11-5', '2021-2-23', 'covidin');
insert into Lotto
value (654321, '2021-1-21', '2021-4-17', 'coronax');
insert into Lotto
value (987654, '2021-3-13', '2021-6-30', 'flustop');

-- Report

-- Allergia
insert into Allergia
value ('amoxicillina');
insert into Allergia
value ('lattosio');
insert into Allergia
value ('solfiti');
insert into Allergia
value ('omeprazolo');
insert into Allergia
value ('altro');

-- Vaccino

-- AppuntamentoVaccinale

-- Dispone

-- Possiede

-- RiscontroAllergico

-- Dichiara
insert into Dichiara
value ('???', 'amoxicillina');
insert into Dichiara
value ('???', 'altro');

commit;