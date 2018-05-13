package edu.vinaenter.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.model.Detail_Order;

@Repository
public class Detail_OrderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int addDetailOrder(Detail_Order objDetailOrder) {
		String sql = "INSERT INTO detail_order(name_product,id_order,quantity,price,unit_price) VALUES(?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[] {objDetailOrder.getName_product(),objDetailOrder.getId_order(),objDetailOrder.getQuantity(),objDetailOrder.getPrice(),objDetailOrder.getUnit_price()});
	}
	
	public ArrayList<Detail_Order> getItem(int id_order){
		String sql ="SELECT * FROM detail_order WHERE id_order=?";
		return (ArrayList<Detail_Order>) jdbcTemplate.query(sql, new Object[] {id_order}, new BeanPropertyRowMapper(Detail_Order.class));
	}
	
	public int deleteDetailByOrder(int id_order) {
		String sql = "DELETE FROM detail_order WHERE id_order = ?";
		return jdbcTemplate.update(sql,new Object[] {id_order});
	}
}
