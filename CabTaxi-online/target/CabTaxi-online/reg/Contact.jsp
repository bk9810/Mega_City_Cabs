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
<title>Customer Contact</title>
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
    #reviews{margin-top: 120px;
    margin-bottom: 30px;
    	margin-left: 400px;
    	 background-color: white;
    	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    	width: 800px;
    	height:600px;
    }
    #reviews p{
    	padding-right: 100px;
    	float: left;
    }
    .desc h2{
    	padding-left: 600px;
    	
    }
    .desc p{
    	padding-left: 400px;
    	padding-right: 300px;
    }
    .review {
      background: #fff;
      border: 1px solid #ddd;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 5px;
      
    }
    /* Rating bar styles */
    .rating {
      direction: rtl;
      unicode-bidi: bidi-override;
      display: inline-block;
    }
    .rating input {
      display: none;
    }
    .rating label {
      font-size: 2em;
      color: #ddd;
      cursor: pointer;
    }
    .rating input:checked ~ label,
    .rating label:hover,
    .rating label:hover ~ label {
      color: gold;
    }
</style>
</head>
<body>
<div class="sidebar" id="sidebar">
		<div class="logo">
			<a href ="../dashboard.jsp"><img src="../img/aa.png" alt="sample image"></a> 
		</div>
		
		<button class="toggle-btn" onclick="toggleSidebar()">
		<i class="fa-solid fa-bars"></i>
		</button>
		
		<nav>
			<a href="<%= request.getContextPath() %>/reg/customerDashboard" class="active" ><i class="fa-solid fa-taxi"></i><span>DashBoard</span></a>
			<a href="" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Booking History</span></a>
			<a href="Contact.jsp" class="active" style=background-color:#e2e8f0><i class="fa-solid fa-phone"></i><span>Customer Review</span></a>
			<a href="Contactdetails.jsp" class="active" ><i class="fa-solid fa-phone"></i><span>Contact</span></a>
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


	
	
	<div class= "desc">
		<h2>Customer Reviews</h2>
		<p>welcome to our Reviews area, where our clients provide candid comments and firsthand accounts of their interactions with our taxi service.  Stories and testimonies that demonstrate our dedication to professionalism, timeliness, and a comfortable trip each and every time can be found here.  We value your opinion and encourage you to read these evaluations to see how we work to ensure that every trip is stress-free and safe.  In addition to helping us do better, your input also helps potential clients make wise choices.  We would be delighted to hear about your personal experience if you have been pleased with our service!</p>
	</div>
	<section id="reviews">
      <div class="section-header">
        <h2>Customer Reviews</h2>
        
      </div>
        
    
      <form action="ReviewServlet" method="Post">
        <div class="mb-3">
          <label for="reviewName" class="form-label">Name</label>
          <input type="text" class="form-control" id="reviewName" name="name" placeholder="Your name">
        </div>
        <div class="mb-3">
          <label for="reviewEmail" class="form-label">Email</label>
          <input type="email" class="form-control" id="reviewEmail" name="email" placeholder="name@example.com">
        </div>
        <div class="mb-3">
          <label class="form-label">Rating</label>
          <div class="rating">
            <input type="radio" name="rating" id="star5" value="5">
            <label for="star5" title="5 stars">&#9733;</label>
            <input type="radio" name="rating" id="star4" value="4">
            <label for="star4" title="4 stars">&#9733;</label>
            <input type="radio" name="rating" id="star3" value="3">
            <label for="star3" title="3 stars">&#9733;</label>
            <input type="radio" name="rating" id="star2" value="2">
            <label for="star2" title="2 stars">&#9733;</label>
            <input type="radio" name="rating" id="star1" value="1">
            <label for="star1" title="1 star">&#9733;</label>
          </div>
        </div>
        <div class="mb-3">
          <label for="reviewText" class="form-label">Review</label>
          <textarea class="form-control" id="reviewText" name="reviewText" rows="3" placeholder="Share your experience..."></textarea>
        </div>
        <button type="submit" class="btn btn-success">Submit Review</button>
      </form>
       <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionFactory.getConnection();
            String sql = "SELECT name, rating, review_text, created_at FROM customer_reviews ORDER BY created_at DESC";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
    %>
            
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <p>Error loading reviews.</p>
    <%
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
     </section>
</body>
</html>