package edu.vinaenter.model;

public class Detail_Order {
	private int id_order;
	private int id_product;
	private String name_product;
	private String size;
	private String picture;
	private int quantity;
	private int price;
	private double unit_price;
	
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getId_order() {
		return id_order;
	}
	
	public String getPicture() {
		return picture;
	}
	

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public String getName_product() {
		return name_product;
	}
	public void setName_product(String name_product) {
		this.name_product = name_product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public double getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}

	public Detail_Order() {
		super();
	}

	public Detail_Order(int id_order, int id_product, String name_product, String picture, int quantity, int price,
			double unit_price) {
		super();
		this.id_order = id_order;
		this.id_product = id_product;
		this.name_product = name_product;
		this.picture = picture;
		this.quantity = quantity;
		this.price = price;
		this.unit_price = unit_price;
	}

	public Detail_Order(int id_order, int id_product, String name_product, String size, String picture, int quantity,
			int price, double unit_price) {
		super();
		this.id_order = id_order;
		this.id_product = id_product;
		this.name_product = name_product;
		this.size = size;
		this.picture = picture;
		this.quantity = quantity;
		this.price = price;
		this.unit_price = unit_price;
	}
	

	

}
