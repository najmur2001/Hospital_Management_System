package naj.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import naj.conn.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import naj.dao.*;
import naj.entity.Doctor;
@WebServlet("/doctor")
public class doctorAdd extends HttpServlet
{              
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  PrintWriter out=resp.getWriter();
		String myName=req.getParameter("fullname");
		String myBirth=req.getParameter("dob");
		String myQualification=req.getParameter("qualification");
		String mySpecialist=req.getParameter("spec");
		String myEmail=req.getParameter("email");
		String myMobile=req.getParameter("mobno");
		String myPassword=req.getParameter("password");
		
		//called constructor
		Doctor doctor=new Doctor(myName,myBirth,myQualification,mySpecialist,myEmail,myMobile,myPassword);
		
		doctorDao dao=new doctorDao(DBConnect.getConn());
		HttpSession session=req.getSession();
		boolean f=dao.registerDoctor(doctor);
		if(f)
		{
			
			resp.sendRedirect("admin/doctor.jsp");
			System.out.println("student details submit");
		}
		else
		{
			
			
			
			resp.sendRedirect("admin/doctor.jsp");
			System.out.println("student no details submit");
		}
	}

}
