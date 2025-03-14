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
:root {
  --primary-color: #3498db;
  --secondary-color: #2c3e50;
  --accent-color: #e74c3c;
  --light-color: #ecf0f1;
  --dark-color: #34495e;
  --success-color: #2ecc71;
  --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  --transition: all 0.3s ease;
}

body {
  font-family: 'Poppins', sans-serif;
  background-color: #f9fafb;
  margin: 0;
  padding: 0;
  color: #333;
  overflow-x: hidden;
}

/* Sidebar */
.sidebar {
  width: 280px;
  background: var(--secondary-color);
  height: 100vh;
  padding: 0;
  box-shadow: var(--shadow);
  position: fixed;
  transition: var(--transition);
  z-index: 100;
  margin-top: 0;
  color: white;
}

.sidebar .logo {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px 0;
  background-color: rgba(255, 255, 255, 0.05);
  margin-bottom: 30px;
}

.logo img {
  width: 120px;
  margin: 0;
  transition: var(--transition);
  filter: brightness(1.1);
}

.sidebar-title {
  font-size: 22px;
  font-weight: bold;
  color: white;
  text-align: center;
  margin-bottom: 20px;
}

.toggle-btn {
  background: none;
  border: none;
  font-size: 24px;
  cursor: pointer;
  color: white;
  position: absolute;
  right: 20px;
  top: 20px;
  transition: var(--transition);
}

.toggle-btn:hover {
  transform: scale(1.1);
}

nav {
  display: flex;
  flex-direction: column;
  margin-top: 20px;
}

nav a {
  display: flex;
  align-items: center;
  gap: 15px;
  text-decoration: none;
  color: rgba(255, 255, 255, 0.8);
  font-size: 16px;
  padding: 15px 25px;
  border-radius: 0;
  transition: var(--transition);
  position: relative;
  margin-bottom: 5px;
}

nav a i {
  font-size: 18px;
  width: 20px;
  text-align: center;
}

nav a:hover, nav a.active {
  color: white;
  background-color: rgba(255, 255, 255, 0.1);
  padding-left: 30px;
  margin-top: 0;
}

nav a.active::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 4px;
  background-color: var(--primary-color);
}

.sidebar.collapsed {
  width: 80px;
}

.sidebar.collapsed .sidebar-title,
.sidebar.collapsed span,
.sidebar.collapsed .both h2 {
  display: none;
}

.sidebar.collapsed .logo img {
  width: 40px;
}

.sidebar.collapsed nav a {
  justify-content: center;
  padding: 15px;
}

.sidebar.collapsed nav a i {
  font-size: 20px;
}


.both {
  margin-top: 30px;
  padding: 15px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  text-align: center;
}

.avatar i.ava {
  color: white;
  font-size: 50px;
  margin-bottom: 10px;
}

.name {
  font-weight: 500;
  font-size: 16px;
  color: white;
  margin: 10px 0;
  display: block;
}

.logout {
  margin-top: auto;
  color: var(--light-color);
  font-weight: 500;
  margin-top: 40px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.logout i {
  color: var(--accent-color);
}


.dashboard {
  background: white;
  border-radius: 12px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  padding: 30px;
  margin: 30px;
  margin-left: 310px;
  transition: var(--transition);
  position: relative;
  min-height: 80vh;
  width: auto;
  max-width: 1000px;
}

.sidebar.collapsed ~ .dashboard {
  margin-left: 110px;
}

.dashboard h1 {
  color: var(--secondary-color);
  font-size: 28px;
  margin-bottom: 40px;
  padding-bottom: 15px;
  border-bottom: 2px solid #f0f0f0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.dashboard h1::after {
  content: '';
  display: block;
  width: 70px;
  height: 3px;
  background-color: var(--primary-color);
  position: absolute;
  top: 67px;
  left: 50%;
  transform: translateX(-50%);
}

.dashboard h2 {
  color: var(--dark-color);
  font-size: 20px;
  margin-bottom: 10px;
  font-weight: 600;
  display: flex;
  align-items: center;
  margin-left: 0;
  padding-left: 0;
}

.dashboard h2 i {
  margin-right: 10px;
  color: var(--primary-color);
}


.detail-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
  margin-top: 30px;
}

.detail {
  background-color: #f8f9fa;
  border-radius: 8px;
  padding: 15px 20px;
  margin-top: 0;
  font-size: 16px;
  display: flex;
  align-items: center;
  transition: var(--transition);
  border-left: 3px solid var(--primary-color);
}

.detail:hover {
  transform: translateY(-3px);
  box-shadow: var(--shadow);
}

.detail strong {
  font-weight: 600;
  color: var(--dark-color);
  margin-right: 10px;
  min-width: 80px;
}


.profile-card {
  background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
  color: white;
  padding: 30px;
  border-radius: 12px;
  text-align: center;
  margin-bottom: 30px;
}

.profile-pic {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  object-fit: cover;
  border: 4px solid white;
  margin: 0 auto;
  margin-bottom: 20px;
  display: block;
  box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
}

.profile-upload-btn {
  background-color: rgba(255, 255, 255, 0.2);
  color: white;
  border: none;
  padding: 8px 15px;
  border-radius: 20px;
  cursor: pointer;
  font-size: 14px;
  transition: var(--transition);
  display: inline-flex;
  align-items: center;
  margin-top: 10px;
}

.profile-upload-btn i {
  margin-right: 5px;
}

.profile-upload-btn:hover {
  background-color: rgba(255, 255, 255, 0.3);
}

input[type="file"] {
  display: none;
}


.edit-btn {
  background-color: var(--primary-color);
  color: white;
  border: none;
  padding: 12px 25px;
  border-radius: 50px;
  font-weight: 600;
  cursor: pointer;
  transition: var(--transition);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  position: absolute;
  right: 30px;
  bottom: 30px;
  box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
}

.edit-btn i {
  font-size: 16px;
}

.edit-btn:hover {
  background-color: #2980b9;
  transform: translateY(-2px);
  box-shadow: 0 6px 18px rgba(52, 152, 219, 0.4);
}


.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.6);
  backdrop-filter: blur(4px);
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
  width: 50%;
  max-width: 600px;
  border-radius: 15px;
  box-shadow: 0 15px 30px rgba(0,0,0,0.2);
  transform: translateY(-20px);
  transition: transform 0.3s ease;
}

.modal.show .modal-content {
  transform: translateY(0);
}

.close {
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
  color: #aaa;
  transition: var(--transition);
}

.close:hover {
  color: var(--accent-color);
}

.modal h2 {
  color: var(--secondary-color);
  text-align: center;
  margin-bottom: 25px;
  padding-bottom: 15px;
  border-bottom: 1px solid #eee;
}

/* Form */
.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 500;
  color: var(--dark-color);
}

.form-group input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 8px;
  transition: var(--transition);
  font-family: inherit;
}

.form-group input:focus {
  border-color: var(--primary-color);
  box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
  outline: none;
}

.save-btn {
  background: var(--primary-color);
  color: white;
  padding: 12px 25px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
  transition: var(--transition);
  display: block;
  width: 100%;
  margin-top: 10px;
  font-size: 16px;
}

.save-btn:hover {
  background: #2980b9;
  transform: translateY(-2px);
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}


@media (max-width: 992px) {
  .sidebar {
    width: 70px;
  }
  
  .sidebar .logo img {
    width: 40px;
  }
  
  .sidebar span,
  .sidebar .both h2,
  .sidebar-title {
    display: none;
  }
  
  .sidebar nav a {
    justify-content: center;
    padding: 15px;
  }
  
  .dashboard {
    margin-left: 90px;
    width: calc(100% - 120px);
  }
  
  .modal-content {
    width: 80%;
  }
  
}

@media (max-width: 768px) {
  .detail-container {
    grid-template-columns: 1fr;
  }
  
  .dashboard {
    padding: 20px;
    margin: 15px;
    margin-left: 90px;
  }
  
  .edit-btn {
    position: relative;
    right: auto;
    bottom: auto;
    margin-top: 20px;
    width: 100%;
  } 
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