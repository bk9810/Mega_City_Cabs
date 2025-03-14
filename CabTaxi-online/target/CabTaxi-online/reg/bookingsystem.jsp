<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    HttpSession sessionObj = request.getSession(false);
    String customerName = (sessionObj != null) ? (String) sessionObj.getAttribute("customerName") : null;

    if (customerName == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking System </title>
<style>
	body {
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
.logout{
	margin-top: 200px;
	cursor: pointer;
}

/* Main Content */
.main-content {
    flex: 1;
    margin-left: 230px;
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
  	
    margin-top: -20px;
}

.navbar h1 {
    font-size: 22px;
    font-weight: bold;
    margin-left: 30px;
}

.user-info {
    display: flex;
    align-items: center;
    gap: 15px;
}

.user-info i {
    font-size: 20px;
    cursor: pointer;
}

.profile {
    display: flex;
    align-items: center;
    gap: 10px;
}
.ava {
    
   
    padding-right: 200px;
    border-radius: 50%;
    cursor: pointer;
}
.name{
	padding-left: 100px;
	margin-top: -40px;
}
.container {
	padding-left: 200px;
}
.cc{
	padding-left: 500px;
	font-size: 30px;
}
	


</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="sidebar" id="sidebar">
		<div class="logo">
			<a href="Login.jsp"><img src="../img/aa.png" alt="sample image"></a>
		</div>
		
		<button class="toggle-btn" onclick="toggleSidebar()">
		<i class="fa-solid fa-bars"></i>
		</button>
		
		<nav>
			<a href="#" class="active" style=background-color:#e2e8f0><i class="fa-solid fa-taxi"></i><span>Dashboard</span></a>
			<a href="bookingsystem.jsp" class="active" style=background-color:#e2e8f0><i class="fa-solid fa-taxi"></i><span>Booking</span></a>
			<a href="BookingHistory.jsp" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Booking History</span></a>
			<a href="Contact.jsp" class="active"><i class="fa-solid fa-phone"></i><span>Customer Review</span></a>
			
			
			 <a href="<%= request.getContextPath() %>/reg/logout" class="logout"><i class="fa-solid fa-sign-out-alt "></i>Logout</a>
			
		</nav>
	</div>
	
	<div class="main-content">
		<div class="navbar">
			<h1>Mega City Cab Service</h1>
			<div class="user-info">
				<div class="profile">
					<div >
						<a class="avatar" href="<%= request.getContextPath() %>/reg/customerProfile"><i class="fa-solid fa-circle-user fa-3x ava" style="color: gray;"></i>
						<h2 class="name"> <%= customerName %>!</h2>
						</a>
    					
    					
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<div> <p class="cc">Here our Booking System and you have to ride, Book Now</p></div>
<div class="d-flex justify-content-center align-items-center min-vh-100">
    <div class="container mt-0 pt-0">  <!-- Adjusted top margin and padding -->
        <div class="jumbotron p-4">  <!-- Added padding inside the jumbotron -->
            <h1 class="display-4"></h1>
            
            <div class="row justify-content-center">
                <div class="col-md-3 mb-2">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Locations</h5>
                            <p class="card-text">Add and view locations available for ride bookings.</p>
                            <a href="manageLocations" class="btn btn-primary">Add Locations</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Distances</h5>
                            <p class="card-text">Set up distances between different locations.</p>
                            <a href="manageDistances" class="btn btn-success">Add Distances</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-2">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Booking</h5>
                            <p class="card-text">Set up distances between different locations.</p>
                            <a href="booking" class="btn btn-success">Add Distances</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>