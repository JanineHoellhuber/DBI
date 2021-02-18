create table Patienten_Gruppe(
    PG_ID Number not null primary key,
    PatientengruppenName varchar2(50)
); 


ALTER TABLE patient
ADD PG_ID Number references Patienten_Gruppe(PG_ID)


ALTER TABLE arzt
ADD a_name varchar2(50);

create table Behandlungs_Gruppe(
    BG_ID Number not null primary key,
    BehandlungsgruppenName varchar2(50)
); 

ALTER TABLE behandlung
ADD BG_ID Number references Behandlungs_Gruppe(BG_ID)
