-- Domini

create domain codice_fiscale  as varchar(16) not null check (length(value)=16);
create domain NomeVaccino as ENUM('Covidin', 'Coronax', 'Flustop');

-- Sequenze
create sequence id_centro 
increment by 1111 start 1111;
create sequence id_allergia 
increment by 1 start 1;
create sequence id_vaccino 
increment by 1 start 1;

-- Tabelle

create table cittadino (
  cf codice_fiscale  primary key,
  nome varchar(32) not null,
  cognome varchar(32) not null,
  eta integer not null check (eta>=0),
  email varchar(128) unique,
  cellulare integer unique check (cellulare>3200000000 and cellulare<3939999999),
  indirizzo varchar(128) not null,
  citta varchar(64) not null,
  precedente_positivita boolean not null default FALSE,
  tipo ENUM('personale sanitario', 'personale scolastico', 'soggetto fragile', 'altro') not null default 'altro',
  check (cellulare is not null or email is not null)
);
/* 
Nota sugli attributi città:
al fine di evitare la ripetizione di una stringa per decine di migliaia di volte, in un contesto reale sarebbe da valutare
la creazione di una tabella città (con id, nome e opzionalmente altri parametri) a cui riferirsi tramite id 
Discorsi analogo potrebbe essere fatto con l'attributo indirizzo, creando un'entità indirizzo collegata a città tramite associazione
tuttavia in questo caso il risparmio in termini di spazio sarebbe minore in quanto 
VAL(indirizzo, cittadino) << VAL(città, cittadino)
Il discorso è analogo in tutti i casi in cui trattiamo le città o gli indirizzi
*/

create table centro_vaccinale (
  id integer default nextval('id_centro') primary key,
  indirizzo varchar(128) not null,
  citta varchar(64) not null, 
  unique (indirizzo, città)
);

create table medico (
  cf codice_fiscale  primary key,
  tipo ENUM('altro medico', 'medico di base') not null,
  centro integer not null,
  abilitazione_singola_dose boolean not null,
  foreign key (cf) references cittadino (cf),
  check (
    case 
    when abilitazione_singola_dose=TRUE then tipo='altro medico'
    else tipo='medico di base'
    end
  )
);

create table lotto (
  id varchar(6) check (length(id)=6), -- supponiamo che gli id siano alfanumerici e di lunghezza costante
  tipo nome_vaccino,
  num_dosi integer not null default 500 check (num_dosi>0),
  data_produzione date not null,
  data_scadenza date not null,
  primary key (id, tipo)
);
/*
per discorso dosi
tabella lotto ha il numero di dosi
tabella tra centro e lotto ha un numero dosi consumate per un dato lotto 
(relazione possiede da cambiare, un centro possiede i lotti)
*/

create table tipo_vaccino (
  id integer default nextval('id_vaccino') primary key,
  nome nome_vaccino unique,
  eta_min integer not null check (eta_min>=0),
  eta_max integer not null check (eta_max>eta_min),
  efficacia real not null check (efficacia>0 and efficacia<=100),
  dosi_richieste integer not null check (dosi_richieste=1 or dosi_richieste=2),
  intervallo_somministrazione integer default null check (intervallo_somministrazione>0 or intervallo_somministrazione is null),
  check (
    case
    when dosi_richieste=1 then intervallo_somministrazione is null
    else intervallo_somministrazione is not null
    end
  )
);

create table appuntamento_vaccinale (
  data_appuntamento date,
  ora time,
  centro integer,
  medico codice_fiscale ,
  lotto varchar(6) not null,
  cittadino codice_fiscale  not null, 
  /*
  si ipotizza che gli appuntamenti vaccinali siano creati in funzione del cittadino
  e non che vengano prima creati i vari appuntamenti e in un secondo momento associati ai cittadini
  */
  primary key (data_appuntamento, ora, centro),
  foreign key (centro) references centro_vaccinale (id),
  foreign key (medico) references medico (cf),
  foreign key (lotto) references lotto(id),
  -- foreign key (Vaccino) references Vaccino (Nome),
  foreign key (cittadino) references cittadino (cf),
  check (cittadino <> medico)
);

create table possiede_dosi (
  centro integer,
  vaccino integer,
  num_dosi integer not null check (num_dosi>=0),
  -- da rendere consistente, ogni volta che viene somministrata una dose va sottratto 1
  primary key (centro, vaccino),
  foreign key (centro) references centro_vaccinale (id),
  foreign key (vaccino) references vaccino (id)
);

create table report (
  centro integer not null,
  data_report date not null,
  lotto integer not null,
  vaccino integer not null,
  cittadino codice_fiscale  not null,
  medico codice_fiscale  not null,
  allergia integer not null,
  foreign key (centro) references centro_vaccinale (id),
  foreign key (lotto) references lotto (id),
  foreign key (vaccino) references vaccino (id),
  foreign key (cittadino) references cittadino (cf),
  foreign key (medico) references medico (cf),
  foreign key (allergia) references allergi(id)
  primary key (cittadino, data_report)
);