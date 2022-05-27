DROP TABLE tblPartyType;
CREATE TABLE tblPartyType(
PartyTypeID NUMBER PRIMARY KEY,
Num_Meals NUMBER,
Num_PrePaid_Drinks NUMBER
);

DROP SEQUENCE PartyTypeSeq;
CREATE SEQUENCE PartyTypeSeq;
CREATE OR REPLACE TRIGGER PartyTypeAuto
    before insert on tblPartyType
    for each row
begin
    if :NEW.PartyTypeID is null THEN
        :NEW.PartyTypeID := PartyTypeSeq.nextval;
    end if;
end;