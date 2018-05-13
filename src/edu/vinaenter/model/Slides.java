package edu.vinaenter.model;

public class Slides {
	private int id_slide;
	private String hinhanh;
	public int getId_slide() {
		return id_slide;
	}
	public void setId_slide(int id_slide) {
		this.id_slide = id_slide;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	public Slides() {
		super();
	}
	public Slides(int id_slide, String hinhanh) {
		super();
		this.id_slide = id_slide;
		this.hinhanh = hinhanh;
	}
	

}
