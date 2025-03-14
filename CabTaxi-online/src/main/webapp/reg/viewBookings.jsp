<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>My Bookings</h2>
        
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h4>Booking History</h4>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${empty customerBookings}">
                        <div class="alert alert-info">
                            You don't have any bookings yet. <a href="${pageContext.request.contextPath}/reg/booking" class="alert-link">Make a booking</a> now!
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Booking ID</th>
                                        <th>From</th>
                                        <th>To</th>
                                        <th>Distance (km)</th>
                                        <th>Fare (Rs.)</th>
                                        <th>Booking Date</th>
                                        <th>Status</th>
                                        <th>Full Bill</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="booking" items="${customerBookings}">
                                        <tr>
                                            <td>${booking.id}</td>
                                            <td>${bookingLocations[booking.id].pickup}</td>
                                            <td>${bookingLocations[booking.id].drop}</td>
                                            <td><fmt:formatNumber value="${booking.distanceKm}" pattern="#,##0.00"/></td>
                                            <td><fmt:formatNumber value="${booking.totalAmount}" pattern="#,##0.00"/></td>
                                            <td><fmt:formatDate value="${booking.bookingDate}" pattern="dd-MM-yyyy HH:mm:ss"/></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${booking.status eq 'Pending'}">
                                                        <span class="badge badge-warning">Pending</span>
                                                    </c:when>
                                                    <c:when test="${booking.status eq 'Confirmed'}">
                                                        <span class="badge badge-success">Confirmed</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-secondary">${booking.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${booking.status eq 'Confirmed'}">
                                                        <a href="${pageContext.request.contextPath}/reg/viewBill?bookingId=${booking.id}" class="btn btn-primary btn-sm">
                                                            <i class="fas fa-file-invoice"></i> View Bill
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-secondary btn-sm" disabled>
                                                            <i class="fas fa-file-invoice"></i> View Bill
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <div class="mt-3">
            <a href="${pageContext.request.contextPath}/reg/booking" class="btn btn-primary">Make New Booking</a>
            <a href="${pageContext.request.contextPath}/reg/dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>