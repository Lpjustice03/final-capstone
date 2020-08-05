package com.techelevator.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import com.techelevator.dao.CardDAO;
import com.techelevator.dao.DeckDAO;
import com.techelevator.model.Card;
import com.techelevator.model.Deck;

@CrossOrigin
@RestController

public class FlashCardController {
	private CardDAO cardDao;
	private DeckDAO deckDao;
	
	public FlashCardController(CardDAO cardDao, DeckDAO deckDao) {
		this.cardDao = cardDao;
		this.deckDao = deckDao;
		
	}
	
	@RequestMapping(path = "/cards", method = RequestMethod.GET)
	public List<Card>  getCards(){
		
		return cardDao.getCards();
	}
	
	@RequestMapping(path = "/decks", method = RequestMethod.GET)
	public List<Deck> getDecks(){
		return deckDao.getDecks();
	}
	
	@RequestMapping(path = "/decks/{id}", method = RequestMethod.GET)
	public Deck getDeck(@PathVariable Long id){
		return deckDao.getDeck(id);
	}
	
	@RequestMapping(path = "/cards/create", method = RequestMethod.POST)
	public void createCard(@RequestBody Card card ) {
		cardDao.createCard(card.getUserId(), card);
	}
	

}
