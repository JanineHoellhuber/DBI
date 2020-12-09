create or replace TRIGGER TRIGGER1 
After INSERT OR UPDATE OR DELETE ON Tool
For each row
declare
countTool INTEGER := 0;
BEGIN
--finde anzahl der zeilen , schleife
select count(Tool.TOOLNAME) into countTool from BEHANDLUNG, TOOL, PATIENT where BEHANDLUNG.PATIENT_ID in (select PATIENT.PATIENT_ID from PATIENT ) and
    behandlung.behandlungdate between patient.behandlungstart and patient.behandlungende group by PATIENT.NAME, TOOL.toolName;
insert into logtable (logstring) values (countTool);

END;