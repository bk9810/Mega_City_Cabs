<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
        <div class="jumbotron">
            <h1 class="display-4"> </h1>
            
            <p class="lead">Here our Booking System and you have to ride, Book Now</p>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Locations</h5>
                            <p class="card-text">Add and view locations available for ride bookings.</p>
                            <a href="manageLocations" class="btn btn-primary">Add Locations</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Distances</h5>
                            <p class="card-text">Set up distances between different locations.</p>
                            <a href="manageDistances" class="btn btn-success">Add Distances</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Booking</h5>
                            <p class="card-text">Set up distances between different locations.</p>
                            <a href="booking" class="btn btn-success">Add Distances</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Booking</h5>
                            <p class="card-text">Set up distances between different locations.</p>
                            <a href="customerDashboard" class="btn btn-success">Back to Dashboard</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>