-- Create the CertificationBody table
CREATE TABLE CertificationBody (
    CerID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    CertificationNumber VARCHAR(50),
    CertificationCriteria VARCHAR(255),
    CompanyContactInfo VARCHAR(100),
    CertificationCompany VARCHAR(100)
);

-- Create the Supplier table
CREATE TABLE Supplier (
    S_SSN INT PRIMARY KEY,
    SupplierName VARCHAR(255),
    ContactInfo VARCHAR(100),
    Address VARCHAR(255),
    SupplierCertificationStatus VARCHAR(20),
    CerID INT,
    FOREIGN KEY (CerID) REFERENCES CertificationBody(CerID)
);

-- Create the Product table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    ProductType VARCHAR(50),
    ProductPrice DECIMAL(10, 2),
    ProductStatus VARCHAR(20),
    ProductExpirationDate DATE,
    S_SSN INT,
    FOREIGN KEY (S_SSN) REFERENCES Supplier(S_SSN)
);

-- Create the Customer table
CREATE TABLE Customer (
    C_SSN INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    ContactInfo VARCHAR(100),
    Address VARCHAR(255),
	CPurcHistory VARCHAR(255)
    -- Diğer ilgili sütunları ekleyin
);

-- Create the Ingredient table
CREATE TABLE Ingredient (
    IngID INT PRIMARY KEY,
    IngredientName VARCHAR(255),
    NutritionalInfo VARCHAR(255),
    IngredientSource VARCHAR(100)
);

-- Create the Purchases table (Product ve Customer arasındaki çoktan-çoka ilişki)
CREATE TABLE Purchases (
    ProductID INT,
    C_SSN INT,
    Buy VARCHAR(255),
    PRIMARY KEY (ProductID, C_SSN),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (C_SSN) REFERENCES Customer(C_SSN)
);

-- Create the ProductIngredient table (Product ve Ingredient arasındaki çoktan-çoka ilişki)
CREATE TABLE Contain (
    ProductID INT,
    IngID INT,
    Description VARCHAR(255),
    PRIMARY KEY (ProductID, IngID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (IngID) REFERENCES Ingredient(IngID)
);

-- Create the Certified table (Product ve CertificationBody arasındaki çoktan-çoka ilişki)
CREATE TABLE Certified (
    ProductID INT,
    CerID INT,
    CertificationDate DATE,
    PRIMARY KEY (ProductID, CerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CerID) REFERENCES CertificationBody(CerID)
);

-- Create the CuPHistory table (ProductID, C_SSN ve CuPHistory'den oluşan bileşik anahtar)
CREATE TABLE CuPHistory (
    ProductID INT,
    C_SSN INT,
    CuPHistory VARCHAR(255),
    PRIMARY KEY (ProductID, C_SSN, CuPHistory),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (C_SSN) REFERENCES Customer(C_SSN)
);
