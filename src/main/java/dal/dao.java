package dal;

import modal.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dao extends DBContext {
	public Admin Check(String username, String password) {
		String sql = "SELECT [Username], [Password], [role] FROM [dbo].[Admin] WHERE username=? AND password=?";
		try {
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, username);
			pt.setString(2, password);
			ResultSet rs=pt.executeQuery();
			if(rs.next()) {
				Admin a = new Admin(rs.getString("Username"),
									rs.getString("Password"),
									rs.getInt("role"));
				return a;
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		

		return null; // Trả về null nếu không tìm thấy thông tin Admin
	}
}
