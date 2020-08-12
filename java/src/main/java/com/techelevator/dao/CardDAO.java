package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Card;

public interface CardDAO {
	
	List<Card> getCards();
	
	void updateCard(Card card, int id);
	
	void createCard(Card card);
	
	void deleteCard(Long id, Long userId);
	

}
