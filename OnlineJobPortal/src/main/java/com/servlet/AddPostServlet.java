package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDao;
import com.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addjob")
public class AddPostServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String exp = req.getParameter("experience");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");
			
			Jobs j = new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setDescription(desc);
			j.setStatus(status);
			j.setCategory(category);
			j.setExperience(exp);
			
			
			HttpSession session = req.getSession();
			JobDao dao = new JobDao(DBConnect.getConn());
			
			boolean f = dao.addJobs(j);
			
			if(f)
			{
				session.setAttribute("succMsg", "Job Post Successfully");
				resp.sendRedirect("Addjob.jsp");
				
			}
			else {
				session.setAttribute("succMsg","Something went Wrong!! Please Try Again Later");
				resp.sendRedirect("Addjob.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
