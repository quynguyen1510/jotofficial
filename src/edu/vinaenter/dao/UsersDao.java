package edu.vinaenter.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Users;

@Repository
public class UsersDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public Users getItems(String name) {
		String sql = "SELECT * FROM users WHERE username = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {name}, new BeanPropertyRowMapper<Users>(Users.class));
	}
	public ArrayList<Users> getItems(){
		String sql = "SELECT * FROM users ";
		return (ArrayList<Users>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Users>(Users.class));
	}
	public int addItem(Users user) {
		String sql = "INSERT INTO users(username,fullname,password,enable,role_id,avatar) VALUES(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {user.getUsername(),user.getFullname(),user.getPassword(),1,3,""});
	}
	public Users getItem(int id) {
		String sql = "SELECT * FROM users WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new BeanPropertyRowMapper<Users>(Users.class));
	}
	public int editItem(Users user) {
		String sql = "UPDATE users SET fullname = ? , password = ? , role_id = ? WHERE id = ?";
		return jdbcTemplate.update(sql,new Object[] {user.getFullname(),user.getPassword(),user.getRole_id(),user.getId()});
	}
	public int addProfile(Users user) {
		String sql = "INSERT INTO users(username,fullname,password,enable,role_id,avatar) VALUES(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {user.getUsername(),user.getFullname(),user.getPassword(),1,3,user.getAvatar()});
	}
	
	public int editProfile(Users user) {
		String sql = "UPDATE users SET fullname = ? , password = ? ,avatar=? , role_id = ? WHERE id = ?";
		return jdbcTemplate.update(sql,new Object[] {user.getFullname(),user.getPassword(),user.getAvatar(),user.getRole_id(),user.getId()});
	}
	public int deleteItem(int id) {
		String sql = "DELETE FROM users WHERE id=?";
		return jdbcTemplate.update(sql,new Object[] {id});
	}
	public int editActive(int userID, int enable) {
		String sql = "UPDATE users SET enable = ? WHERE id = ?";
		return jdbcTemplate.update(sql,new Object[] {enable,userID});		
	}
	public int countUser() {
		String sql ="SELECT COUNT(*) FROM users";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
