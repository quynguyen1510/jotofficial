package edu.vinaenter.model;

public class Size {
	private int id_size;
	private String name_size;
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
	public Size() {
		super();
	}
	public Size(int id_size, String name_size) {
		super();
		this.id_size = id_size;
		this.name_size = name_size;
	}
	
}
