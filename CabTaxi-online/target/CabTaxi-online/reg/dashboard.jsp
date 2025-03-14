<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%@ page import="com.example.model.Customer" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("customer") == null) {
    	 response.sendRedirect(request.getContextPath() + "/reg/Login.jsp");
        return;
    }
    Customer custome = (Customer) sessionUser.getAttribute("customer");
%>
    
    
<%
    HttpSession sessionObj = request.getSession(false);
    String customerName = (sessionObj != null) ? (String) sessionObj.getAttribute("customerName") : null;

    if (customerName == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<% if (request.getParameter("error") != null) { %>
    <div class="error-message" style="color: red; margin: 10px;">
        <%= request.getParameter("error") %>
    </div>
<% } %>
<%@ page import="com.example.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


 <title>Customer Dashboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


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

.booking{
	padding-right: 100px;
	padding-left: 400px;
	
}
form{
	
    height: 60vh;
    background: white;
    padding: 20px;
    width: 400px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    text-align: left;
    margin-top: 100px;

}

h2 {
    text-align: center;
    color: #333;
   margin-top: -10px;
}

input {
    width: 90%;
    padding: 10px;
    margin: 5px 0 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

/* Button Styling */
.book {
    background-color: #28a745;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    cursor: pointer;
    width: 100%;
    transition: 0.3s;
  
}
.booking-form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            height: 1000px;
        }
        .booking-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .booking-form label {
            display: block;
            margin-bottom: 5px;
        }
        .booking-form input, .booking-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .booking-form button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .booking-form button:hover {
            background-color: #218838;
        }

book:hover {
    background-color: #218838;
}



.dashboard{
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	height: 450px;
	width: 500px;
	margin-top:100px;
	margin-left: 500px;
	
}
.dashboard h1{
	display: flex;
	justify-content: center;
	align-items: center:
	
}

.dashboard h2{
	padding-left: 80px;
}

.detail{
	padding-left: 80px;
	margin-top: 40px;
}

.btn{
	margin-top: 100px;
	margin-left: 40px;
	background-color: 	black;
}
.btn a{
	color: white;
	text-decoration: none;
}

.edit-btn{
	margin-top: 100px;
	float: right;
	background-color: 	black;
	color: white;
	cursor: pointer;
}

.modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.5);
    }
    .modal-content {
        background-color: #fff;
        margin: 10% auto;
        padding: 20px;
        width: 40%;
        border-radius: 10px;
    }
    .close {
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .save-btn {
        background: #28a745;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .save-btn:hover {
        background: #218838;
    }


</style>



</head>
<body>

	<%
        Customer customer = (Customer) request.getAttribute("customer");
        if (customer != null) {
    %>
   
	
	
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
	
	
	<%} %>
 
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
document.getElementById("bookingForm").addEventListener("submit", function(event) {
    let fare = document.getElementById("fare").value;
    
    if (!fare || fare.trim() === "") {
        alert("Fare cannot be empty!");
        event.preventDefault();
    }
});

</script>

<script>
let map;
let directionsService;
let directionsRenderer;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 6.9271, lng: 79.8612}, // Western Province coordinates
        zoom: 10
    });
    directionsService = new google.maps.DirectionsService();
    directionsRenderer = new google.maps.DirectionsRenderer();
    directionsRenderer.setMap(map);
}






	
	
	 <script>
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('collapsed');
        }
    </script>
    
        
       
</body>
</html>