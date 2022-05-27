SELECT tblBank.B_NAME "Bank",tblPerson.FirstName,tblPerson.SurName,tblPersonBank.AccountNumber,tblPersonBank.BranchNumber FROM tblBANK
INNER JOIN tblPersonBANK ON tblPERSONBANK.BANKID = tblBank.BankID
INNER JOIN tblPERSON ON tblPERSOn.PersonID = tblPersonBANK.PersonID
WHERE ROWNUM <= 10;