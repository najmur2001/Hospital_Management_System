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

			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						
						 <!-- Check for the success message in the session -->
                        <% String successMessage = (String) session.getAttribute("succAD");
                           String errorMessage = (String) session.getAttribute("errorAD");
                           if (successMessage != null) { %>
                            <div class="alert alert-success" role="alert">
                                <%= successMessage %>
                            </div>
                            <!-- Remove the success message from the session after displaying -->
                            <% session.removeAttribute("succAD"); %>
                        <% } else if (errorMessage != null) { %>
                            <div class="alert alert-danger" role="alert">
                                <%= errorMessage %>
                            </div>
                            <!-- Remove the error message from the session after displaying -->
                            <% session.removeAttribute("errorAD"); %>
                        <% } %>
						
						
						<form action="../doctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <input required
									name="spec" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary col-md-12">Submit</button>
						</form>
					</div>
				</div>
			</div>


			
		</div>
	</div>
</body>
</html>