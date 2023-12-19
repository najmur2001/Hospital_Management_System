<%@ page import="naj.entity.Appointment" %>
<%@ page import="naj.conn.DBConnect" %>
<%@ page import="naj.dao.AppointmentDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
    <%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-4">Patient Edit</p>
                        
                        
                         <!-- Check for the success message in the session -->
                        <% String successMessage = (String) session.getAttribute("succPE");
                           String errorMessage = (String) session.getAttribute("errorPE");
                           if (successMessage != null) { %>
                            <div class="alert alert-success" role="alert">
                                <%= successMessage %>
                            </div>
                            <!-- Remove the success message from the session after displaying -->
                            <% session.removeAttribute("succPE"); %>
                        <% } else if (errorMessage != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= errorMessage %>
                            </div>
                            <!-- Remove the error message from the session after displaying -->
                            <% session.removeAttribute("errorPE"); %>
                        <% } %>

                        <%
                        try {
                            int id = Integer.parseInt(request.getParameter("id"));
                            AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                            Appointment appointment = dao.getAppointmentById(id);
                        %>

                        <form class="row" action="../EditAppointmentServlet" method="post">
                            <div class="col-md-6">
                                <label>Patient Name</label>
                                <input type="text" name="fullName" value="<%=appointment.getFullName()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label>Gender</label>
                                <input type="text" name="gender" value="<%=appointment.getGender()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label>Email</label>
                                <input type="email" name="email" value="<%=appointment.getEmail()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <br>
                                <label>Mob No</label>
                                <input type="text" name="mob" value="<%=appointment.getPhNo()%>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <br>
                                <label>Diseases</label>
                                <input type="text" name="dis" value="<%=appointment.getDiseases()%>" class="form-control">
                            </div>

                            <div class="col-md-12">
                                <br>
                                <label>Status</label>
                                <textarea required name="status" class="form-control" rows="3"><%= appointment.getStatus()%></textarea>
                            </div>

                            <input type="hidden" name="id" value="<%=appointment.getId()%>">
                            <input type="hidden" name="did" value="<%=appointment.getDoctorId()%>">

                            <button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                        </form>

                        <%
                        } catch (NumberFormatException e) {
                            // Handle the exception, e.g., redirect to an error page or display an error message.
                            e.printStackTrace();
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
