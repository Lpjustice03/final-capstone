package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.techelevator.model.Card;


@Service
public class CardSqlDAO implements CardDAO {
	private JdbcTemplate jdbcTemplate;
	
	
	public CardSqlDAO(JdbcTemplate jdbcTemplate) {
	    this.jdbcTemplate = jdbcTemplate; 
	}
	

	@Override
	public List<Card> getCards() {
		List<Card> cards = new ArrayList<>();
		String sqlGetAllCards = "SELECT * From cards";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCards);
		
		while (results.next()) {
			Card card = mapRowToCard(results);			
			cards.add(card);
		}
		return cards;
	}
	
	private Card mapRowToCard(SqlRowSet results) {
		Card card = new Card();
		//card.setCategories(null);
		card.setId(results.getInt("card_id"));
		card.setUserId(results.getLong("card_creator_id"));
		card.setFront(results.getString("front"));
		card.setBack(results.getString("back"));
		card.setFlipped(false);
		String sqlGetCardDeckId = "Select * from card_deck join cards on cards.card_id = card_deck.card_id where cards.card_id = ?";
		SqlRowSet deckIdResults = jdbcTemplate.queryForRowSet(sqlGetCardDeckId, card.getId());
		
		while(deckIdResults.next())
		{
			card.setDeckId(deckIdResults.getLong("deck_id"));
		}

		return card;
	}


	@Override
	public void updateCard( Card card, int id) {
		String sqlUpdateCard = "UPDATE cards set front = ?, back = ? WHERE card_id = ?";
		jdbcTemplate.update(sqlUpdateCard, card.getFront(), card.getBack(), id);
		
	}


	@Override
	public void createCard(Card card) {
		String sqlCard = "INSERT into cards(front, back, card_creator_id) VALUES (?,?,?)";
		jdbcTemplate.update(sqlCard, card.getFront(), card.getBack(), card.getUserId());
		
		sqlCard = "SELECT card_id from cards WHERE front = ? And back = ? And card_creator_id = ?";
		SqlRowSet cardResults = jdbcTemplate.queryForRowSet(sqlCard, card.getFront(), card.getBack(), card.getUserId());
		
		while(cardResults.next()) {
			card.setId(cardResults.getInt("card_id"));
		}
		sqlCard = "INSERT into card_deck(card_id, deck_id) VALUES (?, ?)";
		jdbcTemplate.update(sqlCard, card.getId(), card.getDeckId());
		
	}


	@Override
	public void deleteCard(Long id, Long userId) {
		String sqlSelect = "SELECT card_creator_id FROM cards WHERE card_id = ?";
		SqlRowSet theUser = jdbcTemplate.queryForRowSet(sqlSelect, id);
		Long theUserId = (long) 0;
		while (theUser.next())
		{
			theUserId = theUser.getLong("card_creator_id");
		}
		if (theUserId.equals(userId))
		{
			String sqlDelete = "DELETE from card_deck where card_id = ?";
			jdbcTemplate.update(sqlDelete, id);
			sqlDelete = "DELETE from cards where card_id = ?";
			jdbcTemplate.update(sqlDelete, id);
		}

	}
	

}
