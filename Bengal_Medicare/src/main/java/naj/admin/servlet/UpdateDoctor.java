package naj.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import naj.dao.*;
import naj.conn.*;
import naj.entity.*;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");

			int id = Integer.parseInt(req.getParameter("id"));

			Doctor d = new Doctor(id,fullName, dob, qualification, spec, email, mobno, password);

			doctorDao dao = new doctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.updateDoctor(d)) {
				
				session.setAttribute("succED", "Edit Succesfully");
				resp.sendRedirect("admin/view_doctor.jsp");
			} else {
				session.setAttribute("errorED", "Edit Failed");
				resp.sendRedirect("admin/edit_doctor.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
