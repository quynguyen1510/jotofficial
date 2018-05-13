package edu.vinaenter.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Roles;

@Repository
public class RolesDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ArrayList<Roles> getItems(){
		String sql = "SELECT * FROM roles";
		return (ArrayList<Roles>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Roles>(Roles.class));
	}
}
