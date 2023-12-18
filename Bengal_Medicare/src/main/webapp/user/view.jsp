<%@ page import="naj.dao.*" %>
<%@ page import="naj.conn.*" %>
<%@ page import="naj.entity.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <%@include file="../component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
	

	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Appointment Status</p>
						

						 <table class="table">
                        <thead>
                            <tr>
                                <th scope="col-1">id</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Age</th>
                                <th scope="col">Appointment</th>
                               
                                <th scope="col">Mob No</th>
                                <th scope="col">Diseases</th>
                                <th scope="col">Doctor Name</th>
                                
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        
						<%
						User u = (User) session.getAttribute("userObj");
						AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
						doctorDao dao2 = new doctorDao(DBConnect.getConn());
						
						List<Appointment> list = dao.getAllAppointmentByLoginUser(u.getId());
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
							
						%>
                            
                            <tr>
                                <td><%= ap.getId() %></td>
                                <td><%=ap.getFullName()%></td>
                                <td><%=ap.getGender()%></td>
                                <td><%=ap.getAge()%></td>
                                <td><%=ap.getAppoinDate()%></td>
                               
                                <td><%=ap.getPhNo()%></td>
                                <td><%=ap.getDiseases()%></td>
                                <td><%=d.getFullName()%></td>
                               
                                <td><%=ap.getStatus()%></td>
                               
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>