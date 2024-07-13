package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
		
			String name = req.getParameter("name");
			String qua = req.getParameter("qua");
			String email = req.getParameter("em");
			String ps = req.getParameter("ps");
			
			UserDao dao = new UserDao(DBConnect.getConn());
			
			User u = new User();
			
			u.setId(id);
			u.setName(name);
			u.setQualification(qua);
			u.setEmail(email);
			u.setPassword(ps);
			
			boolean f= dao.updateUser(u);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Registered Succesfully");
				resp.sendRedirect("home.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something Went Wrong!!Please Try Again Later");
				resp.sendRedirect("home.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	

}
