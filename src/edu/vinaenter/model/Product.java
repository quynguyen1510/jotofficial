package edu.vinaenter.model;


public class Product {
	private int id_product;
	private String name_product;
	private String description;
	private String picture_description;
	private String hinhanh;
	private int id_size;
	private String name_size;
	private int price;
	private int in_stock;
	private int id_items;
	private String name_items;
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public String getName_product() {
		return name_product;
	}
	public void setName_product(String name_product) {
		this.name_product = name_product;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture_description() {
		return picture_description;
	}
	public void setPicture_description(String picture_description) {
		this.picture_description = picture_description;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public int getId_size() {
		return id_size;
	}
	public void setId_size(int id_size) {
		this.id_size = id_size;
	}
	public String getName_size() {
		return name_size;
	}
	public void setName_size(String name_size) {
		this.name_size = name_size;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getIn_stock() {
		return in_stock;
	}
	public void setIn_stock(int in_stock) {
		this.in_stock = in_stock;
	}
	public int getId_items() {
		return id_items;
	}
	public void setId_items(int id_items) {
		this.id_items = id_items;
	}
	public String getName_items() {
		return name_items;
	}
	public void setName_items(String name_items) {
		this.name_items = name_items;
	}
	public Product() {
		super();
	}
	public Product(int id_product, String name_product, String description, String picture_description, String hinhanh,
			int id_size, int price, int in_stock, int id_items) {
		super();
		this.id_product = id_product;
		this.name_product = name_product;
		this.description = description;
		this.picture_description = picture_description;
		this.hinhanh = hinhanh;
		this.id_size = id_size;
		this.price = price;
		this.in_stock = in_stock;
		this.id_items = id_items;
	}
	
	

}
