package edu.vinaenter.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Slides;

@Repository
public class Slides_Dao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int addItems(Slides objSlides) {
		String sql = "INSERT INTO slides(hinhanh) VALUES(?)";
		return jdbcTemplate.update(sql,new Object[] {objSlides.getHinhanh()});
	}
	
	public ArrayList<Slides> getItems(){
		String sql = "SELECT * FROM slides";
		return (ArrayList<Slides>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Slides>(Slides.class));
	}
	public Slides getItem(int id_slide) {
		String sql ="SELECT * FROM slides WHERE id_slide = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_slide},new BeanPropertyRowMapper<>(Slides.class));
	}
	public int deletItem(int id_slide) {
		String sql ="DELETE FROM slides WHERE id_slide = ?";
		return jdbcTemplate.update(sql,new Object[] {id_slide});
	}
}
