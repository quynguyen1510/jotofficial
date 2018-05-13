package edu.vinaenter.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Items;

@Repository
public class ItemsDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public ArrayList<Items> getItems(){
		String sql = "SELECT * FROM items";
		return (ArrayList<Items>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Items>(Items.class));
	}
	
	public int addItem(Items objItems) {
		String sql = "INSERT INTO items(name_items) VALUES(?)";
		return jdbcTemplate.update(sql, new Object[] {objItems.getName_items()});
	}
	
	public Items getItem(int id_items) {
		String sql = "SELECT * FROM items WHERE id_items=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_items}, new BeanPropertyRowMapper<Items>(Items.class));
	}

	public int editItem(Items objItems) {
		String sql = "UPDATE items SET name_items = ? WHERE id_items=?";
		return jdbcTemplate.update(sql, new Object[] {objItems.getName_items(),objItems.getId_items()});
	}

	public int deleteItem(int id_items) {
		String sql = "DELETE FROM items WHERE id_items = ?";
		return jdbcTemplate.update(sql,new Object[] {id_items});
	}
	public int countItems() {
		String sql = "SELECT COUNT(*) FROM items";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
