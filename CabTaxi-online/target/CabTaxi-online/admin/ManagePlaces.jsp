<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>	body {
    font-family: Arial, sans-serif;
     background-color: #f4f4f4;
    margin: 0;
    padding: 0;
   
    
}

/* Sidebar */
.sidebar {
    width: 250px;
    background: white;
    height: 100vh;
    padding: 20px;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    position: fixed;
    transition: width 0.3s;
    margin-top: -30px;
  
}

.sidebar .logo {
    display: flex;
    align-items: center;
    gap: 10px;
}
.logo img{
	width: 100px;
}

.sidebar-title {
    font-size: 20px;
    font-weight: bold;
    
}

.toggle-btn {
    background: none;
    border: none;
    font-size: 20px;
    cursor: pointer;
    margin: 15px 0;
}

nav a {
    display: flex;
    align-items: center;
    gap: 10px;
    text-decoration: none;
    color: black;
    font-size: 16px;
    padding: 10px;
    border-radius: 5px;
    
}

nav a:hover, nav a.active {
    margin-top: 30px;
   
}
.sidebar.collapsed {
    width: 80px;
}

.sidebar.collapsed .sidebar-title,
.sidebar.collapsed span {
    display: none;
    
}
.main-content {
    flex: 1;
    margin-left: 250px;
    transition: margin-left 0.3s;
    padding: 20px;
     
}

.sidebar.collapsed ~ .main-content {
    margin-left: 80px;
   
    
    
    
   
}

/* Navbar */
.navbar {
    background: white;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  	
    margin-top: -80px;
}

.sidebar h1 {
    font-size: 22px;
    font-weight: bold;
    margin-left: 30px;
}
.container{
	padding-left: 300px;
}
</style>
</head>
<body>
	<div class="con">
        <div class="sidebar" id="sidebar">
        <h1>Mega City Cab Service</h1>
		<div class="logo">
			<img src="../img/aa.png" alt="sample image">
		</div>
		
		
		<nav>
			<a href="dashboard.jsp" class="active" style=background-color:#e2e8f0><i class="fa-solid fa-taxi"></i><span>Booking</span></a>
			<a href="customerManagement.jsp" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Customer Management</span></a>
			<a href="customerManagement.jsp" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Driver Management</span></a>
			<a href="ManagePlaces.jsp" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Manage L & D</span></a>
			<a href="Customer_review.jsp" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Customer Review</span></a>
			<a href="#" class="active"><i class="fa-solid fa-phone"></i><span>Contact</span></a>
			
			 <a href="<%= request.getContextPath() %>/reg/logout"><i class="fa-solid fa-sign-out-alt"></i><span>Logout</span></a>
			
		</nav>
	</div>
</div>	
	
	<div class="container mt-5">
        <div class="jumbotron">
            <h1 class="display-4"> </h1>
            
            <p class="lead">Here our Booking System and you have to ride, Book Now</p>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Locations</h5>
                            <p class="card-text">Add and view locations available for ride bookings.</p>
                            <a href="location" class="btn btn-primary">Add Locations</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Distances</h5>
                            <p class="card-text">Set up distances between different locations.</p>
                            <a href="managedistan" class="btn btn-success">Add Distances</a>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</body>
</html>