package com.techelevator.model;
import com.techelevator.model.Card;
import java.util.List;

public class Deck {
	
	private int id;
	private int userId;
	private String deckName;
	private List<Card> listOfCards;
	
	
	public String getDeckName() {
		return deckName;
	}
	public void setDeckName(String deckName) {
		this.deckName = deckName;
	}
	public List<Card> getListOfCards() {
		return listOfCards;
	}
	public void setListOfCards(List<Card> listOfCards) {
		this.listOfCards = listOfCards;
	}
	public int getId() {
		return id;
	}
	public int getUserId() {
		return userId;
	}

}
