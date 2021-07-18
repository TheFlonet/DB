begin;

-- Cittadino
  -- nota: essendo dati fittizi si sceglie di mettere come suffisso di CF a11a123b (0 51 nel caso di donne) e rendere coerente solo la prima parte
  insert into Cittadino
  value ('fridpt11a11a123b', 'Fiero', 'Di Pietro', 10, null, 1234567890, 'Via del sole 7', 'Torino', FALSE, 'altro');
  insert into Cittadino
  value ('palbrm01a11a123b', 'Palamede', 'Bramati', 20, 'p.bramati@email.com', null, 'Strada portorosso 12', 'Genova', TRUE, 'personale sanitario');
  insert into Cittadino
  value ('nglghm98a51a123b', 'Angela', 'Aghemio', 23, null, 9376295481, 'Corso san giovanni 138', 'Roma', FALSE, 'personale scolastico');
  insert into Cittadino
  value ('lnismr60a11a123b', 'Lino', 'Sommariva', 61, null, 1239874569, 'Stradale torino', 'Milano', FALSE, 'soggetto fragile');
  insert into Cittadino
  value ('rsltno76a51a123b', 'Rossella', 'Tonani', 45, "ross.tonani@gmail.com", null, 'Via tempesta 5', 'Milano', TRUE, 'altro');
  insert into Cittadino
  value ('gbrzpa91a11a123b', 'Gabriele', 'Zappa', 30, null, 9517536482, 'Via alighieri 1a', 'Napoli', FALSE, 'altro');
  insert into Cittadino
  value ('flpdfl95a11a123b', 'Filippo', 'De Filippi', 26, 'defilippi.fil@yahoo.com', null, 'Via de medici 90', 'Napoli', TRUE, 'altro');
  insert into Cittadino
  value ('leizml70a11a123b', 'Elio', 'Zemello', 51, 'zemee51@libero.it', null, 'Via arsenale 5', 'Milano', FALSE, 'personale sanitario');
  insert into Cittadino
  value ('brdstf86a11a123b', 'Berardo', 'Stefanelli', 35, null, 5645237982, 'Via garibaldi 10', 'Torino', TRUE, 'personale scolastico');
  insert into Cittadino
  value ('smnspr90a11a123b', 'Simone', 'Sparaventi', 31, 'ventisimone_31@email.net', null, 'Via sapienza 50', 'Roma', FALSE, 'altro');
  insert into Cittadino
  value ('lrnvsc40a11a123b', 'Lorenzo', 'Viscomi', 81, null, 4592531876, 'Via del sentiero', 'Milano', TRUE, 'soggetto fragile');
  insert into Cittadino
  value ('niamza69a11a123b', 'Iana', 'Mazzuia', 52, 'maziana_2@gmail.com', null, 'Strada della repubblica', 'Torino', FALSE, 'altro');
  insert into Cittadino
  value ('piobrc85a11a123b', 'Pippo', 'Burchi', 36, null, 1236987459, 'Corso caselle 70', 'Torino', TRUE, 'personale sanitario');
  insert into Cittadino
  value ('lnrfln66a11a123b', 'Leonardo', 'Filano', 55, 'fil.leo66@gmail.co,', null, 'Corso cesare 177', 'Milano', FALSE, 'personale sanitario');
  insert into Cittadino
  value ('rtidgz85a51a123b', 'Rita', 'De Guzzi', 36, null, 1596542587, 'Via dei mercanti 8', 'Genova', FALSE, 'altro');
  insert into Cittadino
  value ('fdamnt60a51a123b', 'Fadia', 'Menta', 61, 'f.menta@virgilio.it', null, 'Strada del colle 3', 'Roma', TRUE, 'personale sanitario');
  insert into Cittadino
  value ('antdgv70a11a123b', 'Antonio', 'De Giovanni', 51, null, 6549631478, 'Corso romano 75', 'Napoli', FALSE, 'personale sanitario');
  insert into Cittadino
  value ('mtacts89a11a123b', 'Matteo', 'Actis', 32, 'mattewactis@gmail.com', null, 'Via del mare 5', 'Genova', TRUE, 'personale sanitario');

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
  insert into Medico
  value ('leizml70a11a123b', 'medico di base', 222222, FALSE);
  insert into Medico
  value ('lnrfln66a11a123b', 'altro medico', 666666, TRUE);
  insert into Medico
  value ('piobrc85a11a123b', 'medico di base', 111111, TRUE);
  insert into Medico
  value ('fdamnt60a51a123b', 'altro medico', 333333, TRUE);
  insert into Medico
  value ('antdgv70a11a123b', 'altro medico', 444444, TRUE);
  insert into Medico
  value ('mtacts89a11a123b', 'altro medico', 555555, TRUE);

-- Lotto
  insert into Lotto
  value (123456, '2020-11-05', '2021-02-23', 'covidin');
  insert into Lotto
  value (654321, '2021-01-21', '2021-04-17', 'coronax');
  insert into Lotto
  value (987654, '2021-03-13', '2021-06-30', 'flustop');

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

-- Dichiara
  insert into Dichiara
  value ('lnrfln66a11a123b', 'amoxicillina');
  insert into Dichiara
  value ('piobrc85a11a123b', 'altro');

-- Dispone
  insert into Dispone
  value ('lnismr60a11a123b', '2021-01-15', '09:00', 222222);
  insert into Dispone
  value ('lnismr60a11a123b', '2021-02-20', '18:15', 222222);
  insert into Dispone
  value ('nglghm98a51a123b', '2021-02-09', '15:30', 333333);
  insert into Dispone
  value ('lnrfln66a11a123b', '2021-07-1', '08:23', 222222);
  insert into Dispone
  value ('leizml70a11a123b', '2021-03-03', '14:57', 555555);
  insert into Dispone
  value ('rtidgz85a51a123b', '2021-05-01', '15:45', 555555);
  insert into Dispone
  value ('fridpt11a11a123b', '2021-04-30', '20:35', 111111);
  insert into Dispone
  value ('brdstf86a11a123b', '2021-01-7', '11:00', 111111);
  insert into Dispone
  value ('gbrzpa91a11a123b', '2021-06-15', '16:17', 444444);
  insert into Dispone
  value ('gbrzpa91a11a123b', '2021-07-15', '09:20', 444444);

-- RiscontroAllergico
  insert into RiscontroAllergico
  value (987654, 'amoxicillina');
  insert into RiscontroAllergico
  value (123456, 'solfiti');

-- Vaccino
-- da rivedere

-- AppuntamentoVaccinale
-- da rivedere
-- idea possibile, se la dose di vaccino ha un id appuntamento vaccinale può avere una coppia tipo, id di attributi, dove id DEVE essere istanziato se la data odierna è successiva alla data dell'appuntamento
  insert into AppuntamentoVaccinale
  value ('2021-01-15', '09:00', 222222, 'leizml70a11a123b', '', 'lnismr60a11a123b');
  insert into AppuntamentoVaccinale
  value ('2021-02-20', '18:15', 222222, 'leizml70a11a123b', '', 'lnismr60a11a123b');
  insert into AppuntamentoVaccinale
  value ('2021-02-09', '15:30', 333333, 'fdamnt60a51a123b', '', 'nglghm98a51a123b');
  insert into AppuntamentoVaccinale
  value ('2021-07-1', '08:23', 222222, 'leizml70a11a123b', '', 'lnrfln66a11a123b');
  insert into AppuntamentoVaccinale
  value ('2021-03-03', '14:57', 555555, 'mtacts89a11a123b', '', 'rtidgz85a51a123b');
  insert into AppuntamentoVaccinale
  value ('2021-05-01', '15:45', 555555, 'mtacts89a11a123b', '', 'rtidgz85a51a123b');
  insert into AppuntamentoVaccinale
  value ('2021-04-30', '20:35', 111111, 'piobrc85a11a123b', '', 'fridpt11a11a123b');
  insert into AppuntamentoVaccinale
  value ('2021-01-7', '11:00', 111111, 'piobrc85a11a123b', '', 'brdstf86a11a123b');
  insert into AppuntamentoVaccinale
  value ('2021-06-15', '16:17', 444444, 'antdgv70a11a123b', '', 'gbrzpa91a11a123b');
  insert into AppuntamentoVaccinale
  value ('2021-07-15', '09:20', 444444, 'antdgv70a11a123b', '', 'gbrzpa91a11a123b');

-- Possiede
-- da rivedere

-- Report
-- da rivedere

commit;