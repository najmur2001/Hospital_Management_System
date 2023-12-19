package naj.doctor.servlet;
import naj.dao.AppointmentDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import naj.conn.DBConnect;



@WebServlet("/updateStatus")
public class updateAppointmentStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String comm = req.getParameter("comm");

			AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());

			HttpSession session = req.getSession();

			if (dao.updateCommentStatus(id, did, comm)) {
				session.setAttribute("succPU", "Update Success");
				resp.sendRedirect("doctor/updatePatientStatus.jsp");
			} else {
				
				session.setAttribute("errorPU", "Update Failed");
				
				resp.sendRedirect("doctor/updatePatientStatus.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}