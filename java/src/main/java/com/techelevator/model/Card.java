package com.techelevator.model;

import java.util.List;

public class Card {
	
	public void setId(int id) {
		this.id = id;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	private int id;
	private int userId;
	private String front;
	private String back;
	private List<String> Categories;
	
	
	
	public int getId() {
		return id;
	}
	public int getUserId() {
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
