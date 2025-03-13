<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String adminUser = (String) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect(request.getContextPath() + "/admin/admin_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        
        .
        
        
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
	margin-top: -40px;
}
.admin-profile{
	padding-left: 500px;
}
        
    </style>
</head>
<body>

    <div class="container">
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
        
        <div class="content">
            <p>This is the admin dashboard.</p>
            <a class="logout" href="<%= request.getContextPath() %>/admin/AdminLogout">Logout</a>
        </div>
        
        <div class="admin-profile">
    <img src="" alt="Admin Profile" width="100" height="100" style="border-radius: 50%;">
    <p>Welcome, Admin!</p>
</div>

<form action="UploadAdminImage" method="post" enctype="multipart/form-data">
    <label>Upload Profile Image:</label>
    <input type="file" name="profileImage" accept="image/*" required>
    <button type="submit">Upload</button>
</form>
    </div>
    
    
	

</body>
</html>