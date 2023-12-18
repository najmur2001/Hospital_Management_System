<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="../component/allcss.jsp" %>


<style type="text/css">
.paint-card{
   box-shadow: 0 0 10px 0 rgba(0,0,0.3);


</style>
 

</head>
<body>
<%@include file="navbar.jsp" %>
<br>
<h3>Welcome:  ${session_name} </h3>
	<p class="text-center fs-3">User Dashboard</p>

	
	<div class="container p-5">
		<div class="row">
			
			<div class="col-md-4 offset-md-2">
    <div class="card paint-card">
        <div class="card-body text-center text-success">
            <a href="appointment.jsp">
                <i class="far fa-calendar-check fa-3x"></i><br>
                <p class="fs-4 text-center">
                    Take Appointment 
                </p>
            </a>
        </div>
    </div>
</div>


			<div class="col-md-4 offset-md-2">
    <div class="card paint-card">
        <div class="card-body text-center text-success">
            <a href="view.jsp">
                <i class="far fa-calendar-check fa-3x"></i><br>
                <p class="fs-4 text-center">
                    View Appointment 
                </p>
            </a>
        </div>
    </div>
</div>


		</div>
	</div>
	
	

</body>
</html>