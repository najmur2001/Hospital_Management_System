<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <style type="text/css">
        /* Custom style for the navbar text color */
        .navbar-nav .nav-link {
            color: white !important;
        }


        i {
            margin-right: 5px;
        }
        
         .dropdown-menu{
        	min-width: 9.5px;
        }
        
        
    </style>


<nav class="navbar navbar-expand-lg navbar-light bg-primary fixed-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i
			class="fas fa-clinic-medical"></i> Bengal Medicare </h3></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
              
				<li class="nav-item"><a class="nav-link active li" href="index.jsp"><i class="fa-solid fa-house"></i>Home</a></li>
				<li class="nav-item"><a class="nav-link active" href="doctor.jsp"><i class="fa-solid fa-user-doctor"></i>Add Doctor</a></li>
         <li class="nav-item"><a class="nav-link active" href="view_doctor.jsp"><i class="fa-solid fa-user-doctor"></i></i>View Doctors</a></li>
          <li class="nav-item"><a class="nav-link active" href="patient.jsp"><i class="fa-solid fa-calendar-check"></i>Patient</a></li>
           <li class="nav-item"><a class="nav-link active" href="userView.jsp"><i class="fa-solid fa-user"></i></i>User</a></li>
			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Admin</button>
					<ul class="dropdown-menu drop" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item "  href="../adminLogout">Logout</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>
<title>Insert title here</title>
</head>
<body>

</body>
</html>