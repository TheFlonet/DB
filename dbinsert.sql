begin;

-- Cittadino
  -- nota: essendo dati fittizi si sceglie di mettere come suffisso di CF a11a123b (o 51 nel caso di donne) 
  -- e rendere coerente solo la prima parte
  insert into cittadino (cf, nome, cognome, eta, email, cellulare, indirizzo, citta, precedente_positivita, tipo)
  values ('dptfri11a11a123b', 'Fiero', 'Di Pietro', 10, null, 3290145027, 'Via del sole 7', 'Torino', FALSE, 'altro');
  insert into cittadino
  values ('brmpal01a11a123b', 'Palamede', 'Bramati', 20, 'p.bramati@email.com', null, 'Strada portorosso 12', 'Genova', TRUE, 'personale sanitario');
  insert into cittadino
  values ('ghmngl98a51a123b', 'Angela', 'Aghemio', 23, null, 3376295481, 'Corso san giovanni 138', 'Roma', FALSE, 'personale scolastico');
  insert into cittadino
  values ('smrlni60a11a123b', 'Lino', 'Sommariva', 61, null, 3292674805, 'Stradale torino', 'Milano', FALSE, 'soggetto fragile');
  insert into cittadino
  values ('tnorsl76a51a123b', 'Rossella', 'Tonani', 45, 'ross.tonani@gmail.com', null, 'Via tempesta 5', 'Milano', TRUE, 'altro');
  insert into cittadino
  values ('zpagbr91a11a123b', 'Gabriele', 'Zappa', 30, null, 3902837401, 'Via alighieri 1a', 'Napoli', FALSE, 'altro');
  insert into cittadino
  values ('dflflp95a11a123b', 'Filippo', 'De Filippi', 26, 'defilippi.fil@yahoo.com', null, 'Via de medici 90', 'Napoli', TRUE, 'altro');
  insert into cittadino
  values ('zmllei70a11a123b', 'Elio', 'Zemello', 51, 'zemee51@libero.it', null, 'Via arsenale 5', 'Milano', FALSE, 'personale sanitario');
  insert into cittadino
  values ('stfbrd86a11a123b', 'Berardo', 'Stefanelli', 35, null, 3290394850, 'Via garibaldi 10', 'Torino', TRUE, 'personale scolastico');
  insert into cittadino
  values ('sprsmn90a11a123b', 'Simone', 'Sparaventi', 31, 'ventisimone_31@email.net', null, 'Via sapienza 50', 'Roma', FALSE, 'altro');
  insert into cittadino
  values ('vsclrn40a11a123b', 'Lorenzo', 'Viscomi', 81, null, 3592531876, 'Via del sentiero', 'Milano', TRUE, 'soggetto fragile');
  insert into cittadino
  values ('mzania69a11a123b', 'Iana', 'Mazzuia', 52, 'maziana_2@gmail.com', null, 'Strada della repubblica', 'Torino', FALSE, 'altro');
  insert into cittadino
  values ('brcpio85a11a123b', 'Pippo', 'Burchi', 36, null, 3236987459, 'Corso caselle 70', 'Torino', TRUE, 'personale sanitario');
  insert into cittadino
  values ('flnlnr66a11a123b', 'Leonardo', 'Filano', 55, 'fil.leo66@gmail.co,', null, 'Corso cesare 177', 'Milano', FALSE, 'personale sanitario');
  insert into cittadino
  values ('dgzrti85a51a123b', 'Rita', 'De Guzzi', 36, null, 3596542587, 'Via dei mercanti 8', 'Genova', FALSE, 'altro');
  insert into cittadino
  values ('mntfda60a51a123b', 'Fadia', 'Menta', 61, 'f.menta@virgilio.it', null, 'Strada del colle 3', 'Roma', TRUE, 'personale sanitario');
  insert into cittadino
  values ('dgvant70a11a123b', 'Antonio', 'De Giovanni', 51, null, 3549631478, 'Corso romano 75', 'Napoli', FALSE, 'personale sanitario');
  insert into cittadino
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
  insert into medico (cf, tipo, centro, abilitazione_singola_dose)
  values ('zmllei70a11a123b', 'medico di base', 2222, FALSE);
  insert into medico (cf, tipo, centro, abilitazione_singola_dose)
  values ('flnlnr66a11a123b', 'altro medico', 2222, TRUE);
  insert into medico (cf, tipo, centro, abilitazione_singola_dose)
  values ('brcpio85a11a123b', 'medico di base', 1111, FALSE);
  insert into medico (cf, tipo, centro, abilitazione_singola_dose)
  values ('mntfda60a51a123b', 'altro medico', 3333, TRUE);
  insert into medico (cf, tipo, centro, abilitazione_singola_dose)
  values ('dgvant70a11a123b', 'altro medico', 4444, TRUE);
  insert into medico (cf, tipo, centro, abilitazione_singola_dose)
  values ('ctsmta89a11a123b', 'altro medico', 5555, TRUE);

-- Lotto
  insert into lotto
  values ('cn0987', 'Covidin', 500, '2020-11-05', '2021-02-23');
  insert into lotto (cod, tipo, data_produzione, data_scadenza)
  values ('1234cx', 'Coronax', '2021-01-21', '2021-04-17');
  insert into lotto
  values ('f4567p', 'Flustop', 500, '2021-03-13', '2021-06-30');

-- Vaccino
  insert into tipo_vaccino (nome, eta_min, eta_max, efficacia, dosi_richieste, intervallo_somministrazione)
  values ('Covidin', 12, 85, 90, 2, 50);
  insert into tipo_vaccino (nome, eta_min, eta_max, efficacia, dosi_richieste, intervallo_somministrazione)
  values ('Coronax', 45, 150, 99, 2, 40);
  insert into tipo_vaccino (nome, eta_min, eta_max, efficacia, dosi_richieste)
  values ('Flustop', 65, 100, 95, 1);

-- Appuntamento Vaccinale
  insert into appuntamento_vaccinale
  values ('2021-01-15', '09:00', 2222, 'cn0987', 'smrlni60a11a123b');
  insert into appuntamento_vaccinale
  values ('2021-02-20', '18:15', 2222, 'cn0987', 'smrlni60a11a123b');
  insert into appuntamento_vaccinale
  values ('2021-02-09', '15:30', 3333, '1234cx', 'ghmngl98a51a123b');
  insert into appuntamento_vaccinale
  values ('2021-07-1', '08:23', 2222, 'cn0987', 'flnlnr66a11a123b');
  insert into appuntamento_vaccinale
  values ('2021-03-03', '14:57', 5555, 'cn0987', 'dgzrti85a51a123b');
  insert into appuntamento_vaccinale
  values ('2021-05-01', '15:45', 5555, 'cn0987', 'dgzrti85a51a123b');
  insert into appuntamento_vaccinale
  values ('2021-04-30', '20:35', 1111, 'cn0987', 'dptfri11a11a123b');
  insert into appuntamento_vaccinale
  values ('2021-01-7', '11:00', 1111, 'f4567p', 'stfbrd86a11a123b');
  insert into appuntamento_vaccinale
  values ('2021-06-15', '16:17', 4444, 'cn0987', 'zpagbr91a11a123b');
  insert into appuntamento_vaccinale
  values ('2021-07-15', '09:20', 4444, 'cn0987', 'zpagbr91a11a123b');
  insert into appuntamento_vaccinale
  values ('2021-03-03', '09:20', 2222, '1234cx', 'zmllei70a11a123b');

-- Possiede Dosi
  insert into possiede_dosi
  values (1111, 3, 75000);
  insert into possiede_dosi
  values (2222, 1, 125000);
  insert into possiede_dosi
  values (3333, 2, 9000);
  insert into possiede_dosi
  values (4444, 1, 30000);
  insert into possiede_dosi
  values (5555, 1, 500);

-- Allergia
insert into allergia
values ('lattosio', 'dptfri11a11a123b');
insert into allergia
values ('amoxicillina', 'zmllei70a11a123b');
insert into allergia
values ('nichel', 'flnlnr66a11a123b');

-- Report
insert into report
values (2222, '2021-03-03', '123cx', 2, 'zmllei70a11a123b', 2);

insert into report
values (5555, '2021-05-01', 'cn0987', 2, 'dgzrti85a51a123b', 2)

commit;