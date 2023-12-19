<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Login Page</title>
    <%@include file="component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    <br>
    <br>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">User Login</p>

                          <!-- Check for the success message in the session -->
                        <% String successMessage = (String) session.getAttribute("succUL");
                           String errorMessage = (String) session.getAttribute("errorUL");
						 String logout = (String) session.getAttribute("succUL");
                           if (successMessage != null) { %>
                            <div class="alert alert-success" role="alert">
                                <%= successMessage %>
                            </div>
                            <!-- Remove the success message from the session after displaying -->
                            <% session.removeAttribute("succUL"); %>
                        <% } else if (errorMessage != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= errorMessage %>
                            </div>
                            <!-- Remove the error message from the session after displaying -->
                            <% session.removeAttribute("errorUL"); %>
                        
                        
                        <% } else if (logout != null) { %>
                            <div class="alert alert-success" role="alert">
                                <%= logout %>
                            </div>
                            <!-- Remove the error message from the session after displaying -->
                            <% session.removeAttribute("errorUL"); %>
                        <% } %>
						
                           
                           
                           
                           
                          

                        <form action="userLogin" method="post">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input required name="email" type="email" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input required name="password" type="password" class="form-control">
                            </div>

                            <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                        </form>

                        <br> Don't have an account?
                        <a href="signup.jsp" class="text-decoration-none"> Create Account</a>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
