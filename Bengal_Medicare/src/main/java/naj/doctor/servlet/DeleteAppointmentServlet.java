package naj.doctor.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import naj.conn.DBConnect;
import naj.dao.AppointmentDAO;

@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            int did = Integer.parseInt(req.getParameter("did"));
            
            HttpSession session=req.getSession();

            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
            
            

            if (dao.deleteAppointment(id, did)) {
            	 // Set success message as a session attribute
                session.setAttribute("succPD", "Deleted success");
                resp.sendRedirect("doctor/patient.jsp");
            } else {
            	 // Set success message as a session attribute
                session.setAttribute("errorPD", "Deleted Failed");
                resp.sendRedirect("doctor/patient.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
