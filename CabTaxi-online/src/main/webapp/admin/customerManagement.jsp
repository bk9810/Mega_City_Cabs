<%@ page import="java.util.List, com.example.model.Customer" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		body {
    font-family: Arial, sans-serif;
     background-color: #f4f4f4;
    margin: 0;
    padding: 0;
   
    
}

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
.main-content{
padding-left: 500px;
}
.management{
	padding-left: 350px;
	
}
.management table{
	 border: 2px dashed blue;
}

.management th, td {
       	border: 1px dotted red;
    	padding: 8px;
    }
    
    button{
    	backgoround-color: blue;
    }
    
 .management a{
		
		text-decoration: none;
		color: black;
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
		
			<a href="admin_dashboard.jsp" class="active" ><i class="fa-solid fa-taxi"></i><span>Booking</span></a>
			<a href="customerManagement.jsp" class="active" style=background-color:#e2e8f0><i class="fa-solid fa-clock-rotate-left"></i><span>Customer Management</span></a>
			<a href="driverManagement.jsp" class="active"><i class="fa-solid fa-clock-rotate-left"></i><span>Driver Management</span></a>
			<a href="#" class="active"><i class="fa-solid fa-phone"></i><span>Contact</span></a>
			
			 <a href="<%= request.getContextPath() %>/reg/logout"><i class="fa-solid fa-sign-out-alt"></i><span>Logout</span></a>
			
		</nav>
	</div>
</div>

	 
    <div class="management">
    
    	<h1>Customer Management</h1>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "Bhanuka98@#10");
            stmt = conn.createStatement();
            String sql = "SELECT customer_id, name, email, phone, password, address, dob FROM register";
            rs = stmt.executeQuery(sql);

            if (!rs.isBeforeFirst()) { 
                out.println("<p>No customers found.</p>");
            } else {
                out.println("<table >");
                out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>DOB</th><th>Action</th></tr>");
                
                while (rs.next()) {
                	int customerId = rs.getInt("customer_id");
                    out.println("<tr>");
                    out.println("<td>" + customerId + "</td>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("<td>" + rs.getString("phone") + "</td>");
                    out.println("<td>" + rs.getString("address") + "</td>");
                    out.println("<td>" + rs.getString("dob") + "</td>");
                out.println("<td><button><a href='deleteCustomer.jsp?id=" + customerId + "' onclick='return confirm(\"Are you sure you want to delete this customer?\")'>Delete</a></button></td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error retrieving customers.</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
    </div>

    
</body>
</html>