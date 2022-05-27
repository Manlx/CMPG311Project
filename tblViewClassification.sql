DROP TABLE tblViewClassification;
CREATE TABLE tblViewClassification(
ViewClassID NUMBER PRIMARY KEY,
Direction VARCHAR(20),
Elevation VARCHAR(20),
DescOfScenery VARCHAR(20),
IsSunSet CHAR(1),
IsSunRise CHAR(1)
);

DROP SEQUENCE ViewID_seq;
CREATE SEQUENCE ViewID_seq;

CREATE OR REPLACE TRIGGER ViewClassIns
    before insert on tblViewClassification
    for each row  
begin   
    if :NEW.ViewClassID is null then 
        :NEW.ViewClassID := ViewID_seq.nextval; 
    end if;  
end;