<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card border-danger">
            <div class="card-header bg-danger text-white">
                <h2>Error</h2>
            </div>
            <div class="card-body">
                <div class="alert alert-danger">
                    <h4>An error occurred:</h4>
                    <p>${error}</p>
                </div>
                <p>Please try again or contact the administrator if the problem persists.</p>
            </div>
            <div class="card-footer">
                <a href="javascript:history.back()" class="btn btn-secondary">Go Back</a>
                <a href="index.jsp" class="btn btn-primary">Back to Home</a>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>