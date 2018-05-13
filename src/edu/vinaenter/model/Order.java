package edu.vinaenter.model;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;

public class Order {
	private int id_order;
	@NotBlank
	private String phone;
	private double total_price;
	@NotBlank
	private String fullname;
	@NotBlank
	private String address;
	private Timestamp date_create;
	
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public int getId_order() {
		return id_order;
	}
	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Order() {
		super();
	}
	public Order(int id_order, String phone, double total_price, String fullname, String address) {
		super();
		this.id_order = id_order;
		this.phone = phone;
		this.total_price = total_price;
		this.fullname = fullname;
		this.address = address;
	}
	public Order(int id_order,String phone, double total_price,String fullname,String address, Timestamp date_create) {
		super();
		this.id_order = id_order;
		this.phone = phone;
		this.total_price = total_price;
		this.fullname = fullname;
		this.address = address;
		this.date_create = date_create;
	}
	
	

}
