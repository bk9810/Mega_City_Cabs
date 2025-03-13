<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
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
.main-content{
padding-left: 500px;
}
.management{
	padding-left: 380px;
}
.vehicales{
padding-left: 380px;
}
</style>
</head>
<body>
	<body>
	<div class="container">
        <div class="sidebar" id="sidebar">
        <h1>Mega City Cab Service</h1>
		<div class="logo">
			<img src="../img/aa.png" alt="sample image">
		</div>
		
		
		<nav>
		
			<a href="dashboard.jsp" class="active" ><i class="fa-solid fa-taxi"></i><span>Booking</span></a>
			<a href="customerManagement.jsp" class="active" ><i class="fa-solid fa-clock-rotate-left"></i><span>Customer Management</span></a>
			<a href="customerManagement.jsp" class="active" style=background-color:#e2e8f0><i class="fa-solid fa-clock-rotate-left"></i><span>Driver Management</span></a>
			<a href="#" class="active"><i class="fa-solid fa-phone"></i><span>Contact</span></a>
			
			 <a href="<%= request.getContextPath() %>/reg/logout"><i class="fa-solid fa-sign-out-alt"></i><span>Logout</span></a>
			
		</nav>
	</div>
</div>

<div class="management">

	<h1>Driver Management</h1>
	<%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "Bhanuka98@#10");
            stmt = conn.createStatement();
            String sql = "SELECT driver_id, name, email, phone, password, address, licened, dob, nic FROM driver";
            rs = stmt.executeQuery(sql);

            if (!rs.isBeforeFirst()) { // No customers found
                out.println("<p>No driver found.</p>");
            } else {
                out.println("<table >");
                out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>Licened</th><th>DOB</th><th>NIC</th><th>Action</th></tr>");
                
                while (rs.next()) {
                	int driverId = rs.getInt("driver_id");
                    out.println("<tr>");
                    out.println("<td>" + driverId + "</td>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("<td>" + rs.getString("phone") + "</td>");
                    out.println("<td>" + rs.getString("address") + "</td>");
                    out.println("<td>" + rs.getString("licened") + "</td>");
                    out.println("<td>" + rs.getString("dob") + "</td>");
                    out.println("<td>" + rs.getString("nic") + "</td>");
                    out.println("<td><button><a href='deleteDriver.jsp?id=" + driverId + "' onclick='return confirm(\"Are you sure you want to delete this driver?\")'>Delete</a></button></td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error retrieving driver.</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>

</div>

<div class="vehicales">

	<h1>Driver Management</h1>
	<%
       
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "Bhanuka98@#10");
            stmt = conn.createStatement();
            String sql = "SELECT vehicle_id, registration_number, plate_number, cab_type, seating_capacity, fuel_type, manufacturing_year, driver_id FROM vehicles";
            rs = stmt.executeQuery(sql);

            if (!rs.isBeforeFirst()) { // No customers found
                out.println("<p>No Vehicale Details found.</p>");
            } else {
                out.println("<table >");
                out.println("<tr><th>ID</th><th>Register Number</th><th>Plate Number</th><th>Cab Type</th><th>seat detail</th><th>fuel type</th><th>manufacturing year</th><th>driverId</th><th>Action</th></tr>");
                
                while (rs.next()) {
                	int vehicaleId = rs.getInt("vehicle_id");
                    out.println("<tr>");
                    out.println("<td>" + vehicaleId + "</td>");
                    out.println("<td>" + rs.getString("registration_number") + "</td>");
                    out.println("<td>" + rs.getString("plate_number") + "</td>");
                    out.println("<td>" + rs.getString("cab_type") + "</td>");
                    out.println("<td>" + rs.getString("seating_capacity") + "</td>");
                    out.println("<td>" + rs.getString("fuel_type") + "</td>");
                    out.println("<td>" + rs.getString("manufacturing_year") + "</td>");
                    out.println("<td>" + rs.getString("driver_id") + "</td>");
                    out.println("<td><button><a href='deleteVehicale.jsp?id=" + vehicaleId + "' onclick='return confirm(\"Are you sure you want to delete this driver?\")'>Delete</a></button></td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error retrieving driver.</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>

</div>
	
</body>
</html>