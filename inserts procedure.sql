create or replace PROCEDURE PROCEDURE_ÄRZTEZENTRUM AS 
personal_id number;
personaln number;
personal_name varchar2(50);
type personalarray IS VARRAY(20) OF VARCHAR2(60);
personal personalarray;
respersonal varchar2(50);
numberp number;
countp number := 0;

arztid number;
bereich number;
bereichname varchar2(50);
type bereicharray IS VARRAY(20) OF VARCHAR2(60);
bereiche bereicharray;
resbereich varchar2(50);
numberb number;
countb number := 0;

hilfspersonalid number;
hilfspersonaln number;
ausbildung_hilfspersonal varchar(50); 
type hilfspersonalarray IS VARRAY(10) OF VARCHAR2(60);
hilfspers hilfspersonalarray;
reshilfspersonal varchar2(50);
numberh number;
counth number := 0;
 
tool_id number;
tooln number;
tool_name varchar(50);
type toolarray IS VARRAY(20) OF VARCHAR2(60);
tools toolarray;
restool varchar2(50);
numbert number;
countt number := 0;

patientid number;
patientn number;
patientname varchar(50);
type patientarray IS VARRAY(20) OF VARCHAR2(60);
patients patientarray;
respatient varchar2(50);
numberpa number;
countpa number := 0;
geburts_datum date;
behandlungs_start date;
behandlungs_ende date;

behandlungsraumid number;
behandlungsraumn number;
behandlungsraum_name varchar(50);
type behandlungsraumnamearray IS VARRAY(10) OF VARCHAR2(60);
behandlungsraums behandlungsraumnamearray;
resbehandlungsraumname varchar2(50);
numberbe number;
countbe number := 0;

behandlungsid number;
behandlungs_date date;
numberbeh number;
countbeh number := 0;

BEGIN
  FOR counter IN 1..100
LOOP

SELECT ROUND(DBMS_RANDOM.VALUE(1,100)) into personaln FROM dual;
personal := personalarray('Huber Steiner ', 'Lisa Maier ', 'Herbert Klein ', 'Eva Neuer ', 'Franz Hofer ', 'Sisi Vogel ', 'Laura Traum ', 'Hans Peter ', 'Andreas Söllner ', 'Wolfgang Hölzl ', 'Roland Rogers ', 'Gerda Düringer ', 'Georg Fäller ', 'Reinhard Groß ', 'Felix Zehl ', 'Thomas Hehr ', 'Dominik Freud ', 'Angela Pom ', 'Jasmin Salta ', 'David Loch ');

SELECT ROUND(DBMS_RANDOM.VALUE(1,100)) into bereich FROM dual;
bereiche := bereicharray('Astrologie Station ', 'Musiktherapie Station ', 'Radiologie Station ', 'Neurologie Station ', 'Knochentherapie Station ', 'Kopftherapie Station ', 'Intensivstation Station ', 'Coronatherapie Station ', 'Anatomie Station ', 'Augenheilkunde Station ', 'Biochemie Station ', 'Allgemeinmedizin Station ', 'Georg Station ', 'Anästhesiologie Station ', 'Chirurgie Station ', 'Humangenetik Station ', 'Virologie Station ', 'Nuklearmedizin Station ', 'Pathologie Station ', 'Pharmakologie Station ');

SELECT ROUND(DBMS_RANDOM.VALUE(1,100)) into hilfspersonaln FROM dual;
hilfspers := hilfspersonalarray('Krankenschwester ', 'Pfleger ', 'Arzthelfer ', 'Sanitäter ', 'Coronamassentester ', 'Medizintechniker ', 'Therapist ', 'Stationskoordinator ', 'Versorgungsassistent ', 'Anästhesiepflege ');


SELECT ROUND(DBMS_RANDOM.VALUE(1,100)) into tooln FROM dual;
tools := toolarray('Röntgengerät ', 'OP-Tisch ', 'Knochensäge ', 'Stetoskop ', 'Schere ', 'Kompresse ', 'Vinylhandschuhe ', 'Wundreinigungsbürste ', 'Einmal-Skalpell ', 'Op-Faden ', 'Röngtengerät', 'Krankenhausbett', 'humanmedizinische Instrumente ', 'Transfusion ', 'Herzschrittmacher ', 'Lasermaschine ', 'Rollstühle ', 'Sehhilfen ', 'Dialyse ', 'Infusion ');


SELECT ROUND(DBMS_RANDOM.VALUE(1,100)) into behandlungsraumn FROM dual;
behandlungsraums := behandlungsraumnamearray('Röntgenraum ', 'OP-Saal ', 'Wartezimmer ', 'Aufnahmebereich ', 'Schockraum ', 'Kreissaal ', 'HNO-Raum ', 'Zahnchirugie-Raum ', 'Herzuntersuchungsraum ', 'CT ');

SELECT TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(TO_DATE('01-01-2000','dd-mm-yyyy'),'J') ,TO_CHAR(TO_DATE('01-01-2020','dd-mm-yyyy'),'J'))),'J') into geburts_datum FROM DUAL;
SELECT TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(TO_DATE('01-12-2020','dd-mm-yyyy'),'J') ,TO_CHAR(TO_DATE('01-05-2021','dd-mm-yyyy'),'J'))),'J') into behandlungs_start FROM DUAL;
SELECT TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(TO_DATE('01-12-2020','dd-mm-yyyy'),'J') ,TO_CHAR(TO_DATE('01-05-2021','dd-mm-yyyy'),'J'))),'J') into behandlungs_ende FROM DUAL;



SELECT ROUND(DBMS_RANDOM.VALUE(1,100)) into patientn FROM dual;
patients := patientarray('Vanessa Huber ', 'Tanja Müller ', 'Tom Neu ', 'Peter Lauf ', 'Gerald Bor ', 'Max Mustermann ', 'Pia Schneider ', 'Jakob Koch ', 'Alfred Schmidt ', 'Beate Schäfer ', 'Becky Schwarz ', 'Bella Wolf ', 'Emil Lang ', 'Sabine Krüger ', 'Elke Hofmann ', 'Edward Lehmann ', 'Maria Zimmermann ', 'Mandy Fuchs ', 'Riley König ', 'Rudy Keller ');


SELECT TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(TO_DATE('01-12-2020','dd-mm-yyyy'),'J') ,TO_CHAR(TO_DATE('01-05-2021','dd-mm-yyyy'),'J'))),'J') into behandlungs_date FROM DUAL;

countp := countp + 1;
personal_id := countp;
SELECT ROUND(DBMS_RANDOM.VALUE(1,20)) into numberp FROM dual;
personal_name := TO_CHAR(personaln); 

respersonal := CONCAT(personal(numberp), personal_name);

insert into Personal(personalid, personalname)
						values(personal_id, respersonal);


countb := countb + 1;
arztid := countb;
SELECT ROUND(DBMS_RANDOM.VALUE(1,20)) into numberb FROM dual;
bereichname := TO_CHAR(bereich); 

resbereich := CONCAT(bereiche(numberb), bereichname);

insert into Arzt(arzt_id, PERSONALID, BEREICH)
						values(arztid, countb, resbereich);


counth := counth + 1;
hilfspersonalid := counth;
SELECT ROUND(DBMS_RANDOM.VALUE(1,10)) into numberh FROM dual;
ausbildung_hilfspersonal := TO_CHAR(hilfspersonaln); 

reshilfspersonal := CONCAT(hilfspers(numberh), ausbildung_hilfspersonal);

insert into Hilfspersonal(hilfspersonal_id, PERSONALID, ausbildunghilfspersonal)
						values(hilfspersonalid, counth, reshilfspersonal);


countt := countt + 1;
tool_id := countt;
SELECT ROUND(DBMS_RANDOM.VALUE(1,20)) into numbert FROM dual;
tool_name := TO_CHAR(tooln); 

restool := CONCAT(tools(numbert), tool_name);

insert into Tool(toolid, toolname)
						values(tool_id, restool);


countbe := countbe + 1;
behandlungsraumid := countbe;
SELECT ROUND(DBMS_RANDOM.VALUE(1,10)) into numberbe FROM dual;
behandlungsraum_name := TO_CHAR(behandlungsraumn); 

resbehandlungsraumname := CONCAT(behandlungsraums(numberbe), behandlungsraum_name);

insert into behandlungsraum(behandlungsraum_id, behandlungsraumname ,toolid)
						values(behandlungsraumid, resbehandlungsraumname , countbe);


countpa := countpa + 1;
patientid := countpa;
SELECT ROUND(DBMS_RANDOM.VALUE(1,10)) into numberpa FROM dual;
patientname := TO_CHAR(patientn); 

respatient := CONCAT(patients(numberpa), patientname);

insert into patient(patient_id, name ,geburtsdatum, behandlungstart, behandlungende)
						values(patientid, respatient, geburts_datum , behandlungs_start, behandlungs_ende);


countbeh := countbeh + 1;
behandlungsid := countbeh;
insert into behandlung(behandlungs_id, behandlungsraum_id ,patient_id, personalid, behandlungdate, toolid)
						values(behandlungsid, countbeh, countbeh , countbeh, behandlungs_date, countbeh);


end loop;

END PROCEDURE_ÄRZTEZENTRUM;
