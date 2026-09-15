SELECT Ingredient.NutritionalInfo, Contain.ProductID
FROM Ingredient
LEFT JOIN Contain ON Ingredient.IngID = Contain.IngID