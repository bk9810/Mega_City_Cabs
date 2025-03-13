<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="com.example.dao.DBConnectionFactory" %>
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
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
    height: 110vh;
    padding: 20px;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    position: fixed;
    transition: width 0.3s;
    margin-top: -20px;
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

/* Main Content */
.main-content {
    flex: 1;
    margin-left: 250px;
    transition: margin-left 0.3s;
    padding: 20px;
     
}
.logout{
	margin-top: 300px;
	cursor: pointer;
}


.sidebar.collapsed ~ .main-content {
    margin-left: 80px;
   
    
    
    
   
}

/* Navbar */
.navbar {
    background: white;
    padding: 15px 20px;
    display: flex;
    margin-left: -20px;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  	width: 1250px;
    margin-top: -35px;
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
    
   
    padding-right: 120px;
    border-radius: 50%;
    cursor: pointer;
}
.name{
	padding-left: 30px;
	margin-top: -2px;
	text-decoration: none;
	font-size: 20px;
	color: black;
}
.avatar{
	text-decoration: none;
}}
 body {
      padding-top: 20px;
      background-color: #f8f9fa;
    }
    .section-header {
      margin-bottom: 20px;
      padding-left:300px;
    }
    .list-unstyled{
    	padding-left: 20px;
    }
    #contact p{
    	padding-left: 100px;
    	 background: white;
    	
    }
    #contact{
    	background-color: white;
    	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    	width: 800px;
    	margin-left: 400px;
    	height:560px;
    }
    .form-label{
		padding-left: 20px;    
    }
    .form-control{
    	width: 600px;
    	margin-left: 20px;
    }
    .btn{
    	margin-left: 20px;
    }
</style>
</head>
<body>
	<div class="sidebar" id="sidebar">
		<div class="logo">
			<a href ="dashboard.jsp"><img src="../img/aa.png" alt="sample image"></a> 
		</div>
		
		<button class="toggle-btn" onclick="toggleSidebar()">
		<i class="fa-solid fa-bars"></i>
		</button>
		
		<nav>
			<a href="<%= request.getContextPath() %>/reg/customerDashboard" class="active" ><i class="fa-solid fa-taxi"></i><span>DashBoard</span></a>
			<a href="" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Booking History</span></a>
			<a href="Contact.jsp" class="active" ><i class="fa-solid fa-phone"></i><span>Customer Review</span></a>
			<a href="Contactdetails.jsp" class="active" style=background-color:#e2e8f0><i class="fa-solid fa-phone"></i><span>Contact</span></a>
			 <a href="<%= request.getContextPath() %>/reg/logout" class="logout"><i class="fa-solid fa-sign-out-alt"></i><span>Logout</span></a>
			
		</nav>
	</div>
	
	<div class="main-content">
		<div class="navbar">
			<h1>Mega City Cab Service</h1>
			<div class="user-info">
				<div class="profile">
					<div >
						<a class="avatar" href=""><i class="fa-solid fa-circle-user fa-3x ava" style="color: gray;"></i>
						<h2 class="name"> <%= customerName %>!</h2>
						</a>
    					
    					
					</div>
					
				</div>
			</div>
		</div>
	</div>


	<section id="contact">
      <div class="section-header">
        <h2>Contact Us</h2>
      </div>
      
      <!-- Display success and error messages -->
      <% if (request.getAttribute("contactSuccess") != null) { %>
        <div class="alert alert-success">
            <%= request.getAttribute("contactSuccess") %>
        </div>
      <% } %>
      
      <% if (request.getAttribute("contactError") != null) { %>
        <div class="alert alert-danger">
            <%= request.getAttribute("contactError") %>
        </div>
      <% } %>
      
      <p>If you have any questions or need assistance, please reach out to us!</p>
      <ul class="list-unstyled">
        <li><strong>Phone:</strong> +94 112223331</li>
        <li><strong>Email:</strong> info@cabservice.com</li>
        <li><strong>Address:</strong> Colombo, Srilanka</li>
      </ul>
      <form action="<%= request.getContextPath() %>/customer/submitContact" method="POST">
        <div class="mb-3">
          <label for="contactName" class="form-label">Your Name</label>
          <input type="text" class="form-control" id="contactName" name="contactName" placeholder="Enter your name" required>
        </div>
        <div class="mb-3">
          <label for="contactEmail" class="form-label">Email address</label>
          <input type="email" class="form-control" id="contactEmail" name="contactEmail" placeholder="name@example.com" required>
        </div>
        <div class="mb-3">
          <label for="contactMessage" class="form-label">Message</label>
          <textarea class="form-control" id="contactMessage" name="contactMessage" rows="3" placeholder="Your message..." required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Send Message</button>
      </form>
    </section>
    
    <script>
        function toggleSidebar() {
            document.getElementById("sidebar").classList.toggle("collapsed");
        }
    </script>
</body>
</html>