package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;

public class JobDao {

	private Connection conn;

	public JobDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addJobs(Jobs j)
	{
		boolean f = false;
		
		try
		{
			String sql = "insert into job(title,description,category,exp,status,location) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getExperience());
			ps.setString(5, j.getStatus());
			ps.setString(6, j.getLocation());
			
			int i =  ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Jobs> getAllJobs()
	{
		List<Jobs> lst = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sql = "select *from job order by id desc";
			PreparedStatement pst = conn.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				
				lst.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return lst;
	}
	
	public Jobs getJobsById(int id)
	{
		Jobs j = null;
	
		
		try {
			String sql = "select *from job where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return j;
}
	
	public boolean updateJob(Jobs j)
	{
		boolean f = false;
		
		try
		{
			String sql = "update job set title=?,description=?,category=?,exp=?,status=?,location=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getExperience());
			ps.setString(5, j.getStatus());
			ps.setString(6, j.getLocation());
			ps.setInt(7, j.getId());
			
			int i =  ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean deleteJob(int id)
	{
		boolean f = false;
		
		try {
			String sql = "delete from job where id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			int i = pst.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Jobs> getAllJobForUser()
	{
		List<Jobs> lst = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sql = "select *from job where status=? order by id desc";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "Active");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				
				lst.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return lst;
	}
	
	public List<Jobs> getJobsORLocAndCat(String category,String location)
	{
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sql = "select *from job where category=? or location=? order by id DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1,category);
			pst.setString(2, location);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{

				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Jobs> getJobsAndLocAndCat(String category,String location)
	{
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		
		try {
			String sql = "select *from job where category=? || location=? order by id DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1,category);
			pst.setString(2, location);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next())
			{

				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setExperience(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8)+"");
				
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	}

