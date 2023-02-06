----- Show Table ------

CREATE TABLE show (
  show_id INT PRIMARY KEY,
  show_name NVARCHAR(200)
);

INSERT INTO show values
  (1, 'Les miserables'),
  (2, 'Hamilton'),
  (3, 'Marry Poppins'),
  (4, 'Frozen'),
  (5, 'Wicked'),
  (6, 'Phantom Of the Opera'),
  (7, 'Rent'),
  (8, 'Miss Saigon'),
  (9, 'The Book of Mormon'),
  (10, 'West Side Story');

------ Theatre Table ------

CREATE TABLE theatre (
  theatre_id INT PRIMARY KEY,
  theatre_name NVARCHAR(200),
  location NVARCHAR(200)
);

INSERT INTO theatre values 
  (1, 'Palace Theatre', 'New York'),
  (2, 'West End theatre', 'London'),
  (3, 'Sands Theatres', 'Singapore'),
  (4, 'Shiki Theatre', 'Tokyo'),
  (5, 'Sydney Opera House', 'Australia');

----- Payment Distributor ------
CREATE TABLE seller (
  seller_id INT PRIMARY KEY,
  seller name NVARCHAR(200)
);

INSERT INTO seller values
  (1, 'Ticketmania.com'),
  (2, 'Ticket Event Pre Sale'),
  (3, 'Ticket Box Office Booth'),
  (4, 'Second Sale');

----- Customer table-----

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  customer_name NVARCHAR(200),
  email NVARCHAR(50),
  phone NVARCHAR (10)
);

INSERT INTO customer values  
  (1, 'John', 'john123@gmail.com', '0987665666'),
(2, 'Mary', 'mmm123@gmail.com', '066442234444'),
(3, 'Eve', 'eve.tha@gmail.com', '0986731122'),
(4, 'Jorad', 'jisthemow@gmail.com', '0985673344'),
(5, 'Max', 'mwaswms@gmail.com', '0988654444'),
(6, 'Jenny', 'jjdouble@gmail.com', '0988790066'),
(7, 'Smith', 'smith_1992@gmail.com', '0983421156'),
(8, 'Louise', 'lovemydogisme@gmail.com', '0987864356'),
(9, 'Vee', 'veethanakool@gmail.com', '0987890052'),
(10, 'Tha', 'ttt.oisd@gmail.com', '0981235432');

----- Ticket Table ------

CREATE TABLE ticket (
  ticket_id INT PRIMARY KEY,
  show_date date,
  show_id INT, 
  theatre_id INT,
  price NUMERIC,
  seller_id INT,
  customer_id INT,
  FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
  FOREIGN KEY (show_id) REFERENCES show(show_id)
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
  FOREIGN KEY (seller_id) REFERENCES seller(seller_id)
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO ticket values
  (1, '09-11-2020', 1,2, 2500,1,4),
  (2, '09-09-2022', 2,4, 2500,2,3),
  (3, '08-09-2022', 5,5, 5500,2,2),
  (4, '14-02-2021', 3,1, 3500,1,1),
  (5, '01-05-2021', 6,4, 1500,3,5),
  (6, '25-03-2021', 7,3, 1500,4,6),
  (7, '04-05-2022', 8,2, 4500,4,8),
  (8, '14-02-2021', 10,4, 4500,3,9),
  (9, '22-05-2022', 2,2, 3500,2,10),
  (10,'09-06-2020', 9,3, 3500,1,7);

.mode column
.header on

.print รายการสั่งซื้อตั๋วทั้งหมด
SELECT 
  tk.ticket_id,
  tk.show_date,
  c.customer_name,
  s.show_name,
  th.theatre_name,
  tk.price
FROM ticket AS tk
JOIN customer AS c ON c.customer_id = tk.customer_id 
JOIN show AS s ON s.show_id = tk.show_id 
JOIN theatre AS th ON th.theatre_id = tk.theatre_id;

.print อยากรู้ว่ายอดขายตั๋วของโรง Shiki Theatre มีเท่าไหร่
SELECT 
  SUM(price) AS Shiki_SUMprice
  FROM ticket
  WHERE theatre_id = '4';

.print รายชื่อ customer ทั้งหมดที่ซื้อบัตรละครเวทีเรื่อง Hamilton

SELECT
  tk.ticket_id,
  c.customer_name
  FROM ticket AS tk
JOIN customer AS c ON c.customer_id = tk.customer_id
JOIN show AS s ON s.show_id = tk.show_id 
  WHERE show_name = 'Hamilton';

.print การแสดงที่ Shiki Theatre แสดงเรื่องเมื่อไหร่อะไรบ้าง

---WITH sub AS(
  SELECT 
    show_name AS show,
    show_date AS date
  FROM ticket AS tk
  JOIN theatre AS th ON th.theatre_id = tk.theatre_id
  JOIN show AS s ON s.show_id = tk.show_id
  WHERE theatre_name = 'Shiki Theatre';
---) 
 --- SELECT SUM(price) FROM sub;
