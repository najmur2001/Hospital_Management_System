<%@page import="java.sql.Connection" %>
<%@page import="naj.conn.*" %>
<%@ page import="java.util.List" %>
<%@ page import="naj.entity.*" %>
<%@page import="naj.admin.servlet.*" %>
<%@page import="naj.dao.*" %>

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
                        <p class="fs-3 text-center">User Details</p>
                        
                       <table class="table">
                        <thead>
                            <tr>
                                <th scope="col-1">id</th>
                                 <th scope="col">Full Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Password</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        
                        
						<%
						UserDao dao = new UserDao(DBConnect.getConn());
						List<User> user = dao.getAllUser();
						for (User u : user) {
							
						%>
                            
                            <tr>
                                <td><%= u.getId() %></td>
                                <td><%=u.getFullName()%></td>
                                <td><%=u.getEmail()%></td>
                                <td><%=u.getPassword()%></td>
                                
                              
                                
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
