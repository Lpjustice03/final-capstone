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
		card.setId(results.getLong("card_id"));
		card.setUserId(results.getLong("card_creator_id"));
		card.setFront(results.getString("front"));
		card.setBack(results.getString("back"));
		card.setFlipped(results.getBoolean("flipped"));
		String sqlGetCardDeckId = "Select * from card_deck join cards on cards.card_id = card_deck.card_id where cards.card_id = ?";
		SqlRowSet deckIdResults = jdbcTemplate.queryForRowSet(sqlGetCardDeckId, card.getId());
		
		while(deckIdResults.next())
		{
			card.setDeckId(deckIdResults.getLong("deck_id"));
		}

		return card;
	}


	@Override
	public void updateCard( Card card) {
		String sqlUpdateCard = "UPDATE cards set front = ? and back = ?";
		jdbcTemplate.update(sqlUpdateCard, card.getFront(), card.getBack() );
		
	}


	@Override
	public void createCard( Long id, Card card) {
		String sqlCard = "INSERT into cards(front, back, card_creator_id, flipped) VALUES (?,?,?,?)";
		jdbcTemplate.update(sqlCard, card.getFront(), card.getBack(), card.getUserId(), card.getFlipped());
		
	}


	@Override
	public void deleteCard(Card card) {
		String sqlDelete = "DELETE from card_deck where card_id = ?";
		jdbcTemplate.update(sqlDelete, card.getId());
		sqlDelete = "DELETE from cards where card_id = ?";
		jdbcTemplate.update(sqlDelete, card.getId());
	}
	

}
