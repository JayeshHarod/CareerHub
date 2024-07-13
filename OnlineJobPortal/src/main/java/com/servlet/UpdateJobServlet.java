package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDao;
import com.entity.Jobs;

@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String exp = req.getParameter("experience");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");
			
			Jobs j = new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setLocation(location);
			j.setDescription(desc);
			j.setStatus(status);
			j.setCategory(category);
			j.setExperience(exp);
			

			HttpSession session = req.getSession();
			JobDao dao = new JobDao(DBConnect.getConn());
			
			boolean f = dao.updateJob(j);
			
			if(f)
			{
				session.setAttribute("succMsg", "Job Update Successfully");
				resp.sendRedirect("viewjob.jsp");
				
			}
			else {
				session.setAttribute("succMsg","Something went Wrong!! Please Try Again Later");
				resp.sendRedirect("viewjob.jsp");
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
