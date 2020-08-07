package com.techelevator.controller;

import java.security.Principal;
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
import com.techelevator.dao.UserDAO;
import com.techelevator.model.Card;
import com.techelevator.model.Deck;
@PreAuthorize("isAuthenticated()")
@CrossOrigin
@RestController

public class FlashCardController {
	private CardDAO cardDao;
	private DeckDAO deckDao;
	private UserDAO	userDao;
	
	public FlashCardController(CardDAO cardDao, DeckDAO deckDao, UserDAO userDao ) {
		this.cardDao = cardDao;
		this.deckDao = deckDao;
		this.userDao = userDao;
	}
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(path = "/cards", method = RequestMethod.GET)
	public List<Card>  getCards(){
		
		return cardDao.getCards();
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(path = "/decks", method = RequestMethod.GET)
	public List<Deck> getDecks(){
		return deckDao.getDecks();
	}
	@PreAuthorize("permitAll")
	@RequestMapping(path = "/decks/trial", method = RequestMethod.GET)
	public List<Deck> getTrialDecks(){
		return deckDao.getTrialDeck();
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(path = "/decks/{id}", method = RequestMethod.GET)
	public Deck getDeck(@PathVariable Long id){
		return deckDao.getDeck(id);
	}
	
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(path = "cards/{id}", method = RequestMethod.PUT)
	public void updateCard(@RequestBody Card card, @PathVariable Long id) {
		cardDao.updateCard(card, id);
	}
	@PreAuthorize("hasRole('ROLE_USER')")
	@RequestMapping(path = "cards/{id}", method = RequestMethod.DELETE)
	public void cardDelete(@PathVariable Long id) {
		cardDao.deleteCard(id);
	}
	@PreAuthorize("hasRole('ROLE_USER')")
	@ResponseStatus(HttpStatus.CREATED)
	@RequestMapping(path = "/cards/create", method = RequestMethod.POST)
	public void createCard(@RequestBody Card card, Principal principal ) {
		String userName = principal.getName();
		Long userId = (long)userDao.findIdByUsername(userName);
		card.setUserId(userId);
		cardDao.createCard(card);
	}
	@PreAuthorize("hasRole('ROLE_USER')")
	@ResponseStatus(HttpStatus.CREATED)
	@RequestMapping(path = "/decks/create", method = RequestMethod.POST)
	public void createDeck(@RequestBody Deck deck, Principal principal) {
		String userName = principal.getName();
		Long userId = (long)userDao.findIdByUsername(userName);
		deck.setUserId(userId);
		deckDao.createDeck(deck);
	}
	
	
	

}
