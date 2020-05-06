CREATE TABLE card_holder(
	card_holder_id INT PRIMARY KEY NOT NULL,
	full_name VARCHAR(255)
);

CREATE TABLE credit_card(
    card VARCHAR(20),
	card_holder_id INT NOT NULL,
    FOREIGN KEY (card_holder_id) REFERENCES card_holder(card_holder_id)    
);

CREATE TABLE merchant
(
	merchant_id INT PRIMARY KEY NOT NULL,
	merchant_name VARCHAR(255),
	merchant_category_id INT NOT NULL,
    FOREIGN KEY (merchant_category_id) REFERENCES merchant_category(merchant_category_id)
);

CREATE TABLE transaction
(
	transactions_id INT PRIMARY KEY NOT NULL,
	creat_date timestamp,
    amount FLOAT,
	card_number VARCHAR(20),
	merchant_id INT NOT NULL,    
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id) 
);

CREATE TABLE merchant_category
(
	merchant_category_id INT PRIMARY KEY NOT NULL,
	merchant_name VARCHAR(255)
);