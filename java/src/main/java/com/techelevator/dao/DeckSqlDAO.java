package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.techelevator.model.Card;
import com.techelevator.model.Deck;

@Service
public class DeckSqlDAO implements DeckDAO {
	
	
	private JdbcTemplate jdbcTemplate;
	
	
	public DeckSqlDAO(JdbcTemplate jdbcTemplate) {
	    this.jdbcTemplate = jdbcTemplate; 
	}

	@Override
	public List<Deck> getDecks() {
		List<Deck> decks = new ArrayList<>();
		String sqlGetAllDecks = "SELECT * From decks";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllDecks);
		
		while (results.next()) {
			Deck deck = mapRowToDecks(results);
			decks.add(deck);
		}
		return decks;
	}
	
	@Override
	public Deck getDeck(Long id) {
		Deck deck = null;
		String sqlGetSpecificDeck = "SELECT * FROM decks WHERE deck_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetSpecificDeck, id);
		while (results.next())
		{
			deck = mapRowToDecks(results);			
		}
		return deck;
		
	}

	private Deck mapRowToDecks(SqlRowSet results) {
	Deck deck = new Deck();
	List<Card> cards = new ArrayList<>();
	deck.setDeckName(results.getString("deck_name"));
	deck.setUserId(results.getLong("deck_user_id"));
	deck.setId(results.getLong("deck_id"));
	
	String sqlGetAllCards = "Select * From cards join card_deck on card_deck.card_id = cards.card_id Where card_deck.deck_id = ?";
	SqlRowSet cardResults = jdbcTemplate.queryForRowSet(sqlGetAllCards, deck.getId());
	
	while (cardResults.next()) {
		Card card = mapRowToCards(cardResults);
		cards.add(card);
	} deck.setListOfCards(cards);
		return deck;
	}

	private Card mapRowToCards(SqlRowSet results) {
		Card card = new Card();
		//card.setCategories(null);
		card.setId(results.getLong("card_id"));
		card.setUserId(results.getLong("card_creator_id"));
		card.setFront(results.getString("front"));
		card.setBack(results.getString("back"));
		
		return card;
	}
}


