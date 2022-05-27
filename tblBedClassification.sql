DROP TABLE tblBedClassification;

CREATE TABLE tblBedClassification(
BedClassID NUMBER PRIMARY KEY,
ShortDesc VARCHAR(20),
LongDesc VARCHAR(50),
AdditionalCost Number(12,2)
);

DROP SEQUENCE BedID_sequence;
CREATE SEQUENCE BedID_sequence;
CREATE OR REPLACE TRIGGER  BedAuto
  before insert on tblBedClassification              
  for each row  
begin   
    if :NEW.BedClassID is null then 
        :NEW.BedClassID := BedID_sequence.nextval; 
    end if;  
end;
/
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('Short','Long',420);