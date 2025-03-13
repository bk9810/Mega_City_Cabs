<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Make a Booking</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
   <div class="container mt-4">
  <h2>Make a Booking</h2>
  
  <!-- Error Message -->
  <div class="alert alert-danger" role="alert" style="display: ${not empty error ? 'block' : 'none'}">
    ${error}
  </div>
  
  <div class="card mt-4">
    <div class="card-header">
      <h4>Booking Information</h4>
    </div>
    <div class="card-body">
      <!-- Warning if not enough locations -->
      <div class="alert alert-warning" style="display: ${empty locations || locations.size() < 2 ? 'block' : 'none'}">
        You need at least two locations to make a booking. 
        <a href="manageLocations" class="alert-link">Add locations first</a>
      </div>
      
      <!-- Booking form -->
      <form method="post" action="${pageContext.request.contextPath}/reg/booking" style="display: ${not empty locations && locations.size() >= 2 ? 'block' : 'none'}">
        <input type="hidden" name="action" value="calculate">
        <div class="row">
          <div class="form-group col-md-6">
            <label for="pickupLocation">Pickup Location:</label>
            <select class="form-control" id="pickupLocation" name="pickupLocation" required>
              <option value="">-- Select Pickup Location --</option>
              <c:forEach items="${locations}" var="location">
                <option value="${location.id}" ${fromLocationId == location.id ? 'selected' : ''}>${location.locationName}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group col-md-6">
            <label for="dropLocation">Drop Location:</label>
            <select class="form-control" id="dropLocation" name="dropLocation" required>
              <option value="">-- Select Drop Location --</option>
              <c:forEach items="${locations}" var="location">
                <option value="${location.id}" ${toLocationId == location.id ? 'selected' : ''}>${location.locationName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
        <button type="submit" class="btn btn-primary">Calculate Fare</button>
      </form>
    </div>
  </div>
  
  <!-- Fare calculation card -->
  <div class="card mt-4" style="display: ${not empty calculatedDistance ? 'block' : 'none'}">
    <div class="card-header bg-success text-white">
      <h4>Fare Calculation</h4>
    </div>
    <div class="card-body">
      <p><strong>Distance:</strong> <fmt:formatNumber value="${calculatedDistance}" pattern="#,##0.00"/> km</p>
      <p><strong>Fare:</strong> Rs. <fmt:formatNumber value="${calculatedAmount}" pattern="#,##0.00"/></p>
      
      <!-- For logged in users -->
      <form method="post" action="${pageContext.request.contextPath}/reg/booking" style="display: ${sessionScope.customerId != null || sessionScope.customer != null ? 'block' : 'none'}">
        <input type="hidden" name="action" value="book">
        <input type="hidden" name="pickupLocation" value="${fromLocationId}">
        <input type="hidden" name="dropLocation" value="${toLocationId}">
        <button type="submit" class="btn btn-success">Confirm Booking</button>
      </form>
      
      <!-- For non-logged in users -->
      <div class="alert alert-info" style="display: ${sessionScope.customerId == null && sessionScope.customer == null ? 'block' : 'none'}">
        Please <a href="${pageContext.request.contextPath}/reg/login" class="alert-link">login</a> to confirm your booking.
      </div>
    </div>
  </div>
  
  <!-- Navigation buttons -->
  <div class="mt-3">
    <a href="${pageContext.request.contextPath}/reg/manageLocations" class="btn btn-secondary">Manage Locations</a>
    <a href="${pageContext.request.contextPath}/reg/manageDistances" class="btn btn-info">Manage Distances</a>
  </div>
</div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Prevent selecting the same location for pickup and drop
        $(document).ready(function() {
            $('#pickupLocation').change(function() {
                var pickupId = $(this).val();
                $('#dropLocation option').removeAttr('disabled');
                $('#dropLocation option[value="' + pickupId + '"]').attr('disabled', 'disabled');
                
                // If the currently selected drop is the same as the new pickup, reset the drop selection
                if ($('#dropLocation').val() === pickupId) {
                    $('#dropLocation').val('');
                }
            });
            
            $('#dropLocation').change(function() {
                var dropId = $(this).val();
                $('#pickupLocation option').removeAttr('disabled');
                $('#pickupLocation option[value="' + dropId + '"]').attr('disabled', 'disabled');
                
                // If the currently selected pickup is the same as the new drop, reset the pickup selection
                if ($('#pickupLocation').val() === dropId) {
                    $('#pickupLocation').val('');
                }
            });
            
            // Run once on page load to set initial state
            var pickupId = $('#pickupLocation').val();
            if (pickupId) {
                $('#dropLocation option[value="' + pickupId + '"]').attr('disabled', 'disabled');
            }
            
            var dropId = $('#dropLocation').val();
            if (dropId) {
                $('#pickupLocation option[value="' + dropId + '"]').attr('disabled', 'disabled');
            }
        });
    </script>
</body>
</html>