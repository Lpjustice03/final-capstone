package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Deck;

public interface DeckDAO {
	
	List <Deck> getDecks();

	Deck getDeck(Long id);
}
