create database PET;
use PET;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE, password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
    amount DECIMAL(10,2),
    date DATE,
    description VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Users (name, email, password) VALUES
('sam sulek', 'samsulek@gmail.com', 'Steroids'),
('will Smith', 'willsmith2001@gmail.com', 'root'),
('jessy pinkman', 'pinkman1608@gmail.com', 'praisethelord'),
('walter white', 'saymyname@gmail.com', 'heisenberg'),
('Guts','gutsself@gmail.com','dragonslayer');


INSERT INTO Categories (category_id,category_name,user_id) VALUES
(101,'Food',1), (102,'Transport',2), (103,'Shopping',3), (104,'Entertainment',4),(105,'Bills',5);


select * from Categories;

INSERT INTO Expenses (user_id, category_id, amount, date, description) VALUES
(1, 101, 250.50, '2025-01-01', 'Grocery shopping'),
(2, 102, 100.00, '2025-01-02', 'Bus fare'),
(3, 103, 1500.75, '2025-01-03', 'Online shopping - Amazon'),
(4, 104, 800.00, '2025-01-04', 'Electricity bill'),
(1, 105, 350.00, '2025-01-05', 'Movie night'),
(2, 101, 400.25, '2025-01-06', 'Dinner at a restaurant'),
(3, 102, 60.00, '2025-01-07', 'Metro ticket'),
(4, 103, 1200.50, '2025-01-08', 'New shoes'),
(1, 104, 900.00, '2025-01-09', 'Internet bill'),
(2, 105, 200.00, '2025-01-10', 'Concert ticket'),
(3, 101, 500.00, '2025-01-11', 'Monthly groceries'),
(4, 102, 85.50, '2025-01-12', 'Taxi fare'),
(1, 103, 650.00, '2025-01-13', 'Clothes shopping'),
(2, 104, 750.25, '2025-01-14', 'Water bill'),
(3, 105, 300.00, '2025-01-15', 'Netflix subscription'),
(4, 101, 320.75, '2025-01-16', 'Fast food order'),
(1, 102, 55.00, '2025-01-17', 'Uber ride'),
(2, 103, 1300.00, '2025-01-18', 'Laptop accessories'),
(3, 104, 700.00, '2025-01-19', 'Gas bill'),
(4, 105, 180.00, '2025-01-20', 'Video game purchase'),
(1, 101, 420.00, '2025-01-21', 'Supermarket shopping'),
(2, 102, 95.00, '2025-01-22', 'Train ticket'),
(3, 103, 1100.00, '2025-01-23', 'Smartphone case'),
(4, 104, 650.75, '2025-01-24', 'Mobile recharge'),
(1, 105, 250.00, '2025-01-25', 'Concert pass'),
(2, 101, 470.50, '2025-01-26', 'Bakery expenses'),
(3, 102, 60.00, '2025-01-27', 'Subway ride'),
(4, 103, 1450.00, '2025-01-28', 'Winter clothing'),
(1, 104, 825.00, '2025-01-29', 'Electricity bill'),
(2, 105, 190.00, '2025-01-30', 'Spotify premium'),
(3, 101, 380.00, '2025-01-31', 'Restaurant meal'),
(4, 102, 120.00, '2025-02-01', 'Gas station fuel'),
(1, 103, 950.00, '2025-02-02', 'Shopping mall'),
(2, 104, 880.50, '2025-02-03', 'Water bill'),
(3, 105, 220.00, '2025-02-04', 'Sports streaming subscription'),
(4, 101, 410.25, '2025-02-05', 'Dinner out'),
(1, 102, 70.00, '2025-02-06', 'Rickshaw fare'),
(2, 103, 1350.00, '2025-02-07', 'New backpack'),
(3, 104, 720.00, '2025-02-08', 'Electricity bill'),
(4, 105, 200.00, '2025-02-09', 'Movie tickets'),
(1, 101, 530.00, '2025-02-10', 'Groceries from Walmart'),
(2, 102, 100.00, '2025-02-11', 'Bike maintenance'),
(3, 103, 1200.00, '2025-02-12', 'Headphones purchase'),
(4, 104, 740.25, '2025-02-13', 'Cable TV bill'),
(1, 105, 180.00, '2025-02-14', 'Gaming subscription'),
(2, 101, 490.50, '2025-02-15', 'Weekend brunch'),
(3, 102, 80.00, '2025-02-16', 'Train fare'),
(4, 103, 1100.00, '2025-02-17', 'Winter boots'),
(1, 104, 900.00, '2025-02-18', 'Internet bill'),
(2, 105, 250.00, '2025-02-19', 'Concert night');

select * from Categories;

select * from Expenses;

select * from Users;

SELECT e.expense_id, c.category_name, e.amount, e.date, e.description 
FROM Expenses as e JOIN Categories as c ON e.category_id = c.category_id 
order by e.expense_id;