
package dal;//package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//
public class DBContext {
	protected Connection con;
//	
//	
//	public Connection getConnection()throws Exception{
//		String url = "jdbc:sqlservlet://" + serverName + ":" +portNumber+"\\"+instance+";databaseName="+dbName;
//		if(instance ==null||instance.trim().isEmpty()) {
//			url = "jdbc:sqlserver://"+serverName+":"+portNumber+";databaseName="+dbName;
//		}
//		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		return DriverManager.getConnection(url,userID,password);
//		
//		
//	}
//	private final String serverName = "DESKTOP-7DB1SJ8";
//	private final String dbName = "test";
//	private final String portNumber = "1433";
//	private final String instance="";
//	private final String userID = "sa";
//	private final String password = "123";
//	
	public DBContext() {
        try {
            String url = "jdbc:sqlserver://DESKTOP-7DB1SJ8:1433;databaseName=Trading2023;user=sa;password=123";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, username, password);
            if (con != null) {
                System.out.println("Kết nối thành công!");
            } else {
                System.out.println("Kết nối thất bại!");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
	public Connection getConnection() {
        return con;
    }
//	
}



