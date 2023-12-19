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
import naj.entity.Appointment;

@WebServlet("/EditAppointmentServlet")
public class EditAppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            int did = Integer.parseInt(req.getParameter("did"));

            String name = req.getParameter("fullName");
            String gender = req.getParameter("gender");
            String email = req.getParameter("email");
            String mob = req.getParameter("mob");
            String diseases = req.getParameter("dis");
            String status = req.getParameter("status");

            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
            Appointment appointment = new Appointment();
            appointment.setId(id);
            appointment.setDoctorId(did);
            appointment.setFullName(name);
            appointment.setGender(gender);
            appointment.setEmail(email);
            appointment.setPhNo(mob);
            appointment.setDiseases(diseases);
            appointment.setStatus(status);
            
            HttpSession session=req.getSession();

            if (dao.updateAppointment(appointment)) {
            	 session.setAttribute("succPE", "Edit Success");
            	
                resp.sendRedirect("doctor/EditAppointmentByDoctor.jsp");
            } else {
            	session.setAttribute("errorPE", "Edit Failed");
                resp.sendRedirect("doctor/EditAppointmentByDoctor.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
