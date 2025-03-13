<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="com.example.dao.DBConnectionFactory" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.head{
		margin-top: 300px;
		width: 400px;
		padding-left: 400px;
	}
	.review {
      background: #fff;
      border: 1px solid #ddd;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 5px;
      margin-top: 40px;
    }
     .review-card {
        border: 1px solid #ddd;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
    }
</style>
</head>
<body>
	<div class="mt-4 head">
	
    <<section id="reviews">
    <div class="section-header">
        <h2>Customer Reviews</h2>
    </div>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionFactory.getConnection(); // Get DB Connection
            String sql = "SELECT name, rating, review_text, created_at FROM customer_reviews ORDER BY created_at DESC LIMIT 5";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
    %>
                <div class="review">
                    <h4><%= rs.getString("name") %> - <%= rs.getInt("rating") %> ⭐</h4>
                    <p><%= rs.getString("review_text") %></p>
                    <small><%= rs.getTimestamp("created_at") %></small>
                </div>
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
</div>
</body>
</html>