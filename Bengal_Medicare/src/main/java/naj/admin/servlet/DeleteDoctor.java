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
				session.setAttribute("succes", "succesfull");
				System.out.println("succes");
				 resp.setContentType("text/html");  //show only msg not code
				out.print("<h3 style='color:green'> User deleted Succesfull</h3>");
			}
			else
			{
				resp.sendRedirect("admin/view_doctor.jsp");
				
				
				resp.setContentType("text/html");  //show only msg not code
				out.print("<h3 style='color:red'> User deleted failed</h3>");
				System.out.println("failed");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
