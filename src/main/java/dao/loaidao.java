package dao;

import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() throws Exception{
		ArrayList<loaibean> ds= new ArrayList<loaibean>();
		ds.add(new loaibean("Công nghệ thông tin", "tin"));
		ds.add(new loaibean("Toán ứng dụng", "toan"));
		ds.add(new loaibean("Vật lý hữu cơ", "ly"));
		ds.add(new loaibean("Hóa hữu cơ", "Hoa"));
		return ds;
	}
}
