SELECT CuPHistory.ProductID, Customer.ContactInfo
FROM CuPHistory
RIGHT JOIN Customer ON CuPHistory.C_SSN = Customer.C_SSN