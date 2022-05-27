CREATE OR REPLACE PROCEDURE DeleteInValidTrans AS 
BEGIN
    DELETE FROM tblTransaction WHERE DATEMADE > SYSDATE;
END;
/
--This code took so loooooonnnnnnggggggggggggg.....
CREATE OR REPLACE PROCEDURE PartyUpdate AS
--   P_id tblparty.partyid%type; 
   Total NUMBER;
   CURSOR C_tblParty is 
      SELECT tblparty.partyid FROM tblParty;
    C_ROW C_tblParty%ROWTYPE;
BEGIN 
   OPEN C_tblParty; 
   LOOP 
   FETCH C_tblParty into C_ROW; 
    UPDATE tblParty
    SET tblParty.NumPeopleParty = (SELECT COUNT(*) FROM tblguestparty WHERE tblguestparty.partyid = C_ROW.PartyID)
    WHERE tblParty.PartyID = c_row.PartyID;
    EXIT WHEN C_tblParty%NOTFOUND; 
    NULL;
   END LOOP; 
   CLOSE C_tblParty; 
END; 
/