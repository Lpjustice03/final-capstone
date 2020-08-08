package com.techelevator.model;
import com.techelevator.model.Card;
import java.util.List;

public class Deck {
	
	private Long id;
	private Long userId;
	private String deckName;
	private List<Card> listOfCards;
	private String description;
	private boolean isTrial;
	private int deckType;
	
	
	
	public int getDeckType() {
		return deckType;
	}
	public void setDeckType(int deckType) {
		this.deckType = deckType;
	}
	public boolean isTrial() {
		return isTrial;
	}
	public void setTrial(boolean isTrial) {
		this.isTrial = isTrial;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public void setId(Long id) {
		this.id = id;
	}
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
	public Long getId() {
		return id;
	}
	public Long getUserId() {
		return userId;
	}

}
