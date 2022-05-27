--Drops All Tables
--Drops All Tables
--Gen 3
DROP TABLE tblPartyTransaction;
DROP TABLE tblGuestAllergy;
DROP TABLE tblGuestParty;
DROP TABLE tblPartyRoom;
DROP TABLE tblDishAllergy;
DROP TABLE tblServiceRole;
--Exceptions
ALTER TABLE tblRole
    DROP CONSTRAINT FK_DepID;
ALTER TABLE tblRole
    DROP CONSTRAINT FK_ReportTo;
    
ALTER TABLE tblDepartment
    DROP CONSTRAINT FK_ManEmp;
    
ALTER TABLE tblEmployee
    DROP CONSTRAINT FK_EmployeeRole;

DROP TABLE tblDepartment;
DROP TABLE tblEmployee;
DROP TABLE tblRole;

--Gen 2
DROP TABLE tblTRANSACTION;
DROP TABLE tblRoom;
DROP TABLE tblPARTY;
DROP TABLE tblGUEST;
DROP TABLE tblDish;
DROP TABLE tblPersonBank;
--Gen 1
DROP TABLE tblBank;
DROP TABLE tblPerson;
DROP TABLE tblPartyType;
DROP TABLE tblRoomClassification;
DROP TABLE tblSpiceClassification;
DROP TABLE tblBedClassification;
DROP TABLE tblViewClassification;
DROP TABLE tblAllergy;
DROP TABLE tblSeverity;
DROP TABLE tblService;
-- RoomClassification Tables and Data Start

CREATE TABLE tblRoomClassification(
RoomClassID NUMBER PRIMARY KEY,
ShortDesc VARCHAR(10),
LongDesc VARCHAR(50),
AdditionalCost Number(12,2),
IsVIP NUMBER(1)
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
/
INSERT INTO tblRoomClassification (ShortDesc,LongDesc,AdditionalCost,IsVIP) VALUES ('MS','Master Suite',600,1);
INSERT INTO tblRoomClassification (ShortDesc,LongDesc,AdditionalCost,IsVIP) VALUES ('NS','Mini Suite',400,1);
INSERT INTO tblRoomClassification (ShortDesc,LongDesc,AdditionalCost,IsVIP) VALUES ('CR','Connected Rooms',300,0);
INSERT INTO tblRoomClassification (ShortDesc,LongDesc,AdditionalCost,IsVIP) VALUES ('AO','Adjoined Rooms',300,0);
INSERT INTO tblRoomClassification (ShortDesc,LongDesc,AdditionalCost,IsVIP) VALUES ('AA','Adjacent Rooms',300,0);
/
-- RoomClassification Tables and Data End
-- SpiceClassification Tables and Data Start

CREATE TABLE tblSpiceClassification(
SpiceClassID NUMBER PRIMARY KEY,
ShortDesc VARCHAR(20),
ScovilleCount NUMBER(10)
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
/
INSERT INTO tblSpiceClassification (ShortDesc,ScovilleCount) VALUES ('Lemon and Herb',0);
INSERT INTO tblSpiceClassification (ShortDesc,ScovilleCount) VALUES ('Mild',100);
INSERT INTO tblSpiceClassification (ShortDesc,ScovilleCount) VALUES ('Medium',800);
INSERT INTO tblSpiceClassification (ShortDesc,ScovilleCount) VALUES ('Hot',2000);
INSERT INTO tblSpiceClassification (ShortDesc,ScovilleCount) VALUES ('Extra Hot',4000);
INSERT INTO tblSpiceClassification (ShortDesc,ScovilleCount) VALUES ('Extremely Hot',8000);
INSERT INTO tblSpiceClassification (ShortDesc,ScovilleCount) VALUES ('Special Order Hot',25000);
/
-- SpiceClassification Tables and Data End
-- BedClassification Tables and Data Start


CREATE TABLE tblBedClassification(
BedClassID NUMBER PRIMARY KEY,
ShortDesc VARCHAR(20),
LongDesc VARCHAR(70),
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
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('Single','One occupant with one bed',100);
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('Double','Two occupants with one or two beds',200);
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('Triple','Three occupants with two or three beds',300);
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('Quad','Four occupants with two or more beds',300);
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('King','One or more occupants with a single king-sized bed',600);
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('Twin','One or two occupants with two single-beds',400);
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('Double-double','One or more occupants with two double beds',500);
INSERT INTO tblBedClassification(ShortDesc,LongDesc,AdditionalCost) VALUES ('Studio','One or more occupants with a studio bed and a sleeper couch',500);
-- BedClassification Tables and Data End
-- Person Tables and Data Start
/

CREATE TABLE tblPerson(
PersonID NUMBER PRIMARY KEY,
DOB DATE,
ZA_ID VARCHAR(13),
Mobile_Number VARCHAR(15),
FirstName VARCHAR(20),
Surname VARCHAR(20),
Email_Address VARCHAR(50)
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
/
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1995-12-12','9512120815109','0638951254','Peter', 'Gieter', 'pgieter@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1985-12-03','8512030815108','0716542158', 'Sharon', 'Malie', 'Sharon23@yahoomail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1969-08-04','6908040805008','0834522698', 'Debbie', 'Odendaal', 'deb90@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '2001-01-01','0101010815109','0721151114', 'Hank', 'Wilson', 'willie@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1991-11-25','9111255800084','0638951234','James', 'Smith', 'jsmith@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1975-09-24','7509244800085','0712342158', 'Mary', 'Johnson', 'mary66@yahoomail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '2002-12-12','0212125800085','0836357898', 'Robert', 'Williams', 'rob81@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '2003-07-11','0707115800085','0721246614', 'John', 'Brown', 'brown@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1987-03-05','8703054800082','0632356254','Patricia', 'Jones', 'pjones@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1997-12-07','8512030815108','0715434158', 'Jennifer', 'Garcia', 'jenn23@yahoomail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1966-01-23','9512117815109','0638951254','Johan', 'Smith', 'JohanSmith@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1972-08-27','7208274800087','0638962771','Lorien', 'Tangarien', 'LorTan@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1958-07-22','5807224800089','0631117431','Tannie Smitty', 'Du Toit', 'TSDT@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1923-04-06','2304065800082','0699988715','Zanita', 'Potter', 'Zanita@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1995-08-01','2308145800087','0812381357','Lerato', 'Tabang', 'TabangLerato@Hotmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1987-08-14','8708145800082','0812381696','Jerald', 'Lemothi', 'JeraldLemtohi@Hotmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1998-04-14','9804145800088','0812386969','Hilda', 'Blignoud', 'HildBlig@Yahoo.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1990-07-19','9011195800089','0654321875','Christin', 'Konradi', 'ChrisKonra@FastMail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1979-11-11','7911194800083','0632175698','Jacoline', 'Mogbalia', 'JacolineBali@EBrail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1996-05-31','9605314800084','0667103172','Roslin', 'Zuma', 'PapiLongi@Railed.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1967-05-22','6776437815109','0638935864','Abeo', 'Mahmoud', 'mahmoud.abeo@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1977-06-28','7784284800087','0638998753','Aisha', 'Ngoy', 'sha.nqoy@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1954-08-12','5498534800089','0631153221','Musa', 'Ismail', 'ismail@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1989-02-12','8965345800082','0699988753','Najja', 'Abebe', 'najjabebe@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1999-01-15','9987537815109','0638935685','Obasi', 'Girma', 'obasigirma@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1998-05-24','9834564815109','0638935685','Jeremy', 'Noss', 'j.noss@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1998-05-24','9834564815109','0638935685','Jroster', 'Reloster', 'JRRJ@outlook.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1955-07-06','9838315373544','0123456698','Ron', 'Chee', 'JRRJ@outlook.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1989-02-13','8902134800084','0568713101','Pieter', 'Tingle', 'TingyPeet@outlook.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1996-03-20','9603205798631','0832296060','Hope', 'Mogale', 'drdripmaster@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1980-12-25','8012256878525','0784850258','Chao', 'Chang', 'didudaai@yahoomail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '2000-09-09','0009096387964','0796321456','Will', 'Smith', 'smackthat@proton.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '2003-04-30','0304309752496','0785200369','Louise', 'Extracheese', 'cheddar4life@outlook.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1972-09-25','7209259678452','0628524569','Bob', 'Bejaan', 'bobbydiejaan@zoho.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1943-09-25','3409259678452','0628524569','Micheal', 'Langbong', 'MichealLB@zoho.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1959-09-25','6901569678452','0456873125','Micheal', 'Shoemaker', 'ShoeMichealGMaker@zoho.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1992-08-08','9208085800083','0812381357','Borat', 'Flabini', 'Flabs@Hotmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1991-10-12','9110125109082','0725698451','Tabang', 'Tabong', 'TBags@outlook.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1989-04-25','8904255090897','0864512365','Zhang', 'Chi', 'ChiChi@heehee.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1985-06-07','8506075017887','0817451236','Kakarot', 'Sayain', 'ksi@Hotmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1999-02-23','9902235098541','0714589625','Phineas', 'Skoenmaker', 'swayde@gmail.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '2002-05-29','0205298941087','0732654874','Ferb', 'Skoenmaker', 'hitthekurb@yahoo.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1978-11-19','7811194584512','0814587956','Mario', 'Luigi', 'nintendo@yahoo.com');
INSERT INTO tblPerson(DOB,ZA_ID,Mobile_Number,FirstName,Surname,Email_Address) VALUES (DATE '1944-10-06','4410065800087','0832654879','Kratos', 'Godly', 'boy!@gmail.com');
-- Person Tables and Data End
-- ViewClassification Tables and Data Start
/
CREATE TABLE tblViewClassification(
ViewClassID NUMBER PRIMARY KEY,
Direction VARCHAR(20),
Elevation VARCHAR(20),
DescOfScenery VARCHAR(50),
IsSunSet NUMBER(1),
IsSunRise NUMBER(1)
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
/
INSERT INTO tblViewClassification(Direction,Elevation,DescOfScenery,IsSunSet,IsSunRise) VALUES ('North','First Floor','View of ocean',0,0);
INSERT INTO tblViewClassification(Direction,Elevation,DescOfScenery,IsSunSet,IsSunRise) VALUES ('West','Fifth Floor','Partial city,ocean view',0,1);
INSERT INTO tblViewClassification(Direction,Elevation,DescOfScenery,IsSunSet,IsSunRise) VALUES ('North','Second Floor','View of ocean',0,0);
INSERT INTO tblViewClassification(Direction,Elevation,DescOfScenery,IsSunSet,IsSunRise) VALUES ('South','Tenth Floor','View of city',0,0);
INSERT INTO tblViewClassification(Direction,Elevation,DescOfScenery,IsSunSet,IsSunRise) VALUES ('East','First Floor','Partial city,ocean view',1,0);
-- ViewClassification Tables and Data End
-- Bank Tables and Data Start
/
CREATE TABLE tblBank(
    BankID NUMBER PRIMARY KEY,
    B_Name VARCHAR(40)
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
end;
/
INSERT INTO tblBANK(B_Name) VALUES ('First National Bank');
INSERT INTO tblBANK(B_Name) VALUES('ABSA Group Limited');
INSERT INTO tblBANK(B_Name) VALUES('Nedbank Limited');
INSERT INTO tblBANK(B_Name) VALUES('Capitec Bank Limited');
INSERT INTO tblBANK(B_Name) VALUES('Standard Bank');
INSERT INTO tblBANK(B_Name) VALUES('African Bank Limited');
INSERT INTO tblBANK(B_Name) VALUES('Discovery Limited');
INSERT INTO tblBANK(B_Name) VALUES('Investec Bank Limited');
INSERT INTO tblBANK(B_Name) VALUES('Bidvest Bank Limited');
-- Bank Tables and Data End
-- PartyType Tables and Data Start
/

CREATE TABLE tblPartyType(
PartyTypeID NUMBER PRIMARY KEY,
Num_Meals NUMBER,
Num_PrePaid_Drinks NUMBER,
Description VARCHAR(60)
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
/
INSERT INTO tblPartyType(Num_Meals,Num_PrePaid_Drinks,Description) VALUES (10,30,'Business');
INSERT INTO tblPartyType(Num_Meals,Num_PrePaid_Drinks,Description) VALUES (05,10,'Wedding');
INSERT INTO tblPartyType(Num_Meals,Num_PrePaid_Drinks,Description) VALUES (15,40,'Party');
INSERT INTO tblPartyType(Num_Meals,Num_PrePaid_Drinks,Description) VALUES (08,08,'Funeral');
INSERT INTO tblPartyType(Num_Meals,Num_PrePaid_Drinks,Description) VALUES (10,15,'Anniversary');
/
-- PartyType Tables and Data End
-- Allergy Tables and Data Start
CREATE TABLE tblAllergy(
    AllergyID NUMBER PRIMARY KEY,
    Descr VARCHAR(50),
    Treatment VARCHAR(100)
);

DROP SEQUENCE AllergySeq;
CREATE SEQUENCE AllergySeq;

CREATE OR REPLACE TRIGGER AllergyAuto
    BEFORE INSERT ON tblAllergy
    FOR EACH ROW
BEGIN
    IF :NEW.AllergyID IS NULL THEN
        :NEW.AllergyID := AllergySeq.NEXTVAL;
    END IF;
END;
/
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Peanut Allergy','Epinephrine');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Seafood allergy','antihistamines');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Egg Allergy','Medical Attention');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Insect venom(stings)','Epinephrine');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Pollen(Seasonal)','Antihistamine medications');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Mold','Corticosteroids');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Latex','Albuterol');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Alpha-Gal Syndrome','Medical Treatment');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Lactose intolerance','Digestive Enzyme');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Pollen food allergy syndrome','Antihistamines');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Anaphylaxis','Epinephrine, antihistamines and cortisone');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Bird-egg syndrome','Epinephrine, antihistamines and cortisone');
INSERT INTO tblAllergy(Descr,Treatment) VALUES ('Celiac disease','Medical Treatment');
/
-- Allergy Tables and Data End
-- Transaction Tables and Data Start
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
/
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,420.69, DATE '2021-12-30','Future Payment');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,1300.00, DATE '2022-11-09','Half room payment');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,100.00, DATE '2022-09-22','Courier services');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,2600.00, DATE '2022-07-23','Full room payment');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,2600.00, DATE '2022-08-21','Full Room payment');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,200.00, DATE '2022-02-27','Dry cleaning');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,400.00, DATE '2022-01-23','Room service');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,250.00, DATE '2022-11-08','Ironing of clothes');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,300.00, DATE '2022-06-27','Valet');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,1300.00, DATE '2022-05-12','Half room payment');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,1300.00, DATE '2022-04-28','Half room payment');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,200.00, DATE '2022-12-31','Dry cleaning');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,150.00, DATE '2022-12-04','Room service');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,250.00, DATE '2022-05-26','Room service');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,700.00, DATE '2022-09-07','Room Deposit');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,1300.00, DATE '2022-11-22','Half room payment');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,400.00, DATE '2022-10-23','Room Deposit');
INSERT INTO tblTransaction(BANKID,AMOUNT,DateMade,Reason) VALUES (1,420.69, DATE '2022-10-25','Future Payment');
-- Transaction Tables and Data Start
-- Room Tables and Data Start
/
CREATE TABLE tblRoom(
    ROOMID NUMBER PRIMARY KEY,
    BedClassID Number,
    ViewClassID Number,
    RoomClassID Number,
    DrinkFridgeAccess NUMBER(1),
    OperationDate DATE,
    DateOfRenovation DATE,
    BaseCost NUMBER(10,2),
    FOREIGN KEY(BedClassID) REFERENCES tblBedClassification(BedClassID) ON DELETE SET NULL,
    FOREIGN KEY(ViewClassID) REFERENCES tblViewClassification(ViewClassID) ON DELETE SET NULL,
    FOREIGN KEY(RoomClassID) REFERENCES tblRoomClassification(RoomClassID) ON DELETE SET NULL
);

DROP SEQUENCE RoomSeq;
CREATE SEQUENCE RoomSeq;
DROP TRIGGER ROOMAUTO;
CREATE OR REPLACE Trigger RoomAuto
    BEFORE INSERT ON tblRoom
    FOR EACH ROW
BEGIN
    IF :NEW.ROOMID IS NULL THEN
        :NEW.ROOMID := RoomSeq.NEXTVAL;
    END IF;
END;
/
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (1,1,1,1,DATE '2018-01-01',DATE '2020-01-01',420.69);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (2,2,2,0,DATE '2018-05-17',DATE '2020-05-17',399.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (3,3,3,1,DATE '2018-05-21',DATE '2020-05-21',520.00);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (4,4,4,0,DATE '2018-11-22',DATE '2020-11-22',299.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (5,5,5,0,DATE '2018-02-06',DATE '2020-02-06',229.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (6,5,5,1,DATE '2018-04-12',DATE '2020-04-12',499.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (7,5,5,1,DATE '2018-05-14',DATE '2020-05-14',499.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (1,2,2,1,DATE '2018-09-03',DATE '2020-09-03',399.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (2,2,1,0,DATE '2018-09-18',DATE '2020-09-18',299.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (1,3,2,0,DATE '2018-10-19',DATE '2020-10-19',199.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (1,2,3,0,DATE '2018-11-23',DATE '2020-11-23',199.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (4,5,5,0,DATE '2018-12-05',DATE '2020-12-05',299.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (7,3,2,1,DATE '2018-07-06',DATE '2020-07-06',420.69);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (6,1,1,1,DATE '2018-09-09',DATE '2020-09-09',499.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (5,1,1,0,DATE '2018-06-13',DATE '2020-06-13',229.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (4,3,3,1,DATE '2018-02-16',DATE '2020-02-16',399.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (1,5,1,0,DATE '2018-03-29',DATE '2020-03-29',299.99);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (6,2,2,0,DATE '2018-02-27',DATE '2020-02-27',520.00);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (5,3,1,1,DATE '2018-04-24',DATE '2020-04-24',420.69);
INSERT INTO tblRoom(BedClassID,ViewClassID,RoomClassID,DrinkFridgeAccess,OperationDate,DateOfRenovation,BaseCost) VALUES (6,4,4,1,DATE '2018-09-21',DATE '2020-09-21',420.69);
/
-- Room Tables and Data END
-- Party Tables and Data Start
CREATE TABLE tblPARTY(
    PartyID NUMBER PRIMARY KEY,
    PartyType NUMBER,
    NumPeopleParty NUMBER,
    PartyCheckedIn DATE,
    PartyCheckedOut Date,
    FOREIGN KEY (PARTYTYPE) REFERENCES tblPartyType(PartyTypeID) ON DELETE SET NULL
);

DROP SEQUENCE PARTYSEQ;
CREATE SEQUENCE PartySEQ;

DROP TRIGGER PartyAUTO;
CREATE TRIGGER PartyAUTO
    BEFORE INSERT ON tblPARTY
    FOR EACH ROW
BEGIN
    IF :NEW.PartyID IS NULL THEN
        :NEW.PARTYID := PartySEQ.NEXTVAL;
    END IF;
END;
/
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(1,1,DATE '2022-03-08',DATE '2022-03-10' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(2,4,DATE '2011-01-10',DATE '2011-01-17' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(3,3,DATE '2020-04-20',DATE '2020-04-23' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(4,2,DATE '2010-05-22',DATE '2010-05-26' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(5,2,DATE '2022-01-28',DATE '2022-02-02' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(3,5,DATE '2009-08-26',DATE '2009-09-01' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(2,10,DATE '2017-12-12',DATE '2017-12-15' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(3,8,DATE '2016-11-20',DATE '2016-11-22' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(1,4,DATE '2021-02-18',DATE '2021-02-24' );
INSERT INTO tblPARTY(PARTYTYPE,NUMPEOPLEPARTY,PARTYCHECKEDIN,PartyCheckedOut) VALUES(5,2,DATE '2014-10-01',DATE '2014-10-04' );
-- Party Tables and Data End
-- Guest Tables and Data Start

CREATE TABLE tblGUEST(
    PersonID NUMBER PRIMARY KEY,
    NumVisits NUMBER,
    DateLastVisted DATE,
    FOREIGN KEY (PERSONID) REFERENCES tblPerson(PERSONID) ON DELETE CASCADE
);
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (1,1,DATE '2005-06-01');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (2,3,DATE '2012-04-22');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (3,5,DATE '2016-07-23');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (4,7,DATE '2016-07-23');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (5,9,DATE '2016-07-23');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (6,2,DATE '2015-01-15');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (7,4,DATE '2017-12-09');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (8,6,DATE '2013-11-01');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (9,8,DATE '2010-06-07');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (10,5,DATE '2010-06-07');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (11,1,DATE '2010-06-07');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (12,1,DATE '2006-08-01');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (13,3,DATE '2006-08-01');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (14,3,DATE '2008-09-25');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (15,9,DATE '2008-09-25');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (16,4,DATE '2009-07-21');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (17,1,DATE '2001-04-02');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (18,2,DATE '2001-04-02');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (19,2,DATE '2004-11-16');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (20,2,DATE '2004-11-16');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (21,3,DATE '2003-03-11');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (22,3,DATE '2003-03-11');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (23,3,DATE '2006-05-14');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (24,1,DATE '2014-11-11');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (25,1,DATE '2014-11-11');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (26,3,DATE '2018-09-01');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (27,3,DATE '2018-09-01');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (28,4,DATE '2018-09-01');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (29,5,DATE '2020-01-14');
INSERT INTO tblGuest(PersonID,NUMVISITS,datelastvisted) VALUES (30,4,DATE '2020-01-14');
-- Guest Tables and Data End
/
-- Employee Tables and Data Start
CREATE TABLE tblEmployee(
    PERSONID NUMBER PRIMARY KEY,
    DateHired DATE,
    YearsOfService NUMBER,
    HasPaidSickLeave Number(1),
    NumVacationDays NUMBER(6),
    EmployeeRole Number
);
/
-- Guest Tables and Data Start
CREATE TABLE tblDepartment(
    DepID NUMBER PRIMARY KEY,
    Description VARCHAR(50),
    BaseSalary NUMBER(7,2),
    ManEmpNumber NUMBER
);
DROP SEQUENCE DepartmentSeq;
CREATE SEQUENCE DepartmentSeq;

DROP TRIGGER DepartmentAuto;
CREATE TRIGGER DepartmentAuto
    BEFORE INSERT ON tblDepartment
    FOR EACH ROW
BEGIN
    IF :NEW.DepID IS NULL THEN
        :NEW.DepID := DepartmentSeq.NextVAL;
    END IF;
END;
/
CREATE TABLE tblRole(
    RoleID NUMBER PRIMARY Key,
    Description VARCHAR(50),
    RoleSalary NUMBER(9,2),
    ReportTo NUMBER,
    DepID NUMBER
);
DROP SEQUENCE RoleSEQ;
CREATE SEQUENCE RoleSEQ;

DROP TRIGGER RoleAUTO;
CREATE TRIGGER RoleAUTO
    BEFORE INSERT ON tblRole
    FOR EACH ROW
BEGIN
    IF :NEW.RoleID IS NULL THEN
        :NEW.ROLEID := RoleSEQ.NEXTVAL;
    END IF;
END;
/
ALTER TABLE tblRole
    ADD CONSTRAINT FK_DepID FOREIGN KEY(DepID) REFERENCES tblDepartment(DepID) ON DELETE SET NULL;
ALTER TABLE tblRole
    ADD CONSTRAINT FK_ReportTo FOREIGN KEY(ReportTo) REFERENCES tblRole(RoleID) ON DELETE SET NULL;
    
ALTER TABLE tblDepartment
    ADD CONSTRAINT FK_ManEmp FOREIGN KEY(ManEmpNumber) REFERENCES tblEmployee(PERSONID) ON DELETE SET NULL;
    
ALTER TABLE tblEmployee
    ADD CONSTRAINT FK_EmployeeRole FOREIGN KEY(EmployeeRole) REFERENCES tblRole(RoleID) ON DELETE SET NULL;

INSERT INTO tblDepartment(Description,BaseSalary) VALUES ('Kitchen Department',10000.00);
INSERT INTO tblDepartment(Description,BaseSalary) VALUES ('House Keeping Department',3000.00);
INSERT INTO tblDepartment(Description,BaseSalary) VALUES ('Customer Service',8000.00);
INSERT INTO tblDepartment(Description,BaseSalary) VALUES ('Marketing Department',7000.00);
INSERT INTO tblDepartment(Description,BaseSalary) VALUES ('Daycare Department',5000.00);
INSERT INTO tblDepartment(Description,BaseSalary) VALUES ('Financial Department',11000.00);
INSERT INTO tblDepartment(Description,BaseSalary) VALUES ('Maintenance Department',5000.00);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Head Chef',10000,1);
--INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Head Chef',1,8000,1);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Sous Chef',1,7000,1);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Pastry Chef',1,6000,1);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Line Chef',1,5000,1);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Daycare Manager',6000,5);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Daycare Secretary',6,5000,5);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Daycare Employee',6,4000,5);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Head Of Front Desk',7000,3);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Room Service Staff',9,3000,3);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Welcome Staff',9,1000,3);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Porter',9,1000,3);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Valet',9,1500,3);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Financial Analyst',90000,6);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Accountant',14,30000,6);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Actuary',14,60000,6);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Secretary',14,25000,6);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Quantitative Analyst',14,30000,6);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Supply Manager',20000,6);
INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Business Relation Manager',20000,6);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Plumber',22000,7);
INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Electrician',28000,7);
INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Gardener',5000,7);
INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Head of IT',60000,7);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Tech Support',24,25000,7);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Hygenic Officer',20000,2);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Housekeeper',26,8000,2);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Janitor',26,8000,2);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Social Media Manager',20000,6);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Webmaster',24,30000,6);

INSERT INTO tblRole(Description,RoleSalary,DepID) VALUES ('Chief Marketing Officer',22000,6);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Digital Marketing Director',31,28000,6);
INSERT INTO tblRole(Description,ReportTo,RoleSalary,DepID) VALUES ('Marketing Analyst',31,25000,6);

INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(31,DATE '2022-11-10',8,1,20,1);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(32,DATE '2021-10-11',7,1,19,2);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(33,DATE '2015-01-27',18,1,22,3);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(34,DATE '2015-07-17',13,1,14,4);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(35,DATE '2016-04-14',15,1,17,5);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(36,DATE '2020-07-01',4,1,16,6);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(37,DATE '2020-12-28',3,1,10,7);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(38,DATE '2012-04-27',11,1,24,8);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(39,DATE '2013-04-26',10,1,35,9);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(40,DATE '2020-11-03',9,1,9,10);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(41,DATE '2021-03-29',11,1,10,11);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(42,DATE '2022-06-17',8,1,11,12);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(43,DATE '2013-05-23',16,1,17,13);
INSERT INTO tblEmployee(PersonID,DateHired,YearsOfService,HasPaidSickLeave,NumVacationDays,EmployeeRole) VALUES(44,DATE '2021-01-15',19,1,19,14);
-- Guest Tables and Data End
-- Dish Tables and Data Start
CREATE TABLE tblDish(
    DishID NUMBER PRIMARY KEY,
    DishName VARCHAR(60),
    DishDescription VARCHAR(150),
    SpiceClass NUMBER,
    FOREIGN KEY(SpiceClass) REFERENCES tblSpiceClassification(SpiceClassID)
);
DROP SEQUENCE DishSeq;
CREATE SEQUENCE DishSEQ;
DROP TRIGGER DishAuto;
CREATE OR REPLACE TRIGGER DishAUTO
    BEFORE INSERT ON tblDish
    FOR EACH ROW
BEGIN
    IF :NEW.DishID IS NULL THEN
        :NEW.DISHID := DishSEQ.NEXTVAL;
    END IF;
END;
/
INSERT INTO tblDish(DishName,DishDescription,SpiceClass) VALUES ('Really whacky whacked Bunny Chow','Its a local indian chow',5);
INSERT INTO tblDish(DishName,DishDescription,SpiceClass) VALUES ('Double Thick Supreme Stuffed Chicken Mayo Pizza','It the next level in chicken mayo pizza',5);
INSERT INTO tblDish(DishName,DishDescription,SpiceClass) VALUES ('Eden Delight Apple Pie','Its a sin to eat something this delicious',1);
INSERT INTO tblDish(DishName,DishDescription,SpiceClass) VALUES ('Top Decker Supreme Deluxe Burger','Itll give you diabetes 2',4);
INSERT INTO tblDish(DishName,DishDescription,SpiceClass) VALUES ('Spicy Kalahari Calamari','Its the dish they said was impossible',6);
INSERT INTO tblDish(DishName,DishDescription,SpiceClass) VALUES ('Really Great Cooked Fried Steak','Its the dish that will keep you guessing',4);
/
CREATE TABLE tblPersonBank(
    BANKID NUMBER,
    PERSONID NUMBER,
    AccountNumber Varchar(30),
    BranchNumber Varchar(30),
    PRIMARY KEY(BANKID,PERSONID),
    FOREIGN KEY(BANKID) REFERENCES tblBank(BANKID) ON DELETE SET NULL,
    FOREIGN KEY(PERSONID) REFERENCES tblPerson(PERSONID) ON DELETE SET NULL
);
/
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (1,1,'1969365685','30605');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (4,2,'8332230252','18764');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (1,3,'3011931974','36196');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (2,4,'3346314198','31413');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (5,5,'2004101005','35065');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (3,6,'8550500582','30849');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (1,7,'7915654508','33795');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (4,8,'6483453166','35426');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (2,9,'3288221636','32694');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (5,10,'8904834802','32694');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (1,11,'8325037307','38257');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (1,12,'4368491588','38767');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (1,13,'6644005854','30409');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (2,14,'6475996226','37401');
INSERT INTO tblPersonBank(BANKID,PERSONID,AccountNumber,BranchNumber) VALUES (5,15,'2004101005','33967');
/
CREATE TABLE tblPartyTransaction(
    TransactionID NUMBER,
    PartyID NUMBER,
    PRIMARY KEY (PartyID,TransactionID),
    FOREIGN KEY(TransactionID) REFERENCES tblTransaction(TransactionID) ON DELETE CASCADE,
    FOREIGN KEY(PartyID) REFERENCES tblParty(PartyID)
);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (8,1);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (9,2);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (10,3);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (11,4);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (12,5);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (13,6);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (14,7);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (15,8);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (16,9);
INSERT INTO tblPartyTransaction(TransactionID, PartyID) VALUES (17,10);
/
CREATE TABLE tblSeverity(
    SeverityID NUMBER PRIMARY KEY,
    ShortName VARCHAR(30),
    Description VARCHAR(200),
    GoldenTime NUMBER(6)
);
DROP SEQUENCE SeveritySeq;
CREATE SEQUENCE SeveritySeq;
DROP TRIGGER SeverityAuto;
CREATE OR REPLACE TRIGGER SEVERITYAUTO
    BEFORE INSERT ON tblSeverity
    FOR EACH ROW
BEGIN
    IF :NEW.SeverityID IS NULL THEN
        :NEW.SeverityID := SeveritySeq.NEXTVAL;
    END IF;
END;
/
INSERT INTO tblSeverity(ShortName,Description,GoldenTime) VALUES ('Level One','Low level of severity will include little unpleasantness',300);
INSERT INTO tblSeverity(ShortName,Description,GoldenTime) VALUES ('Level Two','Meduim to low severity. This includes reddish rashes and inflamation',200);
INSERT INTO tblSeverity(ShortName,Description,GoldenTime) VALUES ('Level Three','Meduim to Moderate Severity. This includes hot flashes, decreased ability to breath',100);
INSERT INTO tblSeverity(ShortName,Description,GoldenTime) VALUES ('Level Four','Moderate to Severe Severity. Extreme diffucilty to breath.',50);
INSERT INTO tblSeverity(ShortName,Description,GoldenTime) VALUES ('Level Five','Severe to Life Threating Severity. Unable to breath. Conntact Medical Personal Immediately.',10);
/
CREATE TABLE tblGuestAllergy(
    ALLERGYID NUMBER,
    GUESTID NUMBER,
    SEVERITY NUMBER,
    PRIMARY KEY(ALLERGYID,GUESTID),
    FOREIGN KEY(SEVERITY) REFERENCES tblSeverity(SeverityID) ON DELETE SET NULL,
    FOREIGN KEY(GUESTID) REFERENCES tblGUEST(PersonID) ON DELETE CASCADE,
    FOREIGN KEY(ALLERGYID) REFERENCES tblAllergy(ALLERGYID) ON DELETE CASCADE
);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(1,1,1);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(2,3,2);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(3,4,3);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(4,5,4);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(5,6,5);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(6,7,1);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(7,8,2);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(8,9,3);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(9,10,4);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(10,11,5);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(11,12,1);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(12,13,2);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(13,14,3);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(13,15,4);
INSERT INTO tblguestallergy(AllergyID,GuestID,Severity) VALUES(13,16,5);
/
CREATE TABLE tblGuestParty(
    PARTYID NUMBER,
    PERSONID NUMBER,
    DateJoined DATE,
    PRIMARY KEY(PERSONID,PARTYID),
    FOREIGN KEY(PARTYID) REFERENCES tblParty(PARTYID) ON DELETE  CASCADE,
    FOREIGN KEY(PERSONID) REFERENCES tblGuest(PersonID) ON DELETE CASCADE
);
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (1,1,DATE '2022-03-03');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (2,2,DATE '2022-03-09');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (3,3,DATE '2022-03-14');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (4,4,DATE '2022-03-15');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (5,5,DATE '2022-03-22');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (6,6,DATE '2022-03-23');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (7,7,DATE '2022-03-29');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (8,8,DATE '2022-04-04');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (9,9,DATE '2022-04-05');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (10,10,DATE '2022-04-06');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (1,11,DATE '2022-04-07');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (2,12,DATE '2022-04-08');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (3,13,DATE '2022-04-11');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (4,14,DATE '2022-04-13');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (5,15,DATE '2022-04-20');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (6,16,DATE '2022-05-04');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (7,17,DATE '2022-05-06');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (8,18,DATE '2022-05-09');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (9,19,DATE '2022-05-10');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (10,20,DATE '2022-05-19');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (1,21,DATE '2022-05-20');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (2,22,DATE '2022-05-23');
INSERT INTO tblGuestParty(PartyID,PersonID,DateJoined) VALUES (3,23,DATE '2022-05-23');
/
CREATE TABLE tblPartyRoom(
    PartyID NUMBER,
    RoomID NUmber,
    DateOfUse DATE,
    PRIMARY KEY(PartyID,RoomID),
    FOREIGN KEY(PartyID) REFERENCES tblParty(PartyID) ON DELETE CASCADE,
    FOREIGN KEY(RoomID) REFERENCES tblRoom(RoomID) ON DELETE CASCADE
);
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(1,8,DATE '2022-03-08' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(2,4,DATE '2011-01-10' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(3,3,DATE '2020-04-20' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(4,2,DATE '2010-05-22' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(5,6,DATE '2022-01-28' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(6,8,DATE '2009-08-26' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(7,8,DATE '2017-12-12' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(8,8,DATE '2016-11-20' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(9,7,DATE '2021-02-18' );
INSERT INTO tblPartyRoom(PartyID,RoomID,DATEOFUSE) VALUES(10,5,DATE '2014-10-01' );
/
CREATE TABLE tblDishAllergy(
    DishID NUMBER,
    AllergyID NUMBER,
    PRIMARY KEY(DISHID,ALLERGYID),
    FOREIGN KEY(AllergyID) REFERENCES tblAllergy(AllergyID) ON DELETE CASCADE,
    FOREIGN KEY(DishID) REFERENCES tblDIsh(DishID) ON DELETE CASCADE
);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(1,8);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(1,13);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(2,9);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(2,12);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(2,13);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(5,11);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(3,10);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(3,13);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(4,8);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(4,9);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(4,13);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(5,2);
INSERT INTO tbldishallergy(DISHID,AllergyID) VALUES(6,8);
/
CREATE TABLE tblService(
    ServiceID NUMBER PRIMARY KEY,
    Description VARCHAR(120),
    Cruciality VARCHAR(60)
);

DROP SEQUENCE ServiceSeq;
CREATE SEQUENCE ServiceSeq;

DROP TRIGGER ServiceAUTO;
CREATE TRIGGER ServiceAUTO
BEFORE INSERT ON tblService
FOR EACH ROW
BEGIN
    IF :NEW.ServiceID IS NULL THEN
        :NEW.ServiceID := ServiceSeq.NEXTVAL;
    END IF;
END;
/
INSERT INTO tblService (Description,Cruciality) VALUES ('Vacuuming','Moderately important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Laundry','Moderetely important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Roomservice','Moderately important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Personal food preperation','Extremely important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('General food preperation','Extremely important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Welcoming Staff','Not so important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Waiters','Not so important short term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Courier','Moderately important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Dry cleaning','Not so important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Valet','Not so important long term');
INSERT INTO tblService (Description,Cruciality) VALUES ('Ironing','Not so important long term');
/
CREATE TABLE tblServiceRole(
    ServiceID NUMBER,
    RoleID NUMBER,
    IsBestForTask NUMBER(1),
    PRIMARY KEY(SERVICEID,ROLEID),
    FOREIGN KEY (ServiceID) REFERENCES tblService(ServiceID) ON DELETE CASCADE,
    FOREIGN KEY(RoleID) REFERENCES tblRole(RoleID) ON DELETE CASCADE
);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,1,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (2,1,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (3,1,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (4,1,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (5,1,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (6,1,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (7,1,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (8,1,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (9,1,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,2,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,3,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,4,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,5,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,6,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,7,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,8,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (1,9,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (11,23,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (10,25,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (9,31,0);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (8,29,1);
INSERT INTO tblServiceRole(ServiceID,RoleID,IsBestForTask) VALUES (4,13,0);