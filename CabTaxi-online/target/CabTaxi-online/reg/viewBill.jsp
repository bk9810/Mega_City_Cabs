<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Bill</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        .bill-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .bill-header {
            border-bottom: 2px solid #eee;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .bill-title {
            color: #333;
            font-weight: bold;
        }
        .bill-details {
            margin-bottom: 30px;
        }
        .bill-table {
            margin-bottom: 30px;
        }
        .bill-footer {
            margin-top: 50px;
            border-top: 2px solid #eee;
            padding-top: 20px;
        }
        .print-button {
            float: right;
        }
        @media print {
            .no-print {
                display: none;
            }
            body {
                background-color: #fff;
            }
            .bill-container {
                box-shadow: none;
                padding: 0;
            }
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5 mb-5">
        <div class="bill-container">
            <div class="bill-header">
                <div class="row">
                    <div class="col-md-6">
                        <h1 class="bill-title">BOOKING BILL</h1>
                    </div>
                    <div class="col-md-6 text-right">
                        <h5>Cab Booking System</h5>
                        <p>123 Main Street, City<br>
                        Phone: +1234567890<br>
                        Email: info@cabservice.com</p>
                    </div>
                </div>
            </div>
            
            <div class="bill-details">
                <div class="row">
                    <div class="col-md-6">
                        <h5>Bill To:</h5>
                        <p>
                            <strong>${customer.name}</strong><br>
                            Email: ${customer.email}<br>
                            Phone: ${customer.phone}
                        </p>
                    </div>
                    <div class="col-md-6 text-right">
                        <h5>Bill Details:</h5>
                        <p>
                            <strong>Bill Date:</strong> <fmt:formatDate value="${booking.bookingDate}" pattern="dd-MM-yyyy"/><br>
                            <strong>Booking ID:</strong> ${booking.id}<br>
                            <strong>Status:</strong> <span class="badge badge-success">Confirmed</span>
                        </p>
                    </div>
                </div>
            </div>
            
            <div class="bill-table">
                <h5>Booking Details:</h5>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th class="text-right">Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Pickup Location</td>
                            <td class="text-right">${pickupLocation}</td>
                        </tr>
                        <tr>
                            <td>Drop Location</td>
                            <td class="text-right">${dropLocation}</td>
                        </tr>
                        <tr>
                            <td>Distance</td>
                            <td class="text-right"><fmt:formatNumber value="${booking.distanceKm}" pattern="#,##0.00"/> km</td>
                        </tr>
                        <tr>
                            <td>Base Fare</td>
                            <td class="text-right">Rs. 50.00</td>
                        </tr>
                        <tr>
                            <td>Distance Charge (Rs. 15/km)</td>
                            <td class="text-right">Rs. <fmt:formatNumber value="${booking.distanceKm * 15}" pattern="#,##0.00"/></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Total Amount</th>
                            <th class="text-right">Rs. <fmt:formatNumber value="${booking.totalAmount}" pattern="#,##0.00"/></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            
            <div class="bill-footer">
                <p class="text-center">Thank you for using our Cab Service!</p>
                <button class="btn btn-primary print-button no-print" onclick="window.print()">
                    <i class="fas fa-print"></i> Print Bill
                </button>
            </div>
            
            <div class="mt-4 text-center no-print">
                <a href="${pageContext.request.contextPath}/reg/viewBookings" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to My Bookings
                </a>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>