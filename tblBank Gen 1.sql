DROP TABLE tblBank;
CREATE TABLE tblBank(
    BankID NUMBER PRIMARY KEY,
    Bank_Name VARCHAR(20)
--    RNum NUMBER
);

DROP SEQUENCE BankSeq;
CREATE SEQUENCE BankSeq;

CREATE OR REPLACE TRIGGER BankAuto
    before insert on tblBank
    for each row
DECLARE
begin   
    if :NEW.BankID is null then 
        :NEW.BankID := BankSeq.nextval; 
    end if;
end BankAuto;
/
INSERT INTO tblBANK(Bank_Name) VALUES ('FNB');
--INSERT INTO tblBank ( RNum ) VALUES (69);
--INSERT INTO tblBANK(Bank_Name) VALUES('ABSA');
--INSERT INTO tblBANK(Bank_Name) VALUES('Nedbank');
--INSERT INTO tblBANK(Bank_Name) VALUES('Capitec');
--INSERT INTO tblBANK(Bank_Name) VALUES('Standard Bank');
