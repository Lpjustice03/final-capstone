package com.techelevator.dao;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.Card;
import com.techelevator.model.Deck;

public class DeckSqlDaoIntegrationTest extends DAOIntegrationTest{
	private DeckSqlDAO deckSqlDAO;

    @Before
    public void setup() {
        DataSource dataSource = this.getDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        deckSqlDAO = new DeckSqlDAO(jdbcTemplate);
    }
    
    @Test
    public void getCardTest() {
    	List<Deck> decks = new ArrayList<>();
    	
    	boolean isEquals = false;
    	
    	decks = deckSqlDAO.getDecks();
    	if (decks.get(0).getId() == 1) {
    		isEquals = true;
    	}
    	assertEquals(true, isEquals);
    }

}
