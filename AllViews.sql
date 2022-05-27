CREATE OR REPLACE VIEW PeopleBanks AS 
    SELECT tblBank.B_NAME "Bank",tblPerson.FirstName,tblPerson.SurName,tblPersonBank.AccountNumber,tblPersonBank.BranchNumber FROM tblBANK
    INNER JOIN tblPersonBANK ON tblPERSONBANK.BANKID = tblBank.BankID
    INNER JOIN tblPERSON ON tblPERSOn.PersonID = tblPersonBANK.PersonID
    WHERE ROWNUM <= 10;
    
CREATE OR REPLACE VIEW LargeRoomView  AS
SELECT 
    tblbedclassification.additionalcost + tblRoom.BaseCost + tblroomclassification.AdditionalCost "Room Total",
    tblbedclassification.additionalcost "Bed Cost",
    tblroomclassification.additionalcost "Room Cost",
    tblRoom.BaseCost "Base Cost",
    tblRoom.DrinkFridgeAccess "Access to Room Bar", 
    tblViewClassification.direction "Direction",
    tblViewClassification.Elevation "Elevation",
    tblViewClassification.issunrise "Has Sun Rise View",
    tblViewClassification.issunset "Has Sun Set Vew",
    tblbedclassification.shortdesc "Short Description",
    tblbedclassification.longdesc "Long Description",
    tblroomclassification.shortdesc "Short Room Description",
    tblroomclassification.longdesc "Long Room Description",
    tblroomclassification.isvip "Is This VIP Reserved",
    tblroom.dateofrenovation "Last Renovated ON"
FROM tblRoom
INNER JOIN tblViewClassification ON tblRoom.ViewClassID = tblviewclassification.viewclassid
INNER JOIN tblbedclassification ON tblRoom.BedClassID = tblbedclassification.bedclassid
INNER JOIN tblroomclassification ON tblroom.roomclassid = tblroomclassification.roomclassid
ORDER BY "Room Total" ASC;

CREATE OR REPLACE VIEW SmallRoomView AS
SELECT 
    SUBSTR(CONCAT('R',ROUND( tblbedclassification.additionalcost + tblRoom.BaseCost + tblroomclassification.AdditionalCost,2)),1,10) "Room Total",
    SUBSTR(CONCAT('R',ROUND( tblbedclassification.additionalcost,2)),1,10) "Bed Cost",
    SUBSTR(CONCAT('R',ROUND( tblroomclassification.additionalcost,2)),1,10) "Room Cost",
    SUBSTR(CONCAT('R',ROUND( tblRoom.BaseCosT,2)),1,10) "Base Cost",
    tblRoom.DrinkFridgeAccess "Minibar", 
    tblViewClassification.issunrise "Sunrise View",
    tblViewClassification.issunset "Sunset View",
    tblbedclassification.shortdesc "Short Description",
    tblroomclassification.shortdesc "Room Class",
    tblroomclassification.isvip "VIP Reserved"
FROM tblRoom
INNER JOIN tblViewClassification ON tblRoom.ViewClassID = tblviewclassification.viewclassid
INNER JOIN tblbedclassification ON tblRoom.BedClassID = tblbedclassification.bedclassid
INNER JOIN tblroomclassification ON tblroom.roomclassid = tblroomclassification.roomclassid;

CREATE OR REPLACE VIEW NumOFAllergies AS
SELECT COUNT(tblperson.personId) "People Count", tblallergy.descr FROM tblperson
INNER JOIN tblGuest ON tblperson.personid = tblguest.personid
INNER JOIN tblGuestAllergy ON tblGuestallergy.guestid =tblguest.personid
INNER JOIN tblallergy on tblGuestallergy.allergyid = tblallergy.allergyid
GROUP BY tblallergy.descr;

CREATE OR REPLACE VIEW RoomCost AS
SELECT COUNT(roomID) "Count of Rooms", BASECOST FROM TBLROOM
    GROUP BY BASECOST
    HAVING BASECOST < 400;

CREATE OR REPLACE VIEW SelectPeople AS
SELECT surname"Last Name",firstname"First Name",za_id "South African ID"  FROM tblPerson
    WHERE za_id LIKE '%00%' AND dob BETWEEN DATE '1980-01-01' AND DATE '2022-01-01'
    OR LENGTH(email_address)<15
    ORDER BY surname ASC;
    
CREATE OR REPLACE VIEW AllergyV AS
SELECT tblperson.firstname"First Name",tblperson.surname"Last Name", tblallergy.descr"Allergy Type", tbldish.dishname"Dish Name",tblallergy.treatment"Allergy Treatment" FROM tblperson
    INNER JOIN tblGuest ON tblGuest.personid = tblPerson.personid
    INNER JOIN tblguestallergy ON tblGuest.personid = tblguestallergy.guestid
    INNER JOIN tblAllergy ON tblguestallergy.allergyid = tblallergy.allergyid
    INNER JOIN tblDishAllergy ON tblallergy.allergyid = tbldishallergy.allergyid
    INNER JOIN tblDish ON tblDishallergy.dishid = tbldish.dishid
    WHERE tblguestallergy.guestid IN (3,9,10);