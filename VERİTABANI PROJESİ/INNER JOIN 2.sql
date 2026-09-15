SELECT ProductID,CertificationDate,CertificationNumber
FROM Certified
INNER JOIN CertificationBody ON Certified.CerID = CertificationBody.CerID