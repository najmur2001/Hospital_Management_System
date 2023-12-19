<%@page import="naj.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="naj.conn.DBConnect"%>
<%@page import="naj.dao.AppointmentDAO"%>
<%@page import="naj.entity.Doctor"%>
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
                        <p class="fs-3 text-center">Patient Details</p>
                        
                        <!-- Check for the success message in the session -->
                        <% String successMessage = (String) session.getAttribute("succPD");
                           String errorMessage = (String) session.getAttribute("errorPD");
                           if (successMessage != null) { %>
                            <div class="alert alert-success" role="alert">
                                <%= successMessage %>
                            </div>
                            <!-- Remove the success message from the session after displaying -->
                            <% session.removeAttribute("succPD"); %>
                        <% } else if (errorMessage != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= errorMessage %>
                            </div>
                            <!-- Remove the error message from the session after displaying -->
                            <% session.removeAttribute("errorPD"); %>
                        <% } %>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Gender</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Appointment Date</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mob No</th>
                                    <th scope="col">Diseases</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                Doctor d = (Doctor) session.getAttribute("doctObj");
                                AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                                List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                                for (Appointment ap : list) {
                                %>
                                <tr>
                                    <th><%=ap.getFullName()%></th>
                                    <td><%=ap.getGender()%></td>
                                    <td><%=ap.getAge()%></td>
                                    <td><%=ap.getAppoinDate()%></td>
                                    <td><%=ap.getEmail()%></td>
                                    <td><%=ap.getPhNo()%></td>
                                    <td><%=ap.getDiseases()%></td>
                                    <td><%=ap.getStatus()%></td>
                                    <td>
                                        <%
                                        if ("Pending".equals(ap.getStatus())) {
                                        %>
                                        <a href="updatePatientStatus.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm">Comment</a>
                                        <%
                                        } else {
                                        %>
                                        <a href="EditAppointmentByDoctor.jsp?id=<%=ap.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                                        <a href="../DeleteAppointmentServlet?id=<%=ap.getId() %>&did=<%=ap.getDoctorId() %>" class="btn btn-sm btn-danger">Delete</a>
                                        <%
                                        }
                                        %>
                                    </td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

        </div>
    </div>

</body>
</html>
