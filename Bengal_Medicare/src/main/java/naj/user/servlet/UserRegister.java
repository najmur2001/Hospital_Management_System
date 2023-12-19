package naj.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import naj.dao.UserDao;
import naj.conn.DBConnect;
import naj.entity.User;

@WebServlet("/userRegister")
public class UserRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        try {
            String fullName = req.getParameter("fullName");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            User u = new User(fullName, email, password);

            UserDao dao = new UserDao(DBConnect.getConn());

            HttpSession session = req.getSession();

            boolean f = dao.register(u);

            if (f) {
                // Set success message as a session attribute
                session.setAttribute("succSign", "User registered successfully");

                // Redirect to the registration page
                resp.sendRedirect("signup.jsp");
            } else {
            	 // Set success message as a session attribute
                session.setAttribute("errorSign", "User registered not successfully");

                // Redirect to the registration page
                resp.sendRedirect("signup.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
