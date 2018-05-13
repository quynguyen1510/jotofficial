package edu.vinaenter.constant;

public class Defines {
	// định nghĩa các thông số cho ứng dụng web
	public String urlAdmin;
	public String urlPublic;
	public String superAdmin;
	
	public String getSuperAdmin() {
		return superAdmin;
	}
	public void setSuperAdmin(String superAdmin) {
		this.superAdmin = superAdmin;
	}
	public static final String SUCCESS="THÀNH CÔNG";
	public static final String ERROR="CÓ LỖI TRONG XỬ LÝ";
	public static final int ROW_COUNT = 6;
	
	public String getUrlAdmin() {
		return urlAdmin;
	}
	public void setUrlAdmin(String urlAdmin) {
		this.urlAdmin = urlAdmin;
	}
	public String getUrlPublic() {
		return urlPublic;
	}
	public void setUrlPublic(String urlPublic) {
		this.urlPublic = urlPublic;
	}
}
