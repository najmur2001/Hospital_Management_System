<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allcss.jsp" %>
<%@include file="component/about.jsp" %>

<style type="text/css">
.paint-card{
   box-shadow: 0 0 10px 0 rgba(0,0,0.3);
}




</style>
 

</head>
<body>
<%@include file="component/navbar.jsp" %>

<br>
<br>
<br>




<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/pic.jpg" class="d-block w-100" alt="pic" height=500px>
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/pic-2.jpg" class="d-block w-100" alt="pic" height=400px>
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/pic-3.jpg" class="d-block w-100"alt="pic" height=300px>
      <div class="carousel-caption d-none d-md-block">
        
      
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<hr>
  <!-- services section starts  -->

    <section class="services" id="services">
      <h1 class="heading">our <span>services</span></h1>

      <div class="box-container">

        <div class="box">
          <i class="fas fa-ambulance"></i>
          <h3>24/7 ambulance</h3>
          <p>
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad, omnis.
          </p>
          
        </div>

        <div class="box">
          <i class="fas fa-user-md"></i>
          <h3>expert doctors</h3>
          <p>
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad, omnis.
          </p>
         
        </div>

        <div class="box">
          <i class="fas fa-pills"></i>
          <h3>medicines</h3>
          <p>
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad, omnis.
          </p>
          
        </div>

        <div class="box">
          <i class="fas fa-procedures"></i>
          <h3>bed facility</h3>
          <p>
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ad, omnis.
          </p>
         
        </div>

       
      </div>
    </section>

    <!-- services section ends -->
	
	
	
	
	<hr>

	<div class="container p-2">
		<p class="text-center fs-2 ">Our Team</p>
		
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/PASSPORT_pic.jpg" width="200px" height="300px">
						<p class="fw-bold fs-5">Najmur Hossain</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc-1.jpg" width="200px" height="300px">
						<p class="fw-bold fs-5">Dr.Siva Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc-2.jpg" width="200px" height="300px">
						<p class="fw-bold fs-5">Dr. Niuise Paule</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc-3.jpg" width="200px" height="300px">
						<p class="fw-bold fs-5">Dr. Mathue Samuel</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

		</div>

	</div>
	

<%@include file="component/footer.jsp" %>







	

</body>
</html>