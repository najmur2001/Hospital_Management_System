package naj.user.servlet;





import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import naj.dao.UserDao;
import naj.conn.DBConnect;
import naj.entity.User;


@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		UserDao dao = new UserDao(DBConnect.getConn());
		User user = dao.login(email, password);

		if (user != null) {
			session.setAttribute("session_name", user.getFullName());
			session.setAttribute("userObj", user);
			resp.sendRedirect("user/index.jsp");
		} else {
			
			resp.sendRedirect("user_Login.jsp");
		}

	}

}