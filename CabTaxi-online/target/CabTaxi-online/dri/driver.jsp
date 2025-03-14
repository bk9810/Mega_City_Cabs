<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.example.model.Driver" %>  
 <%@ page import="java.io.File" %>
<%@ page import="javax.servlet.http.HttpSession" %>


<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("driver") == null) {
    	 response.sendRedirect(request.getContextPath() + "/dri/DriverLog.jsp");
        return;
    }
    Driver cdriv = (Driver) sessionUser.getAttribute("driver");
%>
    
    <%
    HttpSession sessionObj = request.getSession(false);
    String driverName = (sessionObj != null) ? (String) sessionObj.getAttribute("driverName") : null;
    
    String profileImagePath = (sessionObj != null) ? (String) sessionObj.getAttribute("profileImagePath") : "default-profile.png";

    if (driverName == null) {
        response.sendRedirect("DriverLog.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
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
    margin-top: -90px;
}

.sidebar .logo {
    display: flex;
    align-items: center;
    gap: 10px;
}
.logo img{
	width: 100px;
	margin-top:150px;
	margin-left: 80px;
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
.dashboards{
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	height: 650px;
	width: 500px;
	margin-top:-440px;
	margin-left: 390px;
}

.dashboard{
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	height: 800px;
	width: 700px;
	margin-top: 20px;
	margin-left: 500px;
	
	
}

.dashboard h1{
	display: flex;
	justify-content: center;
	align-items: center:
	
	
	
}

.dashboard h2{
	padding-left: 170px;
	font-size: 20px;
	margin-top: 40px;
}

.detail{
	padding-left: 170px;
	margin-top: 40px;
	font-size: 20px;
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
	
	float:right;
	background-color: 	black;
	color: white;
	cursor: pointer;
	padding-left: 430px;
	
}
.edits-btn{
	display: block;
	margin-top: -200px;
	margin-left: 520px;
	width: 150px;
	background-color: 	black;
	color: white;
	cursor: pointer;
}
.editss-btn{
	
	margin-left: 520px;
	width: 150px;
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
       margin-left: 300px; 
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
        background: black;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .save-btn:hover {
        background: #218838;
    }
    
    .ava {
    	width: 200px; 
    	height: 200px;
   
    padding-left: 50px;
    border-radius: 50%;
    
    width: 70px;
	}
	.name{
	display: block;
	margin-top: -120px;
}
.both{
	margin-top:-660px;
}
.logout{
	margin-top: 100px;
}
 .profile-card {
            width:100px;
            background: transparent;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            
        }
        .profile-pic {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #ccc;
            margin-left: 250px;
            margin-bottom: 100px;
            
        }
        .edit-btn {
            background: black;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }
        input[type="file"] {
            display: none;
        }
        
</style>
</head>
<body>
		<div class="sidebar" id="sidebar">
		<div class="logo">
			<a href="Login.jsp"><img src="../img/aa.png" alt="sample image"></a>
		</div>
		
		<button class="toggle-btn" onclick="toggleSidebar()">
		
		</button>
		
		<nav>
			<a href="#" class="active" style=background-color:#e2e8f0><i class="fa-solid fa-taxi"></i><span>DashBoard</span></a>
			<a href="driverBookings.jsp" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>BookingDetails</span></a>
			<a href="Vehicale.jsp" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Vehical</span></a>
			<a href="Contact.jsp" class="active"><i class="fa-solid fa-phone"></i><span>Contact</span></a>
			<a href="Contactdetails.jsp" class="active" ><i class="fa-solid fa-phone"></i><span>Contact</span></a>
			
			 <a href="<%= request.getContextPath() %>/dri/logout" class="logout"><i class="fa-solid fa-sign-out-alt "></i>Logout</a>
			<div class="both">
				<a class="avatar" ><i class="fa-solid fa-circle-user fa-3x ava" style="color: gray;"></i></a>
				<h2 class="name"><%= driverName %>!</h2>
			</div>
		</nav>
	</div>
	
	<div class="dashboard">
	<div >
    	<h1>Edit Profile Details</h1>
    	<div class="profile-card">
        <img src="<%= request.getContextPath() + "/" + profileImagePath %>" alt="Profile Image" class="profile-pic" id="profilePic">
        
        <!-- Image Upload Form -->
        <form id="uploadForm" action="<%= request.getContextPath() %>/uploadServlet" method="POST" enctype="multipart/form-data">
            <input type="file" id="fileInput" name="profileImage" accept="image/*">
            <button type="button" class="edits-btn" onclick="document.getElementById('fileInput').click();">Change Photo</button>
            <hr style="margin: 5px 0; border: 1px solid #ccc;">
            <button type="submit" class="editss-btn">Save</button>
        </form>
    </div>
	<div>
		<%
        
        Driver driver = (Driver) request.getAttribute("driver");
        if (driver != null) {
    %>
	<h1>User Details</h1>
    
    <h2>Name:<%= driver.getName() %> </h2>
    <div class="detail">
        <strong>Email:</strong> <%= driver.getEmail() %>
    </div>
    <div class="detail">
        <strong>Phone:</strong>  <%= driver.getPhone() %>
    </div>
    <div class="detail">
        <strong>Password:</strong> <%= driver.getPassword() %>
    </div>
    <div class="detail">
        <strong>Address:</strong> <%= driver.getAddress() %>
    </div>
    <div class="detail">
        <strong>DOB:</strong> <%= driver.getDob() %>
    </div>
    <div class="detail">
        <strong>NIC:</strong> <%= driver.getAddress() %>
    </div>
     <button class="edit-btn" onclick="openModal()">Edit Profile</button>
    </div>
    
    <% } else{ %> 
    	<p>Customer details not available.</p>
    <% } %>
	</div>
    
    </div>
    
    <!-- Display additional registration details as needed -->
     
        
    
    
   
    
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Edit Profile</h2>
            <form id="updateProfileForm" method="post">
            	<input type="hidden" id="driverId" name="customerId" value="<%= (driver != null) ? driver.getId() : "" %>">
                <div class="form-group">
                    <label>Full Name:</label>
                    <input type="text" id="name" name="name" value="<%= (driver != null && driver.getName() != null) ? driver.getName() : ""  %>" required>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" id="email" name="email"  value="<%= (driver != null && driver.getEmail() != null) ? driver.getEmail() : "" %>" required>
                </div>
                <div class="form-group">
                    <label>Phone:</label>
                    <input type="text" id="phone" name="phone" value="<%= (driver != null && driver.getPhone() != null) ? driver.getPhone() : "" %>" required>
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <input type="text" id="address" name="address" value="<%= (driver != null && driver.getAddress() != null) ? driver.getAddress() : "" %>"required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" id="password" name="password" value="<%= (driver != null && driver.getPassword() != null) ? driver.getPassword() : "" %>" required>
                </div>
                <div class="form-group">
                    <label>DOB:</label>
                    <input type="text" id="dob" name="dob" value="<%= (driver != null && driver.getPassword() != null) ? driver.getPassword() : "" %>" required>
                </div>
                <div class="form-group">
                    <label>NIC:</label>
                    <input type="text" id="nic" name="nic" value="<%= (driver != null && driver.getPassword() != null) ? driver.getPassword() : "" %>"  required>
                </div>
                <button type="submit" class="save-btn">Save Changes</button>
            </form>
        </div>
    </div>
    
    
    <script>
        document.getElementById('fileInput').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('profilePic').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
     <script>
        function openModal() {
            document.getElementById("editModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("editModal").style.display = "none";
        }

        $(document).ready(function() {
            $("#updateProfileForm").submit(function(event) {
                event.preventDefault();
                
                let formData = $(this).serialize();

                $.ajax({
                    type: "POST",
                    url: "updateProfile",
                    data: formData,
                    success: function(response) {
                          console.log("Response: " + response);
                          if(response === "success"){
                        	  alert("Profiile updated Successfully!");
                        	  location.reload();
                          } else {
                        	  alert("Error updating profile: " + response);
                          }
                    },
                    error: function(xhr, status, error) {
                    	 console.log("XHR: ", xhr);
                         console.log("Status: ", status);
                         console.log("Error: ", error);
                         alert("Error updating profile. Please try again.");
                    }
                });
            });
        });
    </script>
</body>
</html>