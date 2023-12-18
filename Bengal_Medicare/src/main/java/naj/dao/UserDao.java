package naj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import naj.entity.*;

import naj.entity.*;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean register(User u) {
		boolean f = false;

		try {
			String sql = "insert into user_dtls(full_name,email,password) values(?,?,?) ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User login(String em, String psw) {
		User u = null;

		try {
			String sql = "select * from user_dtls where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}
	
	
	
	public List<User> getAllUser() //here Student is class of entity
	{
		List<User> list=new ArrayList<User>();
		User s=null;
		
		try 
		{
			String sql="select * from user_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				s=new User();
				//called to setter
				s.setId(rs.getInt(1));
				s.setFullName(rs.getString(2));
				s.setEmail(rs.getString(3));
				s.setPassword(rs.getString(4));
				//adding in list
				list.add(s);
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return list;
		
	}
	
	
	public User getUserById(int id) {
	    User s = null;

	    try {
	        String sql = "select * from user_dtls where id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            s = new User();
	            // Perform null checks before calling setters
	            s.setId(rs.getInt(1));
	            s.setFullName(rs.getString(2));
	            s.setEmail(rs.getString(3));
	            s.setPassword(rs.getString(4));
	        }

	    } catch (Exception e) {
	        System.out.println(e);
	    }

	    return s;
	}

	
	
	
	
	
	
	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from user_dtls where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	
	public boolean updateUser(User u) {
	    boolean f = false;

	    try {
	        String sql = "update user_dtls set full_name=?, email=?, password=? where id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, u.getFullName());
	        ps.setString(2, u.getEmail());
	        ps.setString(3, u.getPassword());
	        ps.setInt(4, u.getId());
	        int i = ps.executeUpdate();

	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	}

	public boolean deleteUser(int id) {
	    boolean f = false;
	    try {
	        String sql = "delete from user_dtls where id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	}


	
	
	
	
	
	
	
	
	

	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update user_dtls set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}






