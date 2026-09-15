SELECT S_SSN,ProductName,Buy
FROM Product
INNER JOIN Purchases ON Product.ProductID = Purchases.ProductID