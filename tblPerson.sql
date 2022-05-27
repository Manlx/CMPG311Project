DROP TABLE tblPerson;
CREATE TABLE tblPerson(
PersonID NUMBER PRIMARY KEY,
DOB DATE,
ZA_ID VARCHAR(12),
Mobile_Number VARCHAR(10),
FirstName VARCHAR(20),
Surname VARCHAR(20),
Email_Address VARCHAR(20)
);

DROP SEQUENCE PersonSeq;
CREATE SEQUENCE PersonSeq;
CREATE OR REPLACE TRIGGER PersonAuto
    before insert on tblPerson
    for each row
begin
    if :NEW.PersonID is null THEN
        :NEW.PersonID := PersonSeq.nextval;
    end if;
end;