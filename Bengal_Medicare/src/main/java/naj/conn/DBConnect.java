package naj.conn;

import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.http.HttpServlet;

public class DBConnect extends HttpServlet{
	private static Connection conn;
	public static Connection getConn() {
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db","root","Najmur@123");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}

}
