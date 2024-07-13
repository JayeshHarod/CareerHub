package com.dao;

import java.sql.Connection;

import com.entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addUser(User u)
	{
		boolean f = false;
		try {
			String sql = "insert into user(name,email,password,qualification,role) values(?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQualification());
			//ps.setString(5, u.getRole());
			ps.setString(5, "user");
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User login(String em,String ps)
	{
		User u = null;
		
		try {
			String sql = "select *from user where email=? and password=?";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, em);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setQualification(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setRole(rs.getString(6));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return u;
	}
	
	public boolean updateUser(User u)
	{
		boolean f = false;
		
		try {
			String sql = "update user set name=?,qualification=?,email=?,password=? where id=?";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			
			pst.setString(1, u.getName());
			pst.setString(2, u.getQualification());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getPassword());
			pst.setInt(5, u.getId());
			
			int i = pst.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
}
