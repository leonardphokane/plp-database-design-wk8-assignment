

-- Table: Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,				   -- Unique identifier for each customer
    Name VARCHAR(100),										   -- Customer's full name
    Email VARCHAR(100) UNIQUE,                                 -- Customer's email address
    Phone VARCHAR(20),										   -- Contact number
    Address TEXT											   -- Customer's address
);

-- Table: Category
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,				   -- Unique identifier for each category
    CategoryName VARCHAR(50),								   -- Category's name
    Description TEXT										   -- Category's Description 
);

-- Table: Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,				  -- Unique identifier for each product
    Name VARCHAR(100),										  -- Product's name
    Description TEXT,										  -- Product's description
    Price DECIMAL(10,2),									  -- Product's price
    CategoryID INT,										  -- Category ID
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)  -- Foreign keys establish entity relationships
);

-- Table: Order Table
CREATE TABLE OrderTable (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,							    -- Unique identifier for each product
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,					    -- Record creation timestamp
    TotalAmount DECIMAL(10,2),											-- Total amount
    ShippingID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)			-- Foreign keys establish entity relationships
);

-- Table: OrderItem
CREATE TABLE OrderItem (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,							-- Unique identifier for each product
    OrderID INT,
    ProductID INT,
    Quantity INT,														 -- Quantity of item
    Subtotal DECIMAL(10,2),												 -- Subtotal in decimals
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID),		
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)				 -- Foreign keys establish entity relationships
);

-- Table: Payment
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,					    -- Unique identifier for each product
    OrderID INT,
    PaymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,				    -- Date of payment
    AmountPaid DECIMAL(10,2),										 -- Amount a customer paid
    PaymentMethod VARCHAR(50),										 -- Method a customer used to pay
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)		     -- Foreign keys establish entity relationships
);

-- Table: Shipping
CREATE TABLE Shipping (
    ShippingID INT PRIMARY KEY AUTO_INCREMENT,					  -- Unique identifier for each Shipping
    OrderID INT,
    ShippingAddress TEXT,										  -- Shipping address
    ShippingMethod VARCHAR(50),									  -- Shipping method
    TrackingNumber VARCHAR(50),									  -- Tracking number
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)		  -- Foreign key establish entity relationships
);




INSERT INTO Customer (Name, Email, Phone, Address) 
VALUES ('John Doe', 'john@example.com', '1234567890', '123 Main St');

INSERT INTO Category (CategoryName, Description) 
VALUES ('Electronics', 'Gadgets and electronic items');

INSERT INTO Product (Name, Description, Price, CategoryID) 
VALUES ('Smartphone', 'Latest model smartphone', 699.99, 1);

INSERT INTO OrderTable (CustomerID, TotalAmount, ShippingID) 
VALUES (1, 699.99, NULL);

INSERT INTO OrderItem (OrderID, ProductID, Quantity, Subtotal) 
VALUES (1, 1, 1, 699.99);

INSERT INTO Payment (OrderID, AmountPaid, PaymentMethod) 
VALUES (1, 699.99, 'Credit Card');

INSERT INTO Shipping (OrderID, ShippingAddress, ShippingMethod, TrackingNumber) 
VALUES (1, '123 Main St', 'Standard', 'TRACK12345');
