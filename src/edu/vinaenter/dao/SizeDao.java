package edu.vinaenter.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Size;

@Repository
public class SizeDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ArrayList<Size> getItems(){
		String sql = "SELECT * FROM size";
		return (ArrayList<Size>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Size>(Size.class));
	}
}
