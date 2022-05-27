DROP TABLE tblRoomClassification;
CREATE TABLE tblRoomClassification(
RoomClassID NUMBER PRIMARY KEY,
ShortDesc VARCHAR(20),
LongDesc VARCHAR(50),
AdditionalCost Number(12,2),
IsVIP CHAR(1)
);

DROP SEQUENCE RoomClassSeq;
CREATE SEQUENCE RoomClassSeq;
CREATE OR REPLACE TRIGGER RoomAuto
  before insert on tblRoomClassification              
  for each row  
begin   
    if :NEW.RoomClassID is null then 
        :NEW.RoomClassID := RoomClassSeq.nextval; 
    end if;  
end;
