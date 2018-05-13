package edu.vinaenter.model;

import javax.validation.constraints.NotBlank;

public class Items {
	private int id_items;
	@NotBlank
	private String name_items;
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
	public Items() {
		super();
	}
	public Items(int id_items, String name_items) {
		super();
		this.id_items = id_items;
		this.name_items = name_items;
	}
	

}
