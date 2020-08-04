package com.techelevator.model;

import java.util.List;

public class Card {
	
	
	private Long id;
	private Long userId;
	private String front;
	private String back;
	private List<String> Categories;
	private Boolean flipped;
	private long deckId;
	
	
	
	public long getDeckId() {
		return deckId;
	}
	public void setDeckId(long deckId) {
		this.deckId = deckId;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Boolean getFlipped() {
		return flipped;
	}
	public void setFlipped(Boolean flipped) {
		this.flipped = flipped;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public Long getId() {
		return id;
	}
	public Long getUserId() {
		return userId;
	}
	public String getFront() {
		return front;
	}
	public void setFront(String front) {
		this.front = front;
	}
	public String getBack() {
		return back;
	}
	public void setBack(String back) {
		this.back = back;
	}
	public List<String> getCategories() {
		return Categories;
	}
	public void setCategories(List<String> categories) {
		Categories = categories;
	}
	
	

}
