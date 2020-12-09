drop user sisi;

drop role arzt_verwaltung;
-----------------------------------------------
create user sisi identified by sisi;
create user franz identified by franz;


create role arzt_verwaltung;
create role patient_verwaltung;


grant create session to sisi, franz;


grant select, insert, update, delete 
on janine.arzt to arzt_verwaltung;

grant select, insert, update, delete 
on janine.personal to arzt_verwaltung;

grant select, insert, update, delete 
on janine.hilfspersonal to arzt_verwaltung;

grant select
 on janine.patient to patient_verwaltung;

grant select
on janine.behandlung to patient_verwaltung;

grant select
on janine.behandlungsraum to patient_verwaltung;

grant select
on janine.tool to patient_verwaltung;

grant arzt_verwaltung to sisi;
grant patient_verwaltung to franz;



select * from janine.arzt;
