<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.example.model.Driver" %>

<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("driver") == null) {
        response.sendRedirect(request.getContextPath() + "/dri/DriverLog.jsp");
        return;
    }
    Driver cdriv = (Driver) sessionUser.getAttribute("driver");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Driver Bookings</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Available Bookings</h2>
        
        <!-- Debug Information -->
        <div class="alert alert-info">
            <strong>Debug Information:</strong>
            <p>Pending Bookings Size: ${empty pendingBookings ? 'No bookings found' : pendingBookings.size()}</p>
            <c:if test="${not empty debugMessage}">
                <p>Debug Message: ${debugMessage}</p>
            </c:if>
        </div>
        
        <!-- Error message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h4>Pending Bookings</h4>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${empty pendingBookings}">
                        <div class="alert alert-info">
                            No pending bookings available at the moment.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th>Distance (km)</th>
                                    <th>Fare (Rs.)</th>
                                    <th>Booking Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="booking" items="${pendingBookings}">
                                    <tr>
                                        <td>${booking.id}</td>
                                        <td>${requestScope['pickupLocation_' + booking.id]}</td>
                                        <td>${requestScope['dropLocation_' + booking.id]}</td>
                                        <td><fmt:formatNumber value="${booking.distanceKm}" pattern="#,##0.00" /></td>
                                        <td><fmt:formatNumber value="${booking.totalAmount}" pattern="#,##0.00" /></td>
                                        <td><fmt:formatDate value="${booking.bookingDate}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                                        <td><span class="badge badge-warning">${booking.status}</span></td>
                                        <td>
                                            <form method="post" action="${pageContext.request.contextPath}/dri/bookings">
                                                <input type="hidden" name="action" value="confirmBooking">
                                                <input type="hidden" name="bookingId" value="${booking.id}">
                                                <button type="submit" class="btn btn-success btn-sm">Confirm</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>