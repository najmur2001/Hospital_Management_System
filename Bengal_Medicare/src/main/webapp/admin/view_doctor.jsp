<%@page import="java.sql.Connection" %>
<%@page import="naj.conn.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="naj.entity.Doctor" %>
<%@page import="naj.admin.servlet.*" %>
<%@page import="naj.dao.doctorDao" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Details</title>
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
    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Doctor Details</p>
                        
                        
                        <!-- Check for the success message in the session -->
<%
   String successMessage = (String) session.getAttribute("succDD");
   String errorMessage = (String) session.getAttribute("errorDD");
   String edit = (String) session.getAttribute("succED");
%>

<% if (successMessage != null) { %>
   <div class="alert alert-success" role="alert">
      <%= successMessage %>
   </div>
   <!-- Remove the success message from the session after displaying -->
   <% session.removeAttribute("succDD"); %>
<% } else if (errorMessage != null) { %>
   <div class="alert alert-danger" role="alert">
      <%= errorMessage %>
   </div>
   <!-- Remove the error message from the session after displaying -->
   <% session.removeAttribute("errorDD"); %>
<% } else if (edit != null) { %>
   <div class="alert alert-success" role="alert">
      <%= edit %>
   </div>
   <!-- Remove the success message from the session after displaying -->
   <% session.removeAttribute("succED"); %>
<% } %>
                        
                        
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col-1">id</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">DOB</th>
                                    <th scope="col">Qualification</th>
                                    <th scope="col">Specialist</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mob No</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <% 
                                    doctorDao dao = new doctorDao(DBConnect.getConn());
                                    List<Doctor> doctorList = dao.getAllDoctor();
                                    
                                    for (Doctor doctor : doctorList) {
                                %>
                                    <tr>
                                        <td><%= doctor.getId() %></td>
                                        <td><%= doctor.getFullName() %></td>
                                        <td><%= doctor.getDob() %></td>
                                        <td><%= doctor.getQualification() %></td>
                                        <td><%= doctor.getSpecialist() %></td>
                                        <td><%= doctor.getEmail() %></td>
                                        <td><%= doctor.getMobile() %></td>
                                        <td><%= doctor.getPassword() %></td>
                                        <td> <a href="edit_doctor.jsp?id=<%=doctor.getId() %>"
                                        class="btn btn-sm btn-primary">Edit</a>
                                        <a href="../delete?id=<%=doctor.getId() %>"
                                        class="btn btn-sm btn-danger">Delete</a>
                                        </td>
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
