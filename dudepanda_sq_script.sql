CREATE TABLE DELETE_DATE (
  DELETE_DATE VARCHAR(15), 
  TABLE_NAME VARCHAR(64) NOT NULL, 
  PRIMARY KEY (TABLE_NAME)
); 

CREATE TABLE Cart (
  idCart INTEGER  NOT NULL   IDENTITY   ,
PRIMARY KEY(idCart));
GO


CREATE TRIGGER EXCDT_Cart
ON Cart AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Cart') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Cart' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Cart', @dt)
END;

GO 




CREATE TABLE Feedback (
  idFeedback INTEGER  NOT NULL   IDENTITY ,
  Complaint VARCHAR      ,
PRIMARY KEY(idFeedback));
GO


CREATE TRIGGER EXCDT_Feedback
ON Feedback AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Feedback') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Feedback' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Feedback', @dt)
END;

GO 




CREATE TABLE Admins_Dashboard (
  idAdmins_Dashboard INTEGER  NOT NULL   IDENTITY ,
  weekly_sales INTEGER    ,
  Total_orders INTEGER    ,
  Registered_vendor VARCHAR    ,
  monthly_sales INTEGER      ,
PRIMARY KEY(idAdmins_Dashboard));
GO


CREATE TRIGGER EXCDT_Admins_Dashboard
ON Admins_Dashboard AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Admins_Dashboard') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Admins_Dashboard' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Admins_Dashboard', @dt)
END;

GO 




CREATE TABLE Admin_Report (
  idAdmin_Report INTEGER  NOT NULL   IDENTITY ,
  Order_growth INTEGER    ,
  Vendor_growth INTEGER    ,
  Customer_growth INTEGER    ,
  sales_growth INTEGER      ,
PRIMARY KEY(idAdmin_Report));
GO


CREATE TRIGGER EXCDT_Admin_Report
ON Admin_Report AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Admin_Report') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Admin_Report' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Admin_Report', @dt)
END;

GO 




CREATE TABLE sale_info (
  idsale_info INTEGER  NOT NULL   IDENTITY ,
  Admins_Dashboard_idAdmins_Dashboard INTEGER  NOT NULL    ,
PRIMARY KEY(idsale_info)  ,
  FOREIGN KEY(Admins_Dashboard_idAdmins_Dashboard)
    REFERENCES Admins_Dashboard(idAdmins_Dashboard));
GO


CREATE INDEX sale_info_FKIndex1 ON sale_info (Admins_Dashboard_idAdmins_Dashboard);
GO


CREATE TRIGGER EXCDT_sale_info
ON sale_info AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'sale_info') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'sale_info' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('sale_info', @dt)
END;

GO 


CREATE INDEX IFK_Rel_22 ON sale_info (Admins_Dashboard_idAdmins_Dashboard);
GO


CREATE TABLE Customer_Information (
  idCustomer INTEGER  NOT NULL   IDENTITY ,
  Admin_Report_idAdmin_Report INTEGER  NOT NULL  ,
  Cart_idCart INTEGER  NOT NULL  ,
  No_of_orders INTEGER    ,
  customer_phone_number INTEGER    ,
  customer_email VARCHAR    ,
  Account_No INTEGER    ,
  Password_2 VARCHAR    ,
  username VARCHAR    ,
  customer_name' VARCHAR      ,
PRIMARY KEY(idCustomer)    ,
  FOREIGN KEY(Cart_idCart)
    REFERENCES Cart(idCart),
  FOREIGN KEY(Admin_Report_idAdmin_Report)
    REFERENCES Admin_Report(idAdmin_Report));
GO


CREATE INDEX Customer_Information_FKIndex1 ON Customer_Information (Cart_idCart);
GO
CREATE INDEX Customer_Information_FKIndex2 ON Customer_Information (Admin_Report_idAdmin_Report);
GO


CREATE TRIGGER EXCDT_Customer_Information
ON Customer_Information AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Customer_Information') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Customer_Information' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Customer_Information', @dt)
END;

GO 


CREATE INDEX IFK_Rel_07 ON Customer_Information (Cart_idCart);
GO
CREATE INDEX IFK_Rel_19 ON Customer_Information (Admin_Report_idAdmin_Report);
GO


CREATE TABLE Feedback_has_Customer_Information (
  Feedback_idFeedback INTEGER  NOT NULL  ,
  Customer_Information_idCustomer INTEGER  NOT NULL    ,
PRIMARY KEY(Feedback_idFeedback, Customer_Information_idCustomer)    ,
  FOREIGN KEY(Feedback_idFeedback)
    REFERENCES Feedback(idFeedback),
  FOREIGN KEY(Customer_Information_idCustomer)
    REFERENCES Customer_Information(idCustomer));
GO


CREATE INDEX Feedback_has_Customer_Information_FKIndex1 ON Feedback_has_Customer_Information (Feedback_idFeedback);
GO
CREATE INDEX Feedback_has_Customer_Information_FKIndex2 ON Feedback_has_Customer_Information (Customer_Information_idCustomer);
GO


CREATE TRIGGER EXCDT_Feedback_has_Customer_In
ON Feedback_has_Customer_Information AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Feedback_has_Customer_Information') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Feedback_has_Customer_Information' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Feedback_has_Customer_Information', @dt)
END;

GO 


CREATE INDEX IFK_Rel_14 ON Feedback_has_Customer_Information (Feedback_idFeedback);
GO
CREATE INDEX IFK_Rel_15 ON Feedback_has_Customer_Information (Customer_Information_idCustomer);
GO


CREATE TABLE Vendor_Information (
  Vendor_id INTEGER  NOT NULL   IDENTITY ,
  Admins_Dashboard_idAdmins_Dashboard INTEGER  NOT NULL  ,
  Admin_Report_idAdmin_Report INTEGER  NOT NULL  ,
  Cart_idCart INTEGER  NOT NULL  ,
  Registration_date DATE    ,
  Menu_items VARCHAR    ,
  Vendor_name VARCHAR    ,
  vendor_email VARCHAR    ,
  vendor_Phone_No INTEGER      ,
PRIMARY KEY(Vendor_id)      ,
  FOREIGN KEY(Cart_idCart)
    REFERENCES Cart(idCart),
  FOREIGN KEY(Admin_Report_idAdmin_Report)
    REFERENCES Admin_Report(idAdmin_Report),
  FOREIGN KEY(Admins_Dashboard_idAdmins_Dashboard)
    REFERENCES Admins_Dashboard(idAdmins_Dashboard));
GO


CREATE INDEX Vendor_Information_FKIndex1 ON Vendor_Information (Cart_idCart);
GO
CREATE INDEX Vendor_Information_FKIndex2 ON Vendor_Information (Admin_Report_idAdmin_Report);
GO
CREATE INDEX Vendor_Information_FKIndex3 ON Vendor_Information (Admins_Dashboard_idAdmins_Dashboard);
GO


CREATE TRIGGER EXCDT_Vendor_Information
ON Vendor_Information AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Vendor_Information') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Vendor_Information' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Vendor_Information', @dt)
END;

GO 


CREATE INDEX IFK_Rel_11 ON Vendor_Information (Cart_idCart);
GO
CREATE INDEX IFK_Rel_18 ON Vendor_Information (Admin_Report_idAdmin_Report);
GO
CREATE INDEX IFK_Rel_23 ON Vendor_Information (Admins_Dashboard_idAdmins_Dashboard);
GO


CREATE TABLE Order_info (
  id_Order INTEGER  NOT NULL   IDENTITY ,
  Admins_Dashboard_idAdmins_Dashboard INTEGER  NOT NULL  ,
  Admin_Report_idAdmin_Report INTEGER  NOT NULL  ,
  Cart_idCart INTEGER  NOT NULL  ,
  Placement_time TIME    ,
  Vendor_name VARCHAR    ,
  Offer VARCHAR    ,
  Total_amount INTEGER    ,
  Order_items VARCHAR    ,
  Order_date DATE    ,
  Order_Status VARCHAR      ,
PRIMARY KEY(id_Order)      ,
  FOREIGN KEY(Cart_idCart)
    REFERENCES Cart(idCart),
  FOREIGN KEY(Admin_Report_idAdmin_Report)
    REFERENCES Admin_Report(idAdmin_Report),
  FOREIGN KEY(Admins_Dashboard_idAdmins_Dashboard)
    REFERENCES Admins_Dashboard(idAdmins_Dashboard));
GO


CREATE INDEX Order_info_FKIndex1 ON Order_info (Cart_idCart);
GO
CREATE INDEX Order_info_FKIndex2 ON Order_info (Admin_Report_idAdmin_Report);
GO
CREATE INDEX Order_info_FKIndex3 ON Order_info (Admins_Dashboard_idAdmins_Dashboard);
GO


CREATE TRIGGER EXCDT_Order_info
ON Order_info AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Order_info') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Order_info' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Order_info', @dt)
END;

GO 


CREATE INDEX IFK_Rel_08 ON Order_info (Cart_idCart);
GO
CREATE INDEX IFK_Rel_17 ON Order_info (Admin_Report_idAdmin_Report);
GO
CREATE INDEX IFK_Rel_21 ON Order_info (Admins_Dashboard_idAdmins_Dashboard);
GO


CREATE TABLE Order_info_has_sale_info (
  Order_info_id_Order INTEGER  NOT NULL  ,
  sale_info_idsale_info INTEGER  NOT NULL    ,
PRIMARY KEY(Order_info_id_Order, sale_info_idsale_info)    ,
  FOREIGN KEY(Order_info_id_Order)
    REFERENCES Order_info(id_Order),
  FOREIGN KEY(sale_info_idsale_info)
    REFERENCES sale_info(idsale_info));
GO


CREATE INDEX Order_info_has_sale_info_FKIndex1 ON Order_info_has_sale_info (Order_info_id_Order);
GO
CREATE INDEX Order_info_has_sale_info_FKIndex2 ON Order_info_has_sale_info (sale_info_idsale_info);
GO


CREATE TRIGGER EXCDT_Order_info_has_sale_info
ON Order_info_has_sale_info AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Order_info_has_sale_info') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Order_info_has_sale_info' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Order_info_has_sale_info', @dt)
END;

GO 


CREATE INDEX IFK_Rel_24 ON Order_info_has_sale_info (Order_info_id_Order);
GO
CREATE INDEX IFK_Rel_25 ON Order_info_has_sale_info (sale_info_idsale_info);
GO


CREATE TABLE Product_info (
  idProduct INTEGER  NOT NULL   IDENTITY ,
  Vendor_Information_Vendor_id INTEGER  NOT NULL  ,
  Cart_idCart INTEGER  NOT NULL  ,
  Stock INTEGER    ,
  product_price INTEGER    ,
  Product_Category VARCHAR    ,
  Product_name VARCHAR    ,
  Product_name_2 VARCHAR      ,
PRIMARY KEY(idProduct)    ,
  FOREIGN KEY(Cart_idCart)
    REFERENCES Cart(idCart),
  FOREIGN KEY(Vendor_Information_Vendor_id)
    REFERENCES Vendor_Information(Vendor_id));
GO


CREATE INDEX Product_FKIndex1 ON Product_info (Cart_idCart);
GO
CREATE INDEX Product_FKIndex2 ON Product_info (Vendor_Information_Vendor_id);
GO


CREATE TRIGGER EXCDT_Product_info
ON Product_info AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Product_info') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Product_info' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Product_info', @dt)
END;

GO 


CREATE INDEX IFK_Rel_10 ON Product_info (Cart_idCart);
GO
CREATE INDEX IFK_Rel_16 ON Product_info (Vendor_Information_Vendor_id);
GO


CREATE TABLE Product_info_has_sale_info (
  Product_info_idProduct INTEGER  NOT NULL  ,
  sale_info_idsale_info INTEGER  NOT NULL    ,
PRIMARY KEY(Product_info_idProduct, sale_info_idsale_info)    ,
  FOREIGN KEY(Product_info_idProduct)
    REFERENCES Product_info(idProduct),
  FOREIGN KEY(sale_info_idsale_info)
    REFERENCES sale_info(idsale_info));
GO


CREATE INDEX Product_info_has_sale_info_FKIndex1 ON Product_info_has_sale_info (Product_info_idProduct);
GO
CREATE INDEX Product_info_has_sale_info_FKIndex2 ON Product_info_has_sale_info (sale_info_idsale_info);
GO


CREATE TRIGGER EXCDT_Product_info_has_sale_in
ON Product_info_has_sale_info AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Product_info_has_sale_info') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Product_info_has_sale_info' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Product_info_has_sale_info', @dt)
END;

GO 


CREATE INDEX IFK_Rel_26 ON Product_info_has_sale_info (Product_info_idProduct);
GO
CREATE INDEX IFK_Rel_27 ON Product_info_has_sale_info (sale_info_idsale_info);
GO


CREATE TABLE Order_info_has_Product (
  Order_info_id_Order INTEGER  NOT NULL  ,
  Product_info_idProduct INTEGER  NOT NULL    ,
PRIMARY KEY(Order_info_id_Order, Product_info_idProduct)    ,
  FOREIGN KEY(Order_info_id_Order)
    REFERENCES Order_info(id_Order),
  FOREIGN KEY(Product_info_idProduct)
    REFERENCES Product_info(idProduct));
GO


CREATE INDEX Order_info_has_Product_FKIndex1 ON Order_info_has_Product (Order_info_id_Order);
GO
CREATE INDEX Order_info_has_Product_FKIndex2 ON Order_info_has_Product (Product_info_idProduct);
GO


CREATE TRIGGER EXCDT_Order_info_has_Product
ON Order_info_has_Product AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Order_info_has_Product') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Order_info_has_Product' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Order_info_has_Product', @dt)
END;

GO 


CREATE INDEX IFK_Rel_12 ON Order_info_has_Product (Order_info_id_Order);
GO
CREATE INDEX IFK_Rel_13 ON Order_info_has_Product (Product_info_idProduct);
GO


CREATE TABLE Customer_Information_has_Order_info (
  Customer_Information_idCustomer INTEGER  NOT NULL  ,
  Order_info_id_Order INTEGER  NOT NULL    ,
PRIMARY KEY(Customer_Information_idCustomer, Order_info_id_Order)    ,
  FOREIGN KEY(Customer_Information_idCustomer)
    REFERENCES Customer_Information(idCustomer),
  FOREIGN KEY(Order_info_id_Order)
    REFERENCES Order_info(id_Order));
GO


CREATE INDEX Customer_Information_has_Order_info_FKIndex1 ON Customer_Information_has_Order_info (Customer_Information_idCustomer);
GO
CREATE INDEX Customer_Information_has_Order_info_FKIndex2 ON Customer_Information_has_Order_info (Order_info_id_Order);
GO


CREATE TRIGGER EXCDT_Customer_Information_has
ON Customer_Information_has_Order_info AFTER DELETE 
AS 
BEGIN 
  DECLARE @dt VARCHAR(15); 
  set @dt = (select replace(CONVERT(VARCHAR(6),GETDATE(),12)+CONVERT(VARCHAR,GETDATE(),14), ':', '')) 
  IF EXISTS (SELECT 1 FROM DELETE_DATE WHERE     TABLE_NAME = 'Customer_Information_has_Order_info') 
    UPDATE DELETE_DATE SET DELETE_DATE = @dt     WHERE TABLE_NAME = 'Customer_Information_has_Order_info' 
  ELSE 
    INSERT INTO DELETE_DATE(TABLE_NAME, DELETE_DATE)     VALUES ('Customer_Information_has_Order_info', @dt)
END;

GO 


CREATE INDEX IFK_Rel_01 ON Customer_Information_has_Order_info (Customer_Information_idCustomer);
GO
CREATE INDEX IFK_Rel_02 ON Customer_Information_has_Order_info (Order_info_id_Order);
GO



