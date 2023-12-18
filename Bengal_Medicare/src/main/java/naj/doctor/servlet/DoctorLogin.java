package naj.doctor.servlet;




import naj.dao.*;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import naj.dao.doctorDao;
import naj.conn.DBConnect;
import naj.entity.Doctor;



@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();

		String email = req.getParameter("email1");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		doctorDao dao = new doctorDao(DBConnect.getConn());
		Doctor doctor = dao.login(email, password);

		if (doctor != null) {
		    out.print("success");
		    session.setAttribute("session_name",doctor.getFullName());
		    session.setAttribute("doctObj",doctor);
		    resp.sendRedirect("doctor/index.jsp");
		} else {
		    out.print("error");
		   
		    resp.sendRedirect("doctor_login.jsp");
		}


	}

}