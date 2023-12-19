package naj.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import naj.conn.*;
import naj.dao.*;
import naj.entity.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteDoctor extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		int id=Integer.parseInt(req.getParameter("id"));
		
		doctorDao dao=new doctorDao(DBConnect.getConn());
		boolean n=dao.deleteDoctor(id);
		//set session
		HttpSession session=req.getSession();
		
		
		try
		{
			if(n)
			{
				resp.sendRedirect("admin/view_doctor.jsp");
				session.setAttribute("succDD", "Delete Success");
				
			}
			else
			{
				resp.sendRedirect("admin/view_doctor.jsp");
				
				
				session.setAttribute("errorDD", "Delete Failed");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
