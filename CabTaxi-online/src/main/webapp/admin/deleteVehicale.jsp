<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    String id = request.getParameter("id");

    if (id != null && !id.isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "Bhanuka98@#10");

            String sql = "DELETE FROM vehicles WHERE vehicle_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("driverManagement.jsp"); 
            } else {
                out.println("<p>Error: Unable to delete vehicale.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error deleting vehicale.</p>");
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    } else {
        out.println("<p>Invalid vehicale ID.</p>");
    }
%>
</body>
</html>