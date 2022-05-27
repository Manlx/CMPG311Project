DROP TABLE tblTransaction;
CREATE TABLE tblTransaction(
    TransActionID NUMBER PRIMARY KEY,
    BANKID NUMBER,
    AMOUNT NUMBER(10,2),
    DateMade Date,
    Reason VARCHAR(40),
    FOREIGN KEY(BANKID) REFERENCES tblBank(BANKID) ON DELETE SET NULL
);

DROP SEQUENCE TransSeq;
CREATE SEQUENCE TransSeq;

CREATE OR REPLACE Trigger TransAuto
    BEFORE INSERT ON tblTransaction
    FOR EACH ROW
BEGIN
    IF :NEW.TransActionID IS NULL THEN
        :NEW.TransActionID := TransSeq.NEXTVAL;
    END IF;
END;