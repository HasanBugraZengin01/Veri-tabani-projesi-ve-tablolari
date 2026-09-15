SELECT Customer.CustomerName, Purchases.Buy
FROM Customer
LEFT JOIN Purchases ON Customer.C_SSN = Purchases.C_SSN