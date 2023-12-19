package naj.user.servlet;

import naj.dao.*;
import naj.entity.*;
import naj.conn.*;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Appointment")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve parameters from the request
            String userIdParam = req.getParameter("userid");
            String doctorIdParam = req.getParameter("doct");

            // Check if userIdParam and doctorIdParam are not empty
            if (!userIdParam.isEmpty() && !doctorIdParam.isEmpty()) {
                // Parse parameters to integers
                int userId = Integer.parseInt(userIdParam);
                int doctorId = Integer.parseInt(doctorIdParam);

                // Get other parameters from the request
                String fullname = req.getParameter("fullname");
                String gender = req.getParameter("gender");
                String age = req.getParameter("age");
                String appoint_date = req.getParameter("appoint_date");
                String email = req.getParameter("email");
                String phno = req.getParameter("phno");
                String diseases = req.getParameter("diseases");
                String address = req.getParameter("address");

                // Create Appointment object
                Appointment ap = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctorId, address, "Pending");

                // Create AppointmentDAO and HttpSession
                AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                HttpSession session = req.getSession();

                // Add appointment to the database
                if (dao.addAppointment(ap)) {
                    // Set success message as a session attribute
                    session.setAttribute("succApp", "Appointment success");
                    resp.sendRedirect("user/appointment.jsp");
                    return; // Exit the method after successful processing
                } else {
                    // Set error message as a session attribute
                    session.setAttribute("errorApp", "Invalid input or appointment not success");
                    resp.sendRedirect("user/appointment.jsp");
                    return; // Exit the method after handling the error
                }
            }
        } catch (NumberFormatException e) {
            // Handle the exception, for example, by logging the error
            e.printStackTrace();
        }

        // If execution reaches here, there was an error, redirect to the appointment.jsp page
        HttpSession session = req.getSession();
        session.setAttribute("error", "Invalid input or appointment not success");
        resp.sendRedirect("user/appointment.jsp");
    }
}
