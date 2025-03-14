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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service | Profile</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Header/Navbar Styles */
        .header {
            background: linear-gradient(135deg, #192a56 0%, #273c75 100%);
            color: #fff;
            padding: 15px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            gap: 20px;
        }
        
        .nav-links a {
            color: #fff;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        
        .nav-links a:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .logout-btn {
            background-color: #e74c3c;
            padding: 8px 15px;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            border: none;
            transition: all 0.3s ease;
        }
        
        .logout-btn:hover {
            background-color: #c0392b;
        }
        
        /* Profile Section */
        .profile-section {
            background: linear-gradient(to right, #eef2f3, #8e9eab);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
            padding: 30px;
            max-width: 950px;
            transition: transform 0.3s ease;
            display: flex;
            align-items: center;
            gap: 30px;
        }
        
        .profile-section:hover {
            transform: translateY(-5px);
        }
        
        .profile-avatar {
            position: relative;
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #273c75;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 60px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .profile-avatar:hover {
            transform: scale(1.05);
        }
        
        .profile-info {
            flex: 1;
        }
        
        .welcome-text {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #273c75;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        
        .sub-text {
            color: #444;
            font-size: 16px;
        }
        
        /* Dashboard Section */
        .dashboard-section {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin: 40px auto;
            max-width: 800px;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .dashboard-section:hover {
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        
        .dashboard-header {
            background: linear-gradient(135deg, #273c75 0%, #192a56 100%);
            color: white;
            padding: 25px 30px;
            text-align: center;
            font-size: 24px;
            font-weight: 600;
        }
        
        .dashboard-body {
            padding: 30px;
        }
        
        .user-detail {
            margin-bottom: 25px;
            border-left: 3px solid #273c75;
            padding-left: 15px;
        }
        
        .user-detail-label {
            font-weight: 600;
            color: #555;
            font-size: 16px;
            margin-bottom: 5px;
        }
        
        .user-detail-value {
            color: #333;
            font-size: 18px;
        }
        
        .password-field {
            filter: blur(5px);
            transition: all 0.3s ease;
        }
        
        .password-field:hover {
            filter: blur(0);
        }
        
        /* Button Styles */
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
        }
        
        .btn {
            padding: 12px 25px;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            border: none;
            transition: all 0.3s ease;
            font-size: 16px;
        }
        
        .btn-primary {
            background-color: #273c75;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #192a56;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        }
        
        .btn-secondary {
            background-color: #f1f2f6;
            color: #333;
            border: 1px solid #ddd;
        }
        
        .btn-secondary:hover {
            background-color: #dfe4ea;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1050;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            overflow: auto;
            animation: fadeIn 0.3s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            width: 500px;
            border-radius: 10px;
            box-shadow: 0 10px 50px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            animation: slideIn 0.4s ease;
        }
        
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        .modal-header {
            background: linear-gradient(135deg, #273c75 0%, #192a56 100%);
            color: white;
            padding: 20px;
            position: relative;
        }
        
        .modal-title {
            font-size: 22px;
            font-weight: 600;
            margin: 0;
        }
        
        .close {
            position: absolute;
            right: 20px;
            top: 20px;
            color: white;
            font-size: 24px;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .close:hover {
            transform: scale(1.1);
        }
        
        .modal-body {
            padding: 25px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            font-weight: 600;
            color: #444;
            margin-bottom: 8px;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            font-size: 16px;
            border: 1px solid #dfe4ea;
            border-radius: 6px;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: #273c75;
            box-shadow: 0 0 0 3px rgba(39, 60, 117, 0.2);
            outline: none;
        }
        
        .modal-footer {
            padding: 15px 25px 25px;
            text-align: right;
        }
        
        .save-btn {
            background-color: #273c75;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .save-btn:hover {
            background-color: #192a56;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-section {
                flex-direction: column;
                text-align: center;
                padding: 20px;
            }
            
            .welcome-text {
                font-size: 26px;
            }
            
            .modal-content {
                width: 90%;
            }
            
            .button-group {
                flex-direction: column;
                gap: 15px;
            }
            
            .btn {
                width: 100%;
                text-align: center;
            }
        }
        
        /* Animation Classes */
        .animate-fade {
            animation: fadeInAnimation 0.5s ease-in;
        }
        
        @keyframes fadeInAnimation {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }
        
        .animate-slide-up {
            animation: slideUpAnimation 0.5s ease;
        }
        
        @keyframes slideUpAnimation {
            0% { transform: translateY(20px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>
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
    
    <!-- Header/Navbar -->
    <header class="header">
        <div class="header-content">
            <a href="#" class="logo">
                <i class="fas fa-taxi"></i> Mega City Cab
            </a>
            
        </div>
    </header>
    
    <!-- Main Content -->
    <div class="container">
        <!-- Profile Section -->
        <div class="profile-section animate-fade">
            <div class="profile-avatar">
                <i class="fa-solid fa-user"></i>
            </div>
            <div class="profile-info">
                <h1 class="welcome-text">Welcome, <%= customerName %>!</h1>
                <p class="sub-text">Manage your profile and account settings</p>
            </div>
        </div>
        
        <!-- Dashboard Section -->
        <div class="dashboard-section animate-slide-up">
            <div class="dashboard-header">
                <i class="fas fa-id-card"></i> User Profile Details
            </div>
            <div class="dashboard-body">
                <%
                // Retrieve the customer object passed as a request attribute
                Customer customer = (Customer) request.getAttribute("customer");
                if (customer != null) {
                %>
                <div class="user-detail">
                    <div class="user-detail-label">Full Name</div>
                    <div class="user-detail-value"><%= customer.getName() %></div>
                </div>
                <div class="user-detail">
                    <div class="user-detail-label">Email Address</div>
                    <div class="user-detail-value"><%= customer.getEmail() %></div>
                </div>
                <div class="user-detail">
                    <div class="user-detail-label">Phone Number</div>
                    <div class="user-detail-value"><%= customer.getPhone() %></div>
                </div>
                <div class="user-detail">
                    <div class="user-detail-label">Password</div>
                    <div class="user-detail-value password-field"><%= customer.getPassword() %></div>
                    <small>(Hover to reveal)</small>
                </div>
                <div class="user-detail">
                    <div class="user-detail-label">Address</div>
                    <div class="user-detail-value"><%= customer.getAddress() %></div>
                </div>
                
                <div class="button-group">
                    <a href="customerDashboard" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                    <button class="btn btn-primary" onclick="openModal()">
                        <i class="fas fa-edit"></i> Edit Profile
                    </button>
                </div>
                <% } else { %>
                <div class="no-data">
                    <p>Customer details not available.</p>
                    <a href="customerDashboard" class="btn btn-secondary">Back to Dashboard</a>
                </div>
                <% } %>
            </div>
        </div>
    </div>
    
    <!-- Edit Profile Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title"><i class="fas fa-user-edit"></i> Edit Profile</h2>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>
            <div class="modal-body">
                <form id="updateProfileForm" method="post">
                    <input type="hidden" id="customerId" name="customerId" value="<%= (customer != null) ? customer.getId() : "" %>">
                    
                    <div class="form-group">
                        <label class="form-label">Full Name</label>
                        <input type="text" id="name" name="name" class="form-control" value="<%= (customer != null && customer.getName() != null) ? customer.getName() : ""  %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control" value="<%= (customer != null && customer.getEmail() != null) ? customer.getEmail() : "" %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Phone Number</label>
                        <input type="text" id="phone" name="phone" class="form-control" value="<%= (customer != null && customer.getPhone() != null) ? customer.getPhone() : "" %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Address</label>
                        <input type="text" id="address" name="address" class="form-control" value="<%= (customer != null && customer.getAddress() != null) ? customer.getAddress() : "" %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Password</label>
                        <input type="password" id="password" name="password" class="form-control" value="<%= (customer != null && customer.getPassword() != null) ? customer.getPassword() : "" %>" required>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="submit" class="save-btn">
                            <i class="fas fa-save"></i> Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Scripts -->
    <script>
        function openModal() {
            document.getElementById("editModal").style.display = "block";
            document.body.style.overflow = "hidden"; // Prevent scrolling when modal is open
        }

        function closeModal() {
            document.getElementById("editModal").style.display = "none";
            document.body.style.overflow = "auto"; // Enable scrolling when modal is closed
        }

        // Close modal when clicking outside of it
        window.onclick = function(event) {
            let modal = document.getElementById("editModal");
            if (event.target == modal) {
                closeModal();
            }
        }

        $(document).ready(function() {
            // Add animation class to elements as they scroll into view
            $(window).scroll(function() {
                $('.dashboard-section').each(function() {
                    let bottom_of_object = $(this).offset().top + $(this).outerHeight();
                    let bottom_of_window = $(window).scrollTop() + $(window).height();
                    
                    if (bottom_of_window > bottom_of_object) {
                        $(this).addClass('animate-slide-up');
                    }
                });
            });
            
            // Form submission handling
            $("#updateProfileForm").submit(function(event) {
                event.preventDefault();
                
                let formData = $(this).serialize();
                
                // Show loading indicator
                let saveBtn = $(this).find('.save-btn');
                let originalText = saveBtn.html();
                saveBtn.html('<i class="fas fa-spinner fa-spin"></i> Saving...');
                saveBtn.prop('disabled', true);

                $.ajax({
                    type: "POST",
                    url: "updateProfile",
                    data: formData,
                    success: function(response) {
                        console.log("Response: " + response);
                        saveBtn.html(originalText);
                        saveBtn.prop('disabled', false);
                        
                        if(response === "success"){
                            // Show success message with animation
                            closeModal();
                            
                            // Create toast notification
                            let toast = document.createElement('div');
                            toast.style.position = 'fixed';
                            toast.style.bottom = '20px';
                            toast.style.right = '20px';
                            toast.style.backgroundColor = '#2ecc71';
                            toast.style.color = 'white';
                            toast.style.padding = '15px 25px';
                            toast.style.borderRadius = '5px';
                            toast.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.15)';
                            toast.style.zIndex = '9999';
                            toast.innerHTML = '<i class="fas fa-check-circle"></i> Profile updated successfully!';
                            toast.className = 'animate_animated animate_fadeInUp';
                            
                            document.body.appendChild(toast);
                            
                            // Remove toast after 3 seconds
                            setTimeout(function() {
                                toast.className = 'animate_animated animate_fadeOutDown';
                                setTimeout(function() {
                                    document.body.removeChild(toast);
                                }, 1000);
                            }, 3000);
                            
                            // Reload page after short delay
                            setTimeout(function() {
                                location.reload();
                            }, 1000);
                        } else {
                            alert("Error updating profile: " + response);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("XHR: ", xhr);
                        console.log("Status: ", status);
                        console.log("Error: ", error);
                        alert("Error updating profile. Please try again.");
                        
                        saveBtn.html(originalText);
                        saveBtn.prop('disabled', false);
                    }
                });
            });
        });
    </script>
</body>
</html>