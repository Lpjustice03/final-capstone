package com.techelevator.dao;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;


import com.techelevator.model.Card;



public class CardSqlDaoIntegrationTest extends DAOIntegrationTest{
	private CardSqlDAO cardSqlDAO;

    @Before
    public void setup() {
        DataSource dataSource = this.getDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        cardSqlDAO = new CardSqlDAO(jdbcTemplate);
    }
    
    @Test
    public void getCardTest() {
    	List<Card> cards = new ArrayList<>();
    	
    	boolean isEquals = false;
    	
    	cards = cardSqlDAO.getCards();
    	if (cards.get(0).getId() == 1) {
    		isEquals = true;
    	}
    	assertEquals(true, isEquals);
    }

}
