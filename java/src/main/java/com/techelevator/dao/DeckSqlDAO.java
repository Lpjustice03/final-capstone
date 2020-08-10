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
	public List<Deck> getDecks(Long userId) {
		List<Deck> decks = new ArrayList<>();
		String sqlGetAllDecks = "SELECT * From decks WHERE deck_is_trial = true OR deck_user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllDecks, userId);
		
		while (results.next()) {
			Deck deck = mapRowToDecks(results);
			decks.add(deck);
		}
		return decks;
	}
	@Override
	public List<Deck> getTrialDeck() {
	List<Deck> decks = new ArrayList<>();
	String sqlGetAllDecks = "SELECT * From decks where deck_id = 1 or deck_id = 5 or deck_id = 9";
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
	
	@Override
	public void updateDeck(Deck deck, Long id) {
		String sqlUpdateDeck = "UPDATE decks set deck_name = ?, deck_description = ?, deck_is_trial = ? WHERE deck_id = ?";
		boolean deckType;
		if(deck.getDeckType() == 1) {
			deckType = true;
		}
		else {
			deckType = false;
		}
		jdbcTemplate.update(sqlUpdateDeck, deck.getDeckName(), deck.getDescription(),deckType, id);
		
	}
	
	@Override
	public void deleteDeck(Long id) {
		String sqlDelete = "SELECT * from card_deck where deck_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlDelete, id);
		sqlDelete = "DELETE from card_deck where deck_id = ?";
		jdbcTemplate.update(sqlDelete, id);
		while(results.next()) {
			Long cardId = results.getLong("card_id");
			sqlDelete = "DELETE from cards where card_id = ?";
			jdbcTemplate.update(sqlDelete, cardId);
		}
		sqlDelete = "DELETE from decks where deck_id = ?";
		jdbcTemplate.update(sqlDelete, id);
		
		
	}
	
    @Override
    	public void createDeck( Deck deck) {
    		String sqlDeck = "INSERT into decks(deck_name, deck_user_id, deck_description, deck_is_trial) VALUES (?,?,?, ?)";
    		boolean isPublic;
    		if (deck.getDeckType() == 1)
    		{
    			isPublic = true;
    		}
    		else
    		{
    			isPublic = false;
    		}
    		jdbcTemplate.update(sqlDeck, deck.getDeckName(), deck.getUserId(), deck.getDescription(), isPublic);
    		
    	//	jdbcTemplate.update(sqlDeck, );
    		
    	}
    
    
    
	
	private Deck mapRowToDecks(SqlRowSet results) {
	Deck deck = new Deck();
	List<Card> cards = new ArrayList<>();
	deck.setDeckName(results.getString("deck_name"));
	deck.setUserId(results.getLong("deck_user_id"));
	deck.setId(results.getLong("deck_id"));
	deck.setDescription(results.getString("deck_description"));
	
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
		card.setId(results.getInt("card_id"));
		card.setUserId(results.getLong("card_creator_id"));
		card.setFront(results.getString("front"));
		card.setBack(results.getString("back"));
		
		return card;
	}

	
}


