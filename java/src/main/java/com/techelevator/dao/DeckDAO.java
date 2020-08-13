package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Deck;

public interface DeckDAO {
	
	List <Deck> getDecks(Long userId);

	Deck getDeck(Long id);
	
	void updateDeck(Deck deck, Long id);
	
	List <Deck> getTrialDeck(); 
	
    void createDeck(Deck deck);
    
    void deleteDeck(Long id, Long userId);
}
