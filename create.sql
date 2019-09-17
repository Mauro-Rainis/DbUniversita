--drop table PianiDiStudio;
--drop table Esami;
--drop table Materie;	
--drop table Professori;
--drop table studenti;

create table Studenti
(
  Matricola char(6) primary key,
  Cognome varchar(30),
  Nome varchar(30),
  Facolta varchar(30)
);

create table Professori
(
  Matricola char(5) primary key,
  Cognome varchar(30),
  Nome varchar(30)
);

create table Materie
(
  Codice char(3) primary key,
  Facolta varchar(30),
  Denominazione varchar(100),
  Professore char(5) references Professori(matricola)
);

create table Esami
(
  Studente char(6) references Studenti(matricola),
  Materia char(3) references Materie(codice),
  Data date,
  Voto integer check (voto >= 18 and voto <= 30),
  Lode bit default 0,
  primary key (Studente, Materia),
  constraint chkLode check (not lode=1 or voto = 30) 
);

create table PianiDiStudio
(
  Studente char(6) references Studenti(matricola),
  Materia char(3) references Materie(codice),
  Anno integer,
  primary key (Studente, Materia)
);




