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
	/* Modern Customer Dashboard Styles */
:root {
  --primary: #4a6cf7;
  --primary-dark: #3a56d4;
  --secondary: #6c757d;
  --dark: #292d32;
  --success: #2ecc71;
  --warning: #f7b84b;
  --danger: #f64e60;
  --light: #f5f8fa;
  --gray-100: #f8f9fa;
  --gray-200: #e9ecef;
  --gray-300: #dee2e6;
  --gray-500: #adb5bd;
  --shadow-sm: 0 2px 5px rgba(0, 0, 0, 0.05);
  --shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
  --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.1);
  --radius: 10px;
  --transition: all 0.25s ease;
}

/* Base Styles */
body {
  font-family: 'Inter', 'Segoe UI', sans-serif;
  background-color: #f9fafb;
  margin: 0;
  padding: 0;
  color: var(--dark);
  overflow-x: hidden;
  line-height: 1.6;
}

h1, h2, h3, h4, h5, h6 {
  font-weight: 600;
}

a {
  text-decoration: none;
  color: inherit;
  transition: var(--transition);
}

/* Sidebar */
.sidebar {
  width: 280px;
  background: white;
  height: 100vh;
  padding: 25px 0;
  box-shadow: var(--shadow);
  position: fixed;
  transition: var(--transition);
  z-index: 100;
  overflow-y: auto;
  border-right: 1px solid var(--gray-200);
}

.sidebar .logo {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 20px 25px;
  margin-bottom: 20px;
  border-bottom: 1px solid var(--gray-200);
}

.logo img {
  width: 140px;
  transition: var(--transition);
}

.sidebar-title {
  font-size: 18px;
  font-weight: 600;
  color: var(--dark);
  margin: 20px;
}

.toggle-btn {
  background: var(--gray-100);
  border: none;
  font-size: 18px;
  cursor: pointer;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  right: 20px;
  top: 22px;
  transition: var(--transition);
}

.toggle-btn:hover {
  background: var(--gray-200);
  transform: rotate(180deg);
}

nav {
  padding: 0 15px;
}

nav a {
  display: flex;
  align-items: center;
  gap: 12px;
  color: var(--secondary);
  font-size: 15px;
  padding: 14px 18px;
  border-radius: var(--radius);
  margin-bottom: 8px;
  font-weight: 500;
  transition: var(--transition);
}

nav a i {
  font-size: 18px;
  width: 22px;
  text-align: center;
}

nav a:hover, nav a.active {
  color: var(--primary);
  background-color: rgba(74, 108, 247, 0.05);
  margin-top: 0;
  transform: translateX(5px);
}

nav a.active {
  color: var(--primary);
  background-color: rgba(74, 108, 247, 0.1);
  font-weight: 600;
}

.sidebar.collapsed {
  width: 80px;
}

.sidebar.collapsed .logo img {
  width: 40px;
}

.sidebar.collapsed .sidebar-title,
.sidebar.collapsed span,
.sidebar.collapsed .name {
  display: none;
}

.sidebar.collapsed nav a {
  justify-content: center;
  padding: 15px;
}

.sidebar.collapsed nav a i {
  margin: 0;
}

.logout {
  margin-top: 40px;
  color: var(--secondary);
  border-top: 1px solid var(--gray-200);
  padding-top: 20px !important;
}

.logout:hover {
  color: var(--danger) !important;
}

.logout i {
  color: var(--danger);
}

/* Main Content */
.main-content {
  margin-left: 280px;
  transition: var(--transition);
  min-height: 100vh;
  padding: 0;
  position: relative;
}

.sidebar.collapsed ~ .main-content {
  margin-left: 80px;
}

/* Navbar */
.navbar {
  background: white;
  padding: 15px 30px !important;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: var(--shadow-sm);
  margin: 0 !important;
  height: 70px;
  position: sticky;
  top: 0;
  z-index: 99;
}

.navbar h1 {
  font-size: 20px;
  font-weight: 600;
  margin: 0;
  color: var(--dark);
}

.user-info {
  display: flex;
  align-items: center;
  gap: 20px;
}

.user-info i {
  font-size: 20px;
  cursor: pointer;
  color: var(--secondary);
}

.profile {
  display: flex;
  align-items: center;
  position: relative;
}

.ava {
  color: var(--primary) !important;
  font-size: 32px !important;
  width: 40px;
  height: 40px;
  padding: 0 !important;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: var(--transition);
}

.ava:hover {
  transform: scale(1.05);
}

.name {
  padding-left: 15px;
  margin: 0;
  font-size: 15px;
  font-weight: 500;
}

/* Dashboard Styles */
.content-container {
  padding: 30px;
}

.dashboard {
  background: white;
  border-radius: var(--radius);
  box-shadow: var(--shadow);
  padding: 30px;
  margin: 30px auto;
  max-width: 800px;
  position: relative;
  overflow: hidden;
}

.dashboard::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 5px;
  background: linear-gradient(to right, var(--primary), var(--warning));
}

.dashboard h1 {
  margin-top: 10px;
  margin-bottom: 30px;
  font-size: 24px;
  color: var(--dark);
  position: relative;
  padding-bottom: 15px;
}

.dashboard h1::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background-color: var(--primary);
}

.dashboard h2 {
  font-size: 18px;
  color: var(--dark);
  margin-bottom: 5px;
  padding-left: 0;
}

.detail {
  padding: 20px;
  background-color: var(--gray-100);
  border-radius: var(--radius);
  margin-bottom: 20px;
  transition: var(--transition);
  border-left: 3px solid var(--primary);
  padding-left: 30px;
}

.detail:hover {
  transform: translateY(-3px);
  box-shadow: var(--shadow-sm);
}

.detail strong {
  color: var(--secondary);
  font-weight: 500;
  display: inline-block;
  width: 100px;
}

/* Buttons */
.btn {
  padding: 12px 24px;
  font-weight: 500;
  border-radius: var(--radius);
  transition: var(--transition);
  border: none;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
}

.btn-primary {
  background-color: var(--primary);
  color: white;
}

.btn-primary:hover {
  background-color: var(--primary-dark);
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(74, 108, 247, 0.4);
}

.btn-success {
  background-color: var(--success);
  color: white;
}

.btn-success:hover {
  background-color: #25a25a;
  transform: translateY(-2px);
}

.edit-btn {
  background-color: var(--primary);
  color: white;
  padding: 12px 20px;
  border-radius: var(--radius);
  font-weight: 500;
  transition: var(--transition);
  border: none;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  margin-top: 30px;
  box-shadow: 0 4px 10px rgba(74, 108, 247, 0.25);
}

.edit-btn i {
  font-size: 16px;
}

.edit-btn:hover {
  background-color: var(--primary-dark);
  transform: translateY(-2px);
  box-shadow: 0 6px 15px rgba(74, 108, 247, 0.35);
}

/* Modal Styles */
.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.5);
  backdrop-filter: blur(3px);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.modal.show {
  opacity: 1;
}

.modal-content {
  background-color: #fff;
  margin: 5% auto;
  padding: 30px;
  width: 500px;
  max-width: 90%;
  border-radius: var(--radius);
  box-shadow: var(--shadow-lg);
  transform: translateY(-20px);
  transition: transform 0.3s ease;
}

.modal.show .modal-content {
  transform: translateY(0);
}

.modal h2 {
  text-align: center;
  margin-bottom: 25px;
  color: var(--dark);
  font-weight: 600;
}

.close {
  position: absolute;
  right: 20px;
  top: 15px;
  font-size: 24px;
  font-weight: 500;
  cursor: pointer;
  color: var(--secondary);
  transition: var(--transition);
}

.close:hover {
  color: var(--danger);
}

/* Form Styles */
.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 500;
  color: var(--dark);
  font-size: 14px;
}

.form-group input, 
.form-group select,
.form-group textarea {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid var(--gray-300);
  border-radius: var(--radius);
  font-size: 15px;
  transition: var(--transition);
  background-color: white;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 3px rgba(74, 108, 247, 0.15);
  outline: none;
}

.save-btn {
  background-color: var(--primary);
  color: white;
  padding: 14px;
  border: none;
  border-radius: var(--radius);
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  width: 100%;
  transition: var(--transition);
  margin-top: 10px;
}

.save-btn:hover {
  background-color: var(--primary-dark);
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(74, 108, 247, 0.3);
}

/* Booking Form */
.booking-form {
  background: white;
  padding: 30px;
  border-radius: var(--radius);
  max-width: 700px;
  margin: 30px auto;
  box-shadow: var(--shadow);
  position: relative;
}

.booking-form::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 5px;
  background: linear-gradient(to right, var(--primary), var(--success));
}

.booking-form h2 {
  text-align: center;
  margin-bottom: 30px;
  color: var(--dark);
  font-size: 24px;
  position: relative;
  padding-bottom: 15px;
}

.booking-form h2::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 60px;
  height: 3px;
  background-color: var(--primary);
}

.booking-form button {
  background-color: var(--success);
  color: white;
  padding: 15px;
  border: none;
  border-radius: var(--radius);
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  width: 100%;
  transition: var(--transition);
  margin-top: 20px;
}

.booking-form button:hover {
  background-color: #25a25a;
  transform: translateY(-3px);
  box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
}

/* Error Messages */
.error-message {
  background-color: rgba(246, 78, 96, 0.1);
  border-radius: var(--radius);
  padding: 15px;
  margin-bottom: 20px;
  border-left: 4px solid var(--danger);
  color: var(--danger);
  font-weight: 500;
}

/* Responsive Design */

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