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

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			JobDao dao = new JobDao(DBConnect.getConn());
			boolean f = dao.deleteJob(id);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Job Delete Successfully");
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
