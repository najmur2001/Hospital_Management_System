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


<nav class="navbar navbar-expand-lg navbar-light bg-primary">
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

				
				<li class="nav-item"><a class="nav-link active" href="index.jsp"><i class="fa-solid fa-house"></i>Home</a></li>
				<li class="nav-item"><a class="nav-link active" href="../doctor/patient.jsp"><i class="fa-solid fa-calendar-check"></i>Patient</a></li>


			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Doctor</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					     <li><a class="dropdown-item"  href="edit_doctor.jsp">Edit</a></li>
						<li><a class="dropdown-item"  href="../doctorLogout">Logout</a></li>
						
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>

</head>
<body>

</body>
</html>