BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS card_deck;
DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS decks;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS card_id;
DROP SEQUENCE IF EXISTS deck_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE card_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE deck_id
	INCREMENT BY 1
  	NO MAXVALUE
  	NO MINVALUE
  	CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

/* Tables
		cards
		decks
		card-deck
		tags/keywords
		tag-card
 */
CREATE TABLE cards (
	card_id int DEFAULT nextval('card_id'::regclass) NOT NULL,
	front varchar(1000) NOT NULL,
	back varchar(1000) NOT NULL,
	card_creator_id int NOT NULL,
	CONSTRAINT PK_card_id PRIMARY KEY (card_id),
	CONSTRAINT FK_card_creator_id FOREIGN KEY (card_creator_id) REFERENCES users(user_id)
);

CREATE TABLE decks (
	deck_id int DEFAULT nextval('deck_id'::regclass) NOT NULL,
	deck_name varchar (100) NOT NULL,
	deck_user_id int NOT NULL,
	CONSTRAINT PK_deck_id PRIMARY KEY (deck_id),
	CONSTRAINT FK_deck_user_id FOREIGN KEY (deck_user_id) REFERENCES users(user_id)
);

CREATE TABLE card_deck (
	card_id int NOT NULL,
	deck_id int NOT NULL,
	CONSTRAINT FK_card_id FOREIGN KEY (card_id) REFERENCES cards(card_id),
	CONSTRAINT FK_deck_id FOREIGN KEY (deck_id) REFERENCES decks(deck_id)

);




INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- Math 6th Grade Questions

INSERT INTO cards(front, back, card_creator_id) VALUES ('Which number is larger: -2 or -5?', 'Answer: -2', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 85% of 21?', 'Answer: 17.85', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('8.563 + 4.8292 = ?', 'Answer: 13.3922', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Solve for 47 – x, when x = 23', 'Answer: 24', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Solve for w, when 9 – w = 8', 'Answer: w = 1', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Place the correct symbol (either < or >) between these two numbers: 6  7', 'Answer: 6 < 7', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Find the area of a triangle with a base of 4 cm and a height of 5 cm.', 'Answer: 10 cm²', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Calculate the mean of these four numbers: 5, 3, 6, 2.', 'Answer: 4', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is ⅘ ÷ ½ = ?', 'Answer: 1⅗', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is the absolute value of -8?', 'Answer: 8', 2);

-- 7Th Grade Math
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 6 ÷ -2 ?', 'Answer: -3', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is -|52| ?', 'Answer: -52', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is |5 × -3| ?', 'Answer: 15', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is -|5 - 9| ?', 'Answer: -4', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is |2 − 7| ?', 'Answer: 5', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is -2 + (+18) ?', 'Answer: 16', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 3 + (-12) ?', 'Answer: -9', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is -8 + (+14) ?', 'Answer: 6', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 6 + (-6) ?', 'Answer: 5', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 4 + (-9) ?', 'Answer: -5', 2);

-- 8th Grade Math
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert the decimal 0.0009 to a percent', 'Answer: 0.09%', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert the decimal 0.00702 to a percent', 'Answer: 0.702%', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert 8015 % to a decimal', 'Answer: 80.15', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert the decimal 3.69 to a percent', 'Answer: 369%', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert 0.0309 % to a decimal', 'Answer: 0.000309', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Factor: 2y + 8', 'Answer: 2(y + 4)', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Factor: 3y - 12', 'Answer: 3(y - 4)', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Factor 16y − 40', 'Answer: 8(2y − 5)', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('A cheetah can run at an average speed of 108 km/h. What is its speed in m/s?', 'Answer: 30 m/s', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('A passenger jet has a speed of 900 km/h. What is its speed in m/s?', 'Answer: 250 m/s', 2);

-- 6th Grade History
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: Are lines on a map that run in the east-west direction lines of latitude or longitude?', 'Answer: Latitude', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: What is cartography?', 'Answer: The study and practice of making maps', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: What is the smallest country in Europe?', 'Answer: Vatican City', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: What is the top layer of a rainforest called?', 'Answer: Emergent layer', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: Japan is an island in what body of water?', 'Answer: Pacific Ocean', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: What is the name for the native people of New Zealand?', 'Answer: Maori', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: Name the financial measure of a countrys produced goods and services.', 'Answer: GDP, or gross domestic product', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: What is the name of the island country off the coast of Africa?', 'Answer: Madagascar', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: What is the capital of New York?', 'Answer: Albany', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Question: What is the wintry-like biome called?', 'Answer: Tundra', 2);


INSERT INTO decks (deck_name, deck_user_id) VALUES ('6th Grade Math', 2);
INSERT INTO decks (deck_name, deck_user_id) VALUES ('7th Grade Math', 2);
INSERT INTO decks (deck_name, deck_user_id) VALUES ('8th Grade Math', 2);
INSERT INTO decks (deck_name, deck_user_id) VALUES ('6th Grade History', 2);

INSERT INTO card_deck(card_id, deck_id) VALUES (1, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (2, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (3, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (4, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (5, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (6, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (7, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (8, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (9, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (10, 1);

INSERT INTO card_deck(card_id, deck_id) VALUES (11, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (12, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (13, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (14, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (15, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (16, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (17, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (18, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (19, 2);
INSERT INTO card_deck(card_id, deck_id) VALUES (20, 2);

INSERT INTO card_deck(card_id, deck_id) VALUES (21, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (22, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (23, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (24, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (25, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (26, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (27, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (28, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (29, 3);
INSERT INTO card_deck(card_id, deck_id) VALUES (30, 3);


-- 6Grade History
INSERT INTO card_deck(card_id, deck_id) VALUES (31, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (32, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (33, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (34, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (35, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (36, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (37, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (38, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (39, 4);
INSERT INTO card_deck(card_id, deck_id) VALUES (40, 4);



COMMIT TRANSACTION; 
