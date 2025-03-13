<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.example.model.Customer" %>  
 <%@ page import="java.io.File" %>
<%@ page import="javax.servlet.http.HttpSession" %>
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
<title>Mega city Cab service</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.profile{
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
	height: 150px;
	margin-top:10px;
	
}
.ava{
		padding-left: 100px;
		margin-top: 30px;
		
	}
 .profile h2{
padding-left: 230px;
margin-top: -100px;
font-size: 50px;
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
	<div>
		<%
		HttpSession sessionUser = request.getSession(false);

	    // Retrieve the customer object from session
	    Customer custom = (sessionUser != null) ? (Customer) sessionUser.getAttribute("customer") : null;

	    // If customer is null, redirect to login page
	    if (custom == null) {
	        response.sendRedirect("Login.jsp");  // Redirect to login page if not logged in
	        return;
	    }

	    // Get profile image, use default if null
	    String profileImage = (String) sessionUser.getAttribute("profileImage");
	    if (profileImage == null || profileImage.isEmpty()) {
	        profileImage = "img";
	    }
%>
		<img id="profilePreview" src="<%= profileImage %>" alt="Profile Image">

        <!-- Profile Image Upload Form -->
        <form action="customerProfile" method="post" enctype="multipart/form-data">
            <input type="file" name="profileImage" id="fileInput" accept="image/*" required>
            <button type="submit">Upload Image</button>
        </form>
	</div>
	<div class="profile">
		<i class="fa-solid fa-circle-user fa-6x ava" style="color: gray;"></i>
		<h2 class="name">Welcome, <%= customerName %>!</h2>
		
	</div>
	
	<div class="dashboard">
	<h1>User Details</h1>
    <%
        // Retrieve the customer object passed as a request attribute
        Customer customer = (Customer) request.getAttribute("customer");
        if (customer != null) {
    %>
    <h2>Name: <%= customer.getName() %></h2>
    <div class="detail">
        <strong>Email:</strong> <%= customer.getEmail() %>
    </div>
    <div class="detail">
        <strong>Phone:</strong> <%= customer.getPhone() %>
    </div>
    <div class="detail">
        <strong>Password:</strong> <%= customer.getPassword() %>
    </div>
    <div class="detail">
        <strong>Address:</strong> <%= customer.getAddress() %>
    </div>
     <button class="edit-btn" onclick="openModal()">Edit Profile</button>
    
    
    <!-- Display additional registration details as needed -->
    <% } else { %>
        <p>Customer details not available.</p>
    <% } %>
    
    <button class="btn"><a href="customerDashboard" >Back to Dashboard</a></button>
    
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Edit Profile</h2>
            <form id="updateProfileForm" method="post">
            	<input type="hidden" id="customerId" name="customerId" value="<%= (customer != null) ? customer.getId() : "" %>">
                <div class="form-group">
                    <label>Full Name:</label>
                    <input type="text" id="name" name="name" value="<%= (customer != null && customer.getName() != null) ? customer.getName() : ""  %>" required>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" id="email" name="email" value="<%= (customer != null && customer.getEmail() != null) ? customer.getEmail() : "" %>" required>
                </div>
                <div class="form-group">
                    <label>Phone:</label>
                    <input type="text" id="phone" name="phone" value="<%= (customer != null && customer.getPhone() != null) ? customer.getPhone() : "" %>" required>
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <input type="text" id="address" name="address" value="<%= (customer != null && customer.getAddress() != null) ? customer.getAddress() : "" %>" required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" id="password" name="password" value="<%= (customer != null && customer.getPassword() != null) ? customer.getPassword() : "" %>" required>
                </div>
                <button type="submit" class="save-btn">Save Changes</button>
            </form>
        </div>
    </div>
    
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
     <script>
        document.getElementById('fileInput').addEventListener('change', function(event) {
            let reader = new FileReader();
            reader.onload = function() {
                let output = document.getElementById('profilePreview');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        });
    </script>
    
</div>




 	
</body>
</html>