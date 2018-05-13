package edu.vinaenter.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import edu.vinaenter.constant.Defines;
import edu.vinaenter.model.Product;

@Repository
public class ProductDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ArrayList<Product> getItems(){
		String sql = "SELECT * FROM product INNER JOIN items ON product.id_items = items.id_items INNER JOIN size ON product.id_size = size.id_size ORDER BY product.id_product";
		return (ArrayList<Product>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}
	public ArrayList<Product> getItems(int offSet){
		String sql = "SELECT * FROM product INNER JOIN items ON product.id_items = items.id_items INNER JOIN size ON product.id_size = size.id_size ORDER BY product.id_product LIMIT ?,?";
		return (ArrayList<Product>) jdbcTemplate.query(sql,new Object[] {offSet,Defines.ROW_COUNT}, new BeanPropertyRowMapper<Product>(Product.class));
	}
	public ArrayList<Product> getHotItems(){
		String sql = "SELECT * FROM product INNER JOIN items ON product.id_items = items.id_items INNER JOIN size ON product.id_size = size.id_size ORDER BY product.id_product DESC LIMIT 3";
		return (ArrayList<Product>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}
	public ArrayList<Product> getAllItems(){
		String sql = "SELECT * FROM product INNER JOIN items ON product.id_items = items.id_items INNER JOIN size ON product.id_size = size.id_size ORDER BY product.id_product DESC";
		return (ArrayList<Product>) jdbcTemplate.query(sql, new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public ArrayList<Product> getSize(String name_product){
		String sql = "SELECT product.id_size, name_size, in_stock FROM product INNER JOIN size ON product.id_size = size.id_size WHERE name_product = ?";
		return (ArrayList<Product>) jdbcTemplate.query(sql,new Object[] {name_product} ,new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public ArrayList<Product> getItemsByCat(int id_items){
		String sql = "SELECT * FROM product INNER JOIN items ON product.id_items = items.id_items INNER JOIN size ON product.id_size = size.id_size WHERE product.id_items = ?";
		return (ArrayList<Product>) jdbcTemplate.query(sql, new Object[] {id_items} ,new BeanPropertyRowMapper<Product>(Product.class));
	}
	public ArrayList<Product> getItemsByCatLimit(int id_items,String name_product){
		String sql = "SELECT * FROM product INNER JOIN items ON product.id_items = items.id_items INNER JOIN size ON product.id_size = size.id_size WHERE product.id_items = ? AND product.name_product != ? LIMIT 3";
		return (ArrayList<Product>) jdbcTemplate.query(sql, new Object[] {id_items,name_product} ,new BeanPropertyRowMapper<Product>(Product.class));
	}

	public int addProduct(Product product) {
		String sql = "INSERT INTO product(name_product,description,picture_description,hinhanh,id_size,price,in_stock,id_items) VALUES(?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[] {product.getName_product(),product.getDescription(),product.getPicture_description(),product.getHinhanh(),product.getId_size(),product.getPrice(),product.getIn_stock(),product.getId_items()});
	}

	public Product getItemsByID(int id_product) {
		String sql = "SELECT * FROM product INNER JOIN items ON product.id_items = items.id_items INNER JOIN size ON product.id_size = size.id_size WHERE id_product = ?";
		return jdbcTemplate.queryForObject(sql,new Object[] {id_product}, new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public int editProduct(Product product) {
		String sql = "UPDATE product SET name_product=? , description=? , picture_description=? , hinhanh=? , id_size=?, price=?, in_stock=? ,id_items=? WHERE id_product = ?";
		return jdbcTemplate.update(sql,new Object[] {product.getName_product(),product.getDescription(),product.getPicture_description(),product.getHinhanh(),product.getId_size(),product.getPrice(),product.getIn_stock(),product.getId_items(),product.getId_product()});
	}
	
	public int editProductPicture(String hinhanh,String picture_description ,String name_product) {
		String sql = "UPDATE product SET hinhanh = ? , picture_description = ? WHERE name_product = ?";
		return jdbcTemplate.update(sql,new Object[] {hinhanh,picture_description,name_product});
	}
	
	public int deleteItem(int id_product) {
		String sql = "DELETE FROM product WHERE id_product = ?";
		return jdbcTemplate.update(sql,new Object[] {id_product});
	}
	public int deleteItemByCat(int id_items) {
		String sql = "DELETE FROM product WHERE id_items = ?";
		return jdbcTemplate.update(sql,new Object[] {id_items});
	}
	public int countProduct() {
		String sql = "SELECT COUNT(*) FROM product";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public ArrayList<Product> getSearch(String search){
		String sql = "SELECT * FROM product WHERE product.name_product LIKE '%"+search+"%'";
		return (ArrayList<Product>) jdbcTemplate.query(sql,new BeanPropertyRowMapper<Product>(Product.class));
	}
	public ArrayList<Product> sortPrizeLowToHight(){
		String sql ="SELECT * FROM product ORDER BY price ASC";
		return (ArrayList<Product>) jdbcTemplate.query(sql,new BeanPropertyRowMapper<Product>(Product.class));
	}
	public ArrayList<Product> sortPrizeHightToLow(){
		String sql ="SELECT * FROM product ORDER BY price DESC";
		return (ArrayList<Product>) jdbcTemplate.query(sql,new BeanPropertyRowMapper<Product>(Product.class));
	}
	public ArrayList<Product> sortAToZ(){
		String sql ="SELECT * FROM product ORDER BY name_product DESC";
		return (ArrayList<Product>) jdbcTemplate.query(sql,new BeanPropertyRowMapper<Product>(Product.class));
	}
	public ArrayList<Product> sortZToA(){
		String sql ="SELECT * FROM product ORDER BY name_product ASC";
		return (ArrayList<Product>) jdbcTemplate.query(sql,new BeanPropertyRowMapper<Product>(Product.class));
	}
	
}
