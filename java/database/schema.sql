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
	deck_description varchar (1000) NOT NULL,
	deck_is_trial boolean NOT NULL,
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

INSERT INTO cards(front, back, card_creator_id) VALUES ('Which number is larger: -2 or -5?', ' -2', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 85% of 21?', ' 17.85', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('8.563 + 4.8292 = ?', ' 13.3922', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Solve for 47 – x, when x = 23', ' 24', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Solve for w, when 9 – w = 8', 'w = 1', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Place the correct symbol (either < or >) between these two numbers: 6  7', '6 < 7', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Find the area of a triangle with a base of 4 cm and a height of 5 cm.', '10 cm²', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Calculate the mean of these four numbers: 5, 3, 6, 2.', '4', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is ⅘ ÷ ½ = ?', '  1⅗', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is the absolute value of -8?', '8', 2);

-- 7Th Grade Math
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 6 ÷ -2 ?', '  -3', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is -|52| ?', ' -52', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is |5 × -3| ?', ' 15', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is -|5 - 9| ?', ' -4', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is |2 − 7| ?', ' 5', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is -2 + (+18) ?', ' 16', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 3 + (-12) ?', ' -9', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is -8 + (+14) ?', ' 6', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 6 + (-6) ?', ' 5', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('What is 4 + (-9) ?', ' -5', 2);

-- 8th Grade Math
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert the decimal 0.0009 to a percent', ' 0.09%', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert the decimal 0.00702 to a percent', ' 0.702%', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert 8015 % to a decimal', ' 80.15', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert the decimal 3.69 to a percent', ' 369%', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Convert 0.0309 % to a decimal', ' 0.000309', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Factor: 2y + 8', ' 2(y + 4)', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Factor: 3y - 12', ' 3(y - 4)', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('Factor 16y − 40', ' 8(2y − 5)', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('A cheetah can run at an average speed of 108 km/h. What is its speed in m/s?', ' 30 m/s', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('A passenger jet has a speed of 900 km/h. What is its speed in m/s?', ' 250 m/s', 2);

-- 6th Grade History
INSERT INTO cards(front, back, card_creator_id) VALUES (' Are lines on a map that run in the east-west direction lines of latitude or longitude?', ' Latitude', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is cartography?', ' The study and practice of making maps', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the smallest country in Europe?', ' Vatican City', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the top layer of a rainforest called?', ' Emergent layer', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Japan is an island in what body of water?', ' Pacific Ocean', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the name for the native people of New Zealand?', ' Maori', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Name the financial measure of a countrys produced goods and services.', ' GDP, or gross domestic product', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the name of the island country off the coast of Africa?', ' Madagascar', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the capital of New York?', ' Albany', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the wintry-like biome called?', ' Tundra', 2);

-- 7th Grade History
INSERT INTO cards(front, back, card_creator_id) VALUES ('What was the minimum registered unemployment figure in the US throughout the 1920s?', ' 2 Million', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What nickname was given to the 1920s decade, suggesting a furious pace of life and rapid changes?', ' The Roaring Twenties', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' A bill can also start in the _?', ' Senate', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' How many years is a President elected for?', ' 4 years', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Which Amendment abolished slavery', ' 13', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Who is the father of the constitution?', ' James Madison', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' A president must be at least _ years old.', ' 35', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' A member of the House of Representatives must be at least_yeas old.', ' 25', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' A senator must be at least _ years old', ' 30', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' When did women get the right to vote?', ' 1920', 2);

-- 8th Grade History
INSERT INTO cards(front, back, card_creator_id) VALUES ('What was the main economic activity in all colonies?', ' Farming', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is subsistence farming?', ' Producing enough to meet the families needs.', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What were the strict rules governing the behavior and punishment of slaves in the colonies?', ' The middle colonies', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is supply and demand?', ' Supply and Demand controls the prices of crops.', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Which colonial region was known for its diverse population of German and Scotch-Irish citizens?', ' 13', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is a cash crop?', ' crops that could be sold in markets', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Where was the hub of the shipping trade in America?', ' New England', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What was the name of the slave transporting leg of the Triangular Trade?', ' The middle passage', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What day was the Declaration of Independence approved?', ' July 4, 1776', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What were Hessians?', ' Hired soldiers', 2);

-- 6th Grade Science
INSERT INTO cards(front, back, card_creator_id) VALUES (' Coal, oil, and natural gas are all what types of fuel?', ' Fossil fuel', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the center of an atom called?', ' The nucleus', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Who proved that the Earth orbits the Sun?', ' Copernicus', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What do you call the process of breaking white light into colors?', ' Refraction', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Which is a measurement of the amount of material contained in a particular object?', ' Mass', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Where would you find the substance chlorophyll?', ' Plants', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Which of the following pH numbers indicates an alkali substance: 1 or 13?', ' 13', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the name for the largest part of the brain?', ' Cerebrum', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Name the process in which small particles of rocks are removed due to nature.', ' Erosion', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the name of a substance made up of two or more chemically bonded elements?', ' Compound', 2);

-- 7th Grade Science 
INSERT INTO cards(front, back, card_creator_id) VALUES (' Acids are found in many common chemicals, including foods.  Do acids taste sour, soapy, salty, or sweet? ', ' Sour', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Morning dew is an example of which portion of the water cycle?', ' Condensation', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' The preserved remains of once living organisms is called what?', ' Fossils', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the probability of producing a tall plant from two hybrid tall plants?', ' 75%', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' `For every action, there is an equal and opposite reaction` is Newtons ___ Law', ' 3rd', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the negatively charged particle in an atom called?', ' Electron', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What are the three states that matter can exist in?', ' Solids, Liquids, and Gasses', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the most likely cause of wind blowing?', ' Differences in temperatures across the Earth', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What type of cooling produces an igneous rock that contains large crystals?', ' slow cooling', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What instrument is used to check temperatures?', ' thermometer', 2);

-- 8th Grade Science
INSERT INTO cards(front, back, card_creator_id) VALUES (' A very large redwood tree is measured to be about 100 units tall.  What is the most scientifically appropriate unit to use?', ' meters', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Which part of the electromagnetic spectrum has the highest frequency, and highest energy level?', ' Gamma Rays', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the speed of a car that travelled 100 miles in .6 hours?', '60 ', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' How do you find the number of neutrons in an atom?', ' You subtrct the atomic number from the mass number', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What do you call a mixture that appears to contain only one substance?', ' A homogenous mixture', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' A piece of wood is floating on top of a pond of water.  Water has a density of 1 g/mL.  Is the woods density greater, less than, or equal to the water?', ' Less than', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Matter that has a definite volume but no definite shape is a ___', ' liquid', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' How many total number of atoms are in the compound NaOH?', ' 3', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' Acceleration can be both positive and negative.  True or false?', ' True', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES (' What is the symbol for aluminum', ' Al', 2);





INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('6th Grade Math', 2, 'Generic study questions for 6th grade math', true);
INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('7th Grade Math', 2, 'Generic study questions for 7th grade math', true);
INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('8th Grade Math', 2, 'Generic study questions for 8th grade math', true);
INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('6th Grade History', 2, 'Generic study questions for 6th grade history', true);
INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('7th Grade History', 2, 'Generic study questions for 7th grade history', true);
INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('8th Grade History', 2,'Generic study questions for 8th grade history', true);
INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('6th Grade Science', 2,'Generic study questions for 6th grade science', true);
INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('7th Grade Science', 2,'Generic study questions for 7th grade science', true);
INSERT INTO decks (deck_name, deck_user_id, deck_description, deck_is_trial) VALUES ('8th Grade Science', 2,'Generic study questions for 8th grade science', true);



-- 6th Grade math
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

-- 7Th Grade Math
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


-- 8Th Grade Math
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


-- 7Th Grade History
INSERT INTO card_deck(card_id, deck_id) VALUES (41, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (42, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (43, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (44, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (45, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (46, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (47, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (48, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (49, 5);
INSERT INTO card_deck(card_id, deck_id) VALUES (50, 5);

-- 8th Grade History
INSERT INTO card_deck(card_id, deck_id) VALUES (51, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (52, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (53, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (54, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (55, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (56, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (57, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (58, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (59, 6);
INSERT INTO card_deck(card_id, deck_id) VALUES (60, 6);

-- 6th Grade Science
INSERT INTO card_deck(card_id, deck_id) VALUES (61, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (62, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (63, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (64, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (65, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (66, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (67, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (68, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (69, 7);
INSERT INTO card_deck(card_id, deck_id) VALUES (70, 7);


-- 7th Grade Science
INSERT INTO card_deck(card_id, deck_id) VALUES (71, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (72, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (73, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (74, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (75, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (76, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (77, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (78, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (79, 8);
INSERT INTO card_deck(card_id, deck_id) VALUES (80, 8);

-- 8th Grade Science
INSERT INTO card_deck(card_id, deck_id) VALUES (81, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (82, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (83, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (84, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (85, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (86, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (87, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (88, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (89, 9);
INSERT INTO card_deck(card_id, deck_id) VALUES (90, 9);

COMMIT TRANSACTION; 
