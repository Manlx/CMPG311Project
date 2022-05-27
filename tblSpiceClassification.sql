DROP TABLE tblSpiceClassification;
CREATE TABLE tblSpiceClassification(
SpiceClassID NUMBER PRIMARY KEY,
ShortDesc NUMBER,
ScovilleCount NUMBER
);

DROP SEQUENCE SpiceSeq;
CREATE SEQUENCE SpiceSeq;
CREATE OR REPLACE TRIGGER SpiceAuto
    before insert on tblSpiceClassification
    for each row
begin
    if :NEW.SpiceClassID is null THEN
        :NEW.SpiceClassID := SpiceSeq.nextval;
    end if;
end;