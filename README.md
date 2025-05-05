# Project Title
# Ecommerce Database System

## In ecommerce:

A Customer entity includes attributes like CustomerID, Name, Email.
A Product includes ProductID, Name, Stock, Price.
An Order links to both User and Product via relationships.

A customer can place orders, with each order linked back to a customer using UserID as a foreign key. 
ER Diagrams simplify database design by showing these relationships clearly and ensuring logical structure before implementation.

## Step 1: Identify Entities
Main entities in an ecommerce system:
•	Customer
•	Product
•	Order
•	OrderItem (junction entity for many-to-many between Orders and Products)
•	Payment
•	Category
•	Shipping

## Step 2: Define Attributes
•	Customer: CustomerID (PK), Name, Email, Phone, Address
•	Product: ProductID (PK), Name, Description, Price, Stock, CategoryID (FK)
•	Order: OrderID (PK), OrderDate, Status, CustomerID (FK)
•	OrderItem: OrderItemID (PK), OrderID (FK), ProductID (FK), Quantity, Subtotal
•	Payment: PaymentID (PK), PaymentDate, Amount, OrderID (FK), PaymentMethod
•	Category: CategoryID (PK), CategoryName
•	Shipping: ShippingID (PK), OrderID (FK), ShipDate, Carrier, TrackingNumber


## Step 3: Establish Relationships
•	A Customer places many Orders (one-to-many)
•	An Order contains many OrderItems (one-to-many)
•	A Product belongs to a Category (many-to-one)
•	A Product appears in many OrderItems (many-to-many via OrderItem)
•	An Order has one Payment
•	An Order has one Shipping

## Key Concepts of ER Diagrams
To build an effective ER Diagram, you need to understand its fundamental components:

**Entities**: These represent real-world objects. In ecommerce, typical entities include Customer, Product, and Order.
**Attributes**: These describe properties of an entity. For example, a Product might have ProductID, Name, and Price.
**Relationships**: These show how entities are connected. A Customer places an Order.
**Primary Keys (PK)**: Unique identifiers for each entity.
**Foreign Keys (FK)**: Attributes that link to primary keys in other tables to establish relationships.

Used **Entity-Relationship (ER) modeling** to design the schema. Here's an example for an **e-commerce system**:


Screenshot or link to the ERD! [https://dbdiagram.io/d/6818b2631ca52373f5809ddd]


That's what the project does

How to run/setup the project (or import SQL)



🧠 For Question 1:

Only one .sql file (well-commented)

💻 For Question 2:

Source code files (organized properly)

SQL script used to create your database
