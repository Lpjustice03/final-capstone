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

INSERT INTO cards(front, back, card_creator_id) VALUES ('dog', 'woof', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('cat', 'meow', 2);
INSERT INTO cards(front, back, card_creator_id) VALUES ('fox', 'https://www.youtube.com/watch?v=jofNR_WkoCE', 2);

INSERT INTO decks (deck_name, deck_user_id) VALUES ('Animal Sounds', 2);

INSERT INTO card_deck(card_id, deck_id) VALUES (1, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (2, 1);
INSERT INTO card_deck(card_id, deck_id) VALUES (3, 1);


COMMIT TRANSACTION;
