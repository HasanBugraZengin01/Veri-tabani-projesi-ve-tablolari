SELECT Product.ProductStatus, Purchases.Buy
FROM Product
RIGHT JOIN Purchases ON Product.ProductID = Purchases.ProductID