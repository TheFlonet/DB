begin;

-- Cittadino
  -- nota: essendo dati fittizi si sceglie di mettere come suffisso di CF a11a123b (o 51 nel caso di donne) 
  -- e rendere coerente solo la prima parte
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('dptfri11a11a123b', 'Fiero', 'Di Pietro', 10, null, 3290145027, 'Via del sole 7', 'Torino', FALSE, 'altro');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('brmpal01a11a123b', 'Palamede', 'Bramati', 20, 'p.bramati@email.com', null, 'Strada portorosso 12', 'Genova', TRUE, 'personale sanitario');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('ghmngl98a51a123b', 'Angela', 'Aghemio', 23, null, 3376295481, 'Corso san giovanni 138', 'Roma', FALSE, 'personale scolastico');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('smrlni60a11a123b', 'Lino', 'Sommariva', 61, null, 3292674805, 'Stradale torino', 'Milano', FALSE, 'soggetto fragile');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('tnorsl76a51a123b', 'Rossella', 'Tonani', 45, 'ross.tonani@gmail.com', null, 'Via tempesta 5', 'Milano', TRUE, 'altro');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('zpagbr91a11a123b', 'Gabriele', 'Zappa', 30, null, 3902837401, 'Via alighieri 1a', 'Napoli', FALSE, 'altro');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('dflflp95a11a123b', 'Filippo', 'De Filippi', 26, 'defilippi.fil@yahoo.com', null, 'Via de medici 90', 'Napoli', TRUE, 'altro');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('zmllei70a11a123b', 'Elio', 'Zemello', 51, 'zemee51@libero.it', null, 'Via arsenale 5', 'Milano', FALSE, 'personale sanitario');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('stfbrd86a11a123b', 'Berardo', 'Stefanelli', 35, null, 3290394850, 'Via garibaldi 10', 'Torino', TRUE, 'personale scolastico');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('sprsmn90a11a123b', 'Simone', 'Sparaventi', 31, 'ventisimone_31@email.net', null, 'Via sapienza 50', 'Roma', FALSE, 'altro');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('vsclrn40a11a123b', 'Lorenzo', 'Viscomi', 81, null, 3592531876, 'Via del sentiero', 'Milano', TRUE, 'soggetto fragile');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('mzania69a11a123b', 'Iana', 'Mazzuia', 52, 'maziana_2@gmail.com', null, 'Strada della repubblica', 'Torino', FALSE, 'altro');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('brcpio85a11a123b', 'Pippo', 'Burchi', 36, null, 3236987459, 'Corso caselle 70', 'Torino', TRUE, 'personale sanitario');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('flnlnr66a11a123b', 'Leonardo', 'Filano', 55, 'fil.leo66@gmail.co,', null, 'Corso cesare 177', 'Milano', FALSE, 'personale sanitario');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('dgzrti85a51a123b', 'Rita', 'De Guzzi', 36, null, 3596542587, 'Via dei mercanti 8', 'Genova', FALSE, 'altro');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('mntfda60a51a123b', 'Fadia', 'Menta', 61, 'f.menta@virgilio.it', null, 'Strada del colle 3', 'Roma', TRUE, 'personale sanitario');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('dgvant70a11a123b', 'Antonio', 'De Giovanni', 51, null, 3549631478, 'Corso romano 75', 'Napoli', FALSE, 'personale sanitario');
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('ctsmta89a11a123b', 'Matteo', 'Actis', 32, 'mattewactis@gmail.com', null, 'Via del mare 5', 'Genova', TRUE, 'personale sanitario');

-- Centro Vaccinale
  insert into centro_vaccinale (indirizzo, citta)
  values ('Via ritrovata 15', 'Torino');
  insert into centro_vaccinale (indirizzo, citta)
  values ('Via retta 87', 'Milano');
  insert into centro_vaccinale (indirizzo, citta)
  values ('Via Roma 1', 'Roma');
  insert into centro_vaccinale (indirizzo, citta)
  values ('Via della speranza 42', 'Napoli');
  insert into centro_vaccinale (indirizzo, citta)
  values ('Via degli artisti 7', 'Genova');

-- Medico
  insert into medico (cod, tipo, centro, abilitazione_singola_dose)
  values (8, 'medico di base', 2, FALSE);
  insert into medico (cod, tipo, centro, abilitazione_singola_dose)
  values (14, 'altro medico', 2, TRUE);
  insert into medico (cod, tipo, centro, abilitazione_singola_dose)
  values (13, 'medico di base', 1, FALSE);
  insert into medico (cod, tipo, centro, abilitazione_singola_dose)
  values (16, 'altro medico', 3, TRUE);
  insert into medico (cod, tipo, centro, abilitazione_singola_dose)
  values (17, 'altro medico', 4, TRUE);
  insert into medico (cod, tipo, centro, abilitazione_singola_dose)
  values (18, 'altro medico', 5, TRUE);

-- Vaccino
  insert into tipo_vaccino (nome, eta_min, eta_max, efficacia, dosi_richieste, intervallo_somministrazione)
  values ('Covidin', 12, 85, 90, 2, 50);
  insert into tipo_vaccino (nome, eta_min, eta_max, efficacia, dosi_richieste, intervallo_somministrazione)
  values ('Coronax', 45, 150, 99, 2, 40);
  insert into tipo_vaccino (nome, eta_min, eta_max, efficacia, dosi_richieste)
  values ('Flustop', 65, 100, 95, 1);

-- Lotto
  insert into lotto
  values ('cn0987', 1, 500, '2020-11-05', '2021-02-23');
  insert into lotto (cod, vaccino, data_produzione, data_scadenza)
  values ('1234cx', 2, '2021-01-21', '2021-04-17');
  insert into lotto
  values ('f4567p', 3, 500, '2021-03-13', '2021-06-30');

-- Appuntamento Vaccinale
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-01-15', '09:00', 2, 'cn0987', 4);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-02-20', '18:15', 2, 'cn0987', 4);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-02-09', '15:30', 3, '1234cx', 3);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-07-1', '08:23', 2, 'cn0987', 14);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-03-03', '14:57', 5, 'cn0987', 15);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-05-01', '15:45', 5, 'cn0987', 15);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-04-30', '20:35', 1, 'cn0987', 1);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-01-7', '11:00', 1, 'f4567p', 9);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-06-15', '16:17', 4, 'cn0987', 6);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-07-15', '09:20', 4, 'cn0987', 6);
  insert into appuntamento_vaccinale (data_appuntamento, ora, centro, lotto, cittadino)
  values ('2021-03-03', '09:20', 2, '1234cx', 8);

-- Possiede Dosi
  insert into possiede_dosi
  values (1, 3, 75000);
  insert into possiede_dosi
  values (2, 1, 125000);
  insert into possiede_dosi
  values (3, 2, 9000);
  insert into possiede_dosi
  values (4, 1, 30000);
  insert into possiede_dosi
  values (5, 1, 500);

-- Allergia
  insert into allergia
  values ('lattosio', 1);
  insert into allergia
  values ('amoxicillina', 8);
  insert into allergia
  values ('nichel', 14);

-- Report
  insert into report (appuntamento_vaccinale, medico, centro, data_report, vaccino)
  values (11, 14, 2, '2021-03-03', 2);
  insert into report (appuntamento_vaccinale, medico, centro, data_report, vaccino)
  values (6, 18, 5, '2021-05-01', 2);

commit;