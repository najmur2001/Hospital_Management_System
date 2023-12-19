package naj.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import naj.entity.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			PrintWriter out=resp.getWriter();
//			String myMobile=req.getParameter("mobile1");
			String myEmail=req.getParameter("email");
			String myPass=req.getParameter("password");
			
			HttpSession session=req.getSession();
			
			if("admin@gmail.com".equals(myEmail) && "admin".equals(myPass))
				 
			{
				session.setAttribute("adminObj", new User());
				
				 // Set success message as a session attribute
	           
				
				resp.sendRedirect("admin/index.jsp");
			}
			
			else
			{
				 // Set success message as a session attribute
		           session.setAttribute("errorAL", "Id and Password not matching");
				
			        RequestDispatcher rd = req.getRequestDispatcher("/admin_Login.jsp");
			        rd.include(req, resp);
			}
		}
		catch(Exception e)
		{
			
		}
	}

}
