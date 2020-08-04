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
		return card;
	}
	

}
