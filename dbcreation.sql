-- Tipi

create type tipo_cittadino as ENUM('personale sanitario', 'personale scolastico', 'soggetto fragile', 'altro');
create type tipo_medico as ENUM('altro medico', 'medico di base');
create type nome_vaccino as ENUM('Covidin', 'Coronax', 'Flustop');

-- Sequenze
create sequence if not exists id_vaccino 
increment by 1 start 1;
create sequence if not exists id_cittadino 
increment by 1 start 1;
create sequence if not exists id_appuntamento_vaccinale 
increment by 1 start 1;
create sequence if not exists id_centro 
increment by 1 start 1;

-- Tabelle

create table if not exists cittadino (
  cod integer default nextval('id_cittadino') primary key,
  cf varchar(16) not null check (length(cf)=16) unique,
  nome varchar(32) not null,
  cognome varchar(32) not null,
  eta integer not null check (eta>=0),
  email varchar(128) unique,
  cellulare bigint unique check (cellulare>3200000000 and cellulare<3939999999),
  indirizzo varchar(128) not null,
  citta varchar(64) not null,
  precedente_positivita boolean not null default FALSE,
  tipo tipo_cittadino not null default 'altro',
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

create table if not exists centro_vaccinale (
  cod integer default nextval('id_centro') primary key,
  indirizzo varchar(128) not null,
  citta varchar(64) not null, 
  unique (indirizzo, citta)
);

create table if not exists tipo_vaccino (
  cod integer default nextval('id_vaccino') primary key,
  nome varchar(32) unique,
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

create table if not exists medico (
  cod integer primary key,
  tipo tipo_medico not null,
  centro integer not null,
  abilitazione_singola_dose boolean not null,
  foreign key (cod) references cittadino (cod) on delete cascade on update cascade,
  check (
    case 
    when abilitazione_singola_dose=TRUE then tipo='altro medico'
    else tipo='medico di base'
    end
  )
);

create table if not exists lotto (
  cod varchar(6) check (length(cod)=6) primary key, 
  -- supponiamo che gli id siano alfanumerici e di lunghezza costante
  vaccino integer,
  num_dosi integer not null default 500 check (num_dosi>0),
  data_produzione date not null,
  data_scadenza date not null check (data_scadenza > data_produzione),
  unique (data_produzione, data_scadenza, vaccino),
  foreign key (vaccino) references tipo_vaccino (cod) on update cascade
);

create table if not exists appuntamento_vaccinale (
  cod integer default nextval('id_appuntamento_vaccinale') primary key,
  data_appuntamento date,
  ora time,
  centro integer,
  lotto varchar(6) not null,
  cittadino integer not null, 
  /*
  si ipotizza che gli appuntamenti vaccinali siano creati in funzione del cittadino
  e non che vengano prima creati i vari appuntamenti e in un secondo momento associati ai cittadini
  */
  foreign key (centro) references centro_vaccinale (cod) on update cascade,
  foreign key (lotto) references lotto(cod) on update cascade,
  foreign key (cittadino) references cittadino (cod) on delete cascade on update cascade,
  unique (data_appuntamento, ora, centro)
);

create table if not exists possiede_dosi (
  centro integer,
  vaccino integer,
  num_dosi integer not null check (num_dosi>=0),
  -- da rendere consistente, ogni volta che viene somministrata una dose va sottratto 1
  primary key (centro, vaccino),
  foreign key (centro) references centro_vaccinale (cod) on update cascade,
  foreign key (vaccino) references tipo_vaccino (cod) on update cascade
);

create table if not exists allergia (
  nome varchar(128) not null,
  cittadino integer,
  foreign key (cittadino) references cittadino (cod) on delete cascade on update cascade
);

create table if not exists report (
  appuntamento_vaccinale integer not null,
  medico integer not null,
  centro integer not null,
  data_report date not null,
  vaccino integer not null,
  foreign key (centro) references centro_vaccinale (cod) on update cascade,
  foreign key (vaccino) references tipo_vaccino (cod),
  foreign key (medico) references medico (cod) on update cascade,
  foreign key (appuntamento_vaccinale) references appuntamento_vaccinale (cod),
  primary key (appuntamento_vaccinale)
);