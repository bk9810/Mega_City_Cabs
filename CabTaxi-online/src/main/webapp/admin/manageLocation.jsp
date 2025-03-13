<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Locations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Manage Locations</h2>
        
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        
        <div class="row mt-4">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Add New Location</h4>
                    </div>
                    <div class="card-body">
                        <form method="post" action="location">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="locationName">Location Name:</label>
                                <input type="text" class="form-control" id="locationName" name="locationName" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Location</button>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Existing Locations</h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${empty locations}">
                            <p>No locations found. Please add some locations.</p>
                        </c:if>
                        <c:if test="${not empty locations}">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Location Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${locations}" var="location">
                                        <tr>
                                            <td>${location.id}</td>
                                            <td>${location.locationName}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="mt-3">
            <a href="managedistan" class="btn btn-secondary">Manage Distances</a>
           
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>