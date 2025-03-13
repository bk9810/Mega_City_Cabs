<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="card">
            <div class="card-header bg-success text-white">
                <h2>Booking Confirmed!</h2>
            </div>
            <div class="card-body">
                <h4>Booking Details</h4>
                <p><strong>Booking ID:</strong> ${booking.id}</p>
                <p><strong>From:</strong> ${pickupLocation}</p>
                <p><strong>To:</strong> ${dropLocation}</p>
                <p><strong>Distance:</strong> <fmt:formatNumber value="${booking.distanceKm}" pattern="#,##0.00"/> km</p>
                <p><strong>Fare:</strong> Rs. <fmt:formatNumber value="${booking.totalAmount}" pattern="#,##0.00"/></p>
                <p><strong>Booking Date:</strong> <fmt:formatDate value="${booking.bookingDate}" pattern="dd-MM-yyyy HH:mm:ss"/></p>
                
                <div class="mt-4">
                    <a href="${pageContext.request.contextPath}/reg/booking" class="btn btn-primary">Make Another Booking</a>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>