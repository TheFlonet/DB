begin;

-- Domini

create domain CodiceFiscale as varchar(16) not null
check (length(value)=16);

create domain TipoCittadino as varchar(32) default 'altro'
check (value='personale sanitario' or value='personale scolastico' or value='soggetti fragili' or value='altro');

create domain TipoMedico as varchar(32) default 'medico di base'
check (value='altro medico' or value='medico di base');

create domain NomeVaccino as varchar(32) not null
check (value='covidin' or value='COVIDIN' or value='coronax' or value='CORONAX' or value='flustop' or value='FLUSTOP');

create domain NomeAllergia as varchar(64)
check (value='amoxicillina' or value='a' or value='b' or value='c');

-- Tabelle

create table Cittadino (
  CF CodiceFiscale primary key,
  Nome varchar(32) not null,
  Cognome varchar(32) not null,
  Eta integer not null check (Eta>=0),
  Email varchar(128),
  Cellulare integer check (Cellulare>1000000000 and Cellulare<9999999999),
  Indirizzo varchar(128) not null,
  Citta varchar(64) not null,
  PrecedentePositività boolean not null default FALSE,
  Tipo TipoCittadino not null
);

create table CentroVaccinale (
  ID integer primary key,
  Indirizzo varchar(128) not null,
  Citta varchar(64) not null
);

create table Medico (
  CF CodiceFiscale primary key,
  Tipo TipoMedico not null,
  Centro integer not null,
  AbilitazioneSingolaDose boolean not null,
  foreign key (CF) references Cittadino (CF)
);

create table Lotto (
  ID integer primary key,
  DataScadenza date not null,
  DataProduzione date not null,
  Tipo NomeVaccino not null
);

create table Report (
  Codice integer primary key,
  Luogo integer not null,
  DataReport date not null,
  Lotto integer not null,
  Vaccino NomeVaccino not null,
  foreign key (Luogo) references CentroVaccinale (ID),
  foreign key (Lotto) references Lotto (ID)
);

create table Allergia (
  Nome NomeAllergia primary key
);

create table Vaccino (
  Nome NomeVaccino primary key,
  EtaMin integer not null check (EtaMin>=0),
  EtaMax integer not null check (EtaMax>=0 and EtaMax>EtaMin),
  Efficacia real not null check (Efficacia>0 and Efficacia<=100),
  DosiRichieste integer not null check (DosiRichieste=1 or DosiRichieste=2),
  Lotto integer not null,
  IntervalloSomministrazione integer,
  foreign key (Lotto) references Lotto (ID)
);

create table AppuntamentoVaccinale (
  DataAppuntamento date,
  Ora time,
  Centro integer,
  Medico CodiceFiscale,
  Vaccino NomeVaccino,
  Cittadino CodiceFiscale,
  primary key (DataAppuntamento, Ora, Centro),
  foreign key (Centro) references CentroVaccinale (ID),
  foreign key (Medico) references Medico (CF),
  foreign key (Vaccino) references Vaccino (Nome),
  foreign key (Cittadino) references Cittadino (CF)
);

create table Dispone (
  Cittadino CodiceFiscale,
  DataAppuntamento date,
  Ora time,
  Centro integer,
  primary key (Cittadino, DataAppuntamento, Ora, Centro),
  foreign key (Centro) references CentroVaccinale (ID),
  foreign key (Cittadino) references Cittadino (CF)
);

create table Possiede (
  Centro integer,
  Vaccino NomeVaccino,
  NumFiale integer not null check (NumFiale>=0),
  primary key (Centro, Vaccino),
  foreign key (Centro) references CentroVaccinale (ID),
  foreign key (Vaccino) references Vaccino (Nome)
);

create table RiscontroAllergico (
  Lotto integer,
  Allergia NomeAllergia,
  primary key (Lotto, Allergia),
  foreign key (Lotto) references Lotto (ID),
  foreign key (Allergia) references Allergia (Nome)
);

create table Dichiara (
  Cittadino CodiceFiscale,
  Allergia NomeAllergia,
  primary key (Cittadino, Allergia),
  foreign key (Cittadino) references Cittadino (CF),
  foreign key (Allergia) references Allergia (Nome)
);

commit;