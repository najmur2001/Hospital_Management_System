<%@page import="naj.entity.*"%>
<%@page import="naj.dao.*"%>
<%@page import="naj.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="naj.conn.DBConnect"%>

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
    
    <br>
    <br>
    <br>
    <div class="container-fluid p-3">
        <div class="row">

            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Edit Doctor Details</p>
                        
                        
                         <!-- Check for the success message in the session -->
                        <% String successMessage = (String) session.getAttribute("succED");
                           String errorMessage = (String) session.getAttribute("errorED");
                           if (successMessage != null) { %>
                            <div class="alert alert-success" role="alert">
                                <%= successMessage %>
                            </div>
                            <!-- Remove the success message from the session after displaying -->
                            <% session.removeAttribute("succED"); %>
                        <% } else if (errorMessage != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= errorMessage %>
                            </div>
                            <!-- Remove the error message from the session after displaying -->
                            <% session.removeAttribute("errorED"); %>
                        <% } %>
                        
                        
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        doctorDao dao2 = new doctorDao(DBConnect.getConn());
                        Doctor d = dao2.getDoctorById(id);
                        %>

                        <form action="../updateDoctor" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control"
                                    value="<%=d.getFullName()%>">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">DOB</label>
                                <input type="date" value="<%=d.getDob()%>" required name="dob"
                                    class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Qualification</label>
                                <input required value="<%=d.getQualification()%>" name="qualification"
                                    type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Specialist</label>
                                <select name="spec" required class="form-control">
                                    <option value="<%=d.getSpecialist()%>"><%=d.getSpecialist()%></option>

                                    <%
                                    doctorDao dao = new doctorDao(DBConnect.getConn());
                                    List<Doctor> list = dao.getAllDoctor();
                                    for (Doctor doctor : list) {
                                    %>
                                    <option value="<%=doctor.getSpecialist()%>"><%=doctor.getSpecialist()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="text" value="<%=d.getEmail()%>" required name="email"
                                    class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mob No</label>
                                <input type="text" value="<%=d.getMobile()%>" required name="mobno"
                                    class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input required value="<%=d.getPassword()%>" name="password" type="text"
                                    class="form-control">
                            </div>
                            <input type="hidden" name="id" value="<%=d.getId()%>">

                            <button type="submit" class="btn btn-primary col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
