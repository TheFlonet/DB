-- Domini

create domain CodiceFiscale as varchar(16) not null check (length(value)=16);
create domain NomeVaccino as ENUM('Covidin', 'Coronax', 'Flustop');

-- Sequenze
create sequence IdCentro 
increment by 1111 start 1111;
create sequence IdAllergia 
increment by 1 start 1;

-- Tabelle

create table Cittadino (
  CF CodiceFiscale primary key,
  Nome varchar(32) not null,
  Cognome varchar(32) not null,
  Eta integer not null check (Eta>=0),
  Email varchar(128) unique,
  Cellulare integer unique check (Cellulare>3200000000 and Cellulare<3939999999),
  Indirizzo varchar(128) not null,
  Citta varchar(64) not null,
  PrecedentePositivita boolean not null default FALSE,
  Tipo ENUM('personale sanitario', 'personale scolastico', 'soggetto fragile', 'altro') not null, --Tipo TipoCittadino not null, -- meglio smallint per identificare con codice (es. 0, 1, ...)
  check (Cellulare is not null or Email is not null)
);
/* 
Nota sugli attributi città:
al fine di evitare la ripetizione di una stringa per decine di migliaia di volte, in un contesto reale sarebbe da valutare
la creazione di una tabella città (con id, nome e opzionalmente altri parametri) a cui riferirsi tramite id 
Discorsi analogo potrebbe essere fatto con l'attributo indirizzo, creando un'entità indirizzo collegata a città tramite associazione
tuttavia in questo caso il risparmio in termini di spazio sarebbe minore in quanto 
VAL(Indirizzo, Cittadino) << VAL(Città, Cittadino)
Il discorso è analogo in tutti i casi in cui trattiamo le città o gli indirizzi
*/

create table CentroVaccinale (
  ID integer default nextval('IdCentro') primary key,
  Indirizzo varchar(128) not null,
  Citta varchar(64) not null, 
  unique (Indirizzo, Città)
);

create table Medico (
  CF CodiceFiscale primary key,
  Tipo ENUM('altro medico', 'medico di base') not null, -- Tipo TipoMedico not null,
  Centro integer not null,
  AbilitazioneSingolaDose boolean not null,
  foreign key (CF) references Cittadino (CF),
  check (
    case 
    when AbilitazioneSingolaDose=TRUE then Tipo='altro medico'
    else Tipo='medico di base'
    end
  )
);

create table Lotto (
  ID varchar(6) check (length(ID)=6), -- supponiamo che gli id siano alfanumerici e di lunghezza costante
  Tipo NomeVaccino,
  NumDosi integer not null default 500 check (NumDosi>0),
  DataProduzione date not null,
  DataScadenza date not null,
  primary key (ID, Tipo) -- id e tipo sono implicitamente dichiarati not null
);
/*
per discorso dosi
tabella lotto ha il numero di dosi
tabella tra centro e lotto ha un numero dosi consumate per un dato lotto 
(relazione possiede da cambiare, un centro possiede i lotti)
*/

create table Allergia (
  ID integer default nextval('IdAllergia') primary key,
  Nome varchar(32) primary key 
  on update cascade
  on delete cascade -- cascade da valutare (cambia in base alle ipotesi che assumiamo [HP da specificare])
);

create table Vaccino (
  Nome NomeVaccino primary key,
  EtaMin integer not null check (EtaMin>=0),
  EtaMax integer not null check (EtaMax>=0 and EtaMax>EtaMin),
  Efficacia real not null check (Efficacia>0 and Efficacia<=100),
  DosiRichieste integer not null check (DosiRichieste=1 or DosiRichieste=2),
  IntervalloSomministrazione integer,
  check (
    case
    when DosiRichieste=1 then IntervalloSomministrazione is null
    else IntervalloSomministrazione is not null
    end
  )
);

create table AppuntamentoVaccinale (
  DataAppuntamento date,
  Ora time,
  Centro integer,
  Medico CodiceFiscale,
  Vaccino NomeVaccino, -- forse va messo il lotto e non il vaccino 
  Cittadino CodiceFiscale not null, 
  /*
  si ipotizza che gli appuntamenti vaccinali siano creati in funzione del cittadino
  e non che vengano prima creati i vari appuntamenti e in un secondo momento associati ai cittadini
  */
  primary key (DataAppuntamento, Ora, Centro),
  foreign key (Centro) references CentroVaccinale (ID),
  foreign key (Medico) references Medico (CF),
  foreign key (Vaccino) references Vaccino (Nome),
  foreign key (Cittadino) references Cittadino (CF),
  check (Cittadino <> Medico)
);

create table Possiede (
  Centro integer,
  Vaccino NomeVaccino,
  NumDosi integer not null check (NumDosi>=0),
  -- da rendere consistente, ogni volta che viene somministrata una dose va sottratto 1
  primary key (Centro, Vaccino),
  foreign key (Centro) references CentroVaccinale (ID),
  foreign key (Vaccino) references Vaccino (Nome)
);

create table RiscontroAllergico (
  Lotto integer,
  Allergia integer,
  primary key (Lotto, Allergia),
  foreign key (Lotto) references Lotto (ID),
  foreign key (Allergia) references Allergia (ID)
);

create table DichiaraAllergia (
  Cittadino CodiceFiscale,
  Allergia integer,
  primary key (Cittadino, Allergia),
  foreign key (Cittadino) references Cittadino (CF),
  foreign key (Allergia) references Allergia (ID)
);

-- emana un report che indica data e luogo della vaccinazione, 
-- tipo vaccino e numero lotto che hanno causato l’allergia al paziente in questione.

create table Report (
  Centro integer not null,
  DataReport date not null,
  Lotto integer not null,
  Vaccino NomeVaccino not null,
  Cittadino CodiceFiscale not null,
  Medico CodiceFiscale not null,
  Allergia integer not null,
  foreign key (Centro) references CentroVaccinale (ID),
  foreign key (Lotto) references Lotto (ID),
  foreign key (Vaccino) references Vaccino (Nome),
  foreign key (Cittadino) references Cittadino (CF),
  foreign key (Medico) references Medico (CF),
  foreign key (Allergia) references Allergia (ID)
  primary key (DataReport, Vaccino) -- controllare se basta
);