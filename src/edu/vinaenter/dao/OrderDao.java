package edu.vinaenter.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.constant.Defines;
import edu.vinaenter.model.Order;

@Repository
public class OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int addOrder(Order objOrder) {
		String sql = "INSERT INTO hoadon(phone,total_price,fullname,address) VALUES(?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {objOrder.getPhone(),objOrder.getTotal_price(),objOrder.getFullname(),objOrder.getAddress()});
	}
	public int getID_Order() {
		String sql = "SELECT id_order FROM hoadon ORDER BY id_order DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public ArrayList<Order> getItems(int offset){
		String sql = "SELECT * FROM hoadon LIMIT ?,?";
		return (ArrayList<Order>) jdbcTemplate.query(sql,new Object[] {offset,Defines.ROW_COUNT},new BeanPropertyRowMapper<Order>(Order.class));
	}
	public int countOrder() {
		String sql = "SELECT COUNT(*) FROM hoadon";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public int deleteOrder(int id_order) {
		String sql = "DELETE FROM hoadon WHERE id_order = ?";
		return jdbcTemplate.update(sql,new Object[] {id_order});
	}
	public ArrayList<Order> getOrderByUsername(String fullname,int offset) {
		String sql = "SELECT * FROM hoadon WHERE fullname =? LIMIT ?,?";
		return (ArrayList<Order>) jdbcTemplate.query(sql, new Object[] {fullname,offset,Defines.ROW_COUNT}, new BeanPropertyRowMapper<Order>(Order.class));
	}
}
