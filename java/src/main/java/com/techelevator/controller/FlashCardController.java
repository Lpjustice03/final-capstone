package com.techelevator.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import com.techelevator.dao.CardDAO;
import com.techelevator.model.Card;

@CrossOrigin
@RestController

public class FlashCardController {
	private CardDAO cardDao;
	
	public FlashCardController(CardDAO cardDao) {
		this.cardDao = cardDao;
		
	}
	
	@RequestMapping(path = "/cards", method = RequestMethod.GET)
	public List<Card>  getCards(){
		
		return cardDao.getCards();
	}
	
	
	

}
