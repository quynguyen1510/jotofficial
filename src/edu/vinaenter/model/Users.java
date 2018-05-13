package edu.vinaenter.model;

import javax.validation.constraints.NotBlank;

public class Users {
	private int id;
	@NotBlank
	private String username;
	@NotBlank
	private String fullname;
	@NotBlank
	private String password;
	private int enable;
	private int role_id;
	private String avatar;
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public Users() {
		super();
	}
	public Users(int id, String username, String fullname, String password, int enable, int role_id) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.password = password;
		this.enable = enable;
		this.role_id = role_id;
	}
	public Users(int id,String username,String fullname,String password, int enable,int role_id, String avatar) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.password = password;
		this.enable = enable;
		this.role_id = role_id;
		this.avatar = avatar;
	}
	
}
