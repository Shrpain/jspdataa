package modal;

import bo.giohangbo;

public class Admin {
	private String username,password;
	private int role;
	private giohangbo gioHang;
	
	
	public Admin() {
		
	}

	public Admin(String username, String password, int role) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.gioHang = new giohangbo(); // Khởi tạo giỏ hàng cho mỗi tài khoản
    }
	public giohangbo getGioHang() {
        return gioHang;
    }

    public void setGioHang(giohangbo gioHang) {
        this.gioHang = gioHang;
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
	

}
