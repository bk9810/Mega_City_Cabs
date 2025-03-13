<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Distances</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
  <h2>Manage Distances Between Locations</h2>

  <!-- Success Message -->
  <div class="alert alert-success" role="alert" id="successMessage" style="display: ${not empty message ? 'block' : 'none'}">
    ${message}
  </div>
  
  <!-- Error Message -->
  <div class="alert alert-danger" role="alert" id="errorMessage" style="display: ${not empty error ? 'block' : 'none'}">
    ${error}
  </div>

  <div class="card mt-4">
    <div class="card-header">
      <h4>Add/Update Distance Information</h4>
    </div>
    <div class="card-body">
      <!-- Warning if not enough locations -->
      <div class="alert alert-warning" style="display: ${empty locations || locations.size() < 2 ? 'block' : 'none'}">
        You need at least two locations to manage distances.
        <a href="manageLocations" class="alert-link">Add locations first</a>
      </div>
      
      <!-- Distance form -->
      <form method="post" action="manageDistances" style="display: ${not empty locations && locations.size() >= 2 ? 'block' : 'none'}">
        <div class="row">
          <div class="form-group col-md-4">
            <label for="fromLocation">From Location:</label>
            <select class="form-control" id="fromLocation" name="fromLocation" required>
              <option value="">-- Select From Location --</option>
              <c:forEach items="${locations}" var="location">
                <option value="${location.id}">${location.locationName}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group col-md-4">
            <label for="toLocation">To Location:</label>
            <select class="form-control" id="toLocation" name="toLocation" required>
              <option value="">-- Select To Location --</option>
              <c:forEach items="${locations}" var="location">
                <option value="${location.id}">${location.locationName}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group col-md-4">
            <label for="distance">Distance (in km):</label>
            <input type="number" step="0.01" min="0.1" class="form-control" id="distance" name="distance" required>
          </div>
        </div>
        <button type="submit" class="btn btn-primary">Save Distance</button>
        
        <div class="mt-3">
          <p class="text-info">
            <i class="fas fa-info-circle"></i> Note: The distance will be automatically applied in both directions.
          </p>
        </div>
      </form>
    </div>
  </div>
</div>
        
        <div class="mt-3">
            <a href="manageLocations" class="btn btn-secondary">Manage Locations</a>
            <a href="booking" class="btn btn-info">Make a Booking</a>
        </div>
    </div>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Prevent selecting the same location for from and to
        $(document).ready(function() {
            $('#fromLocation').change(function() {
                var fromId = $(this).val();
                $('#toLocation option').removeAttr('disabled');
                $('#toLocation option[value="' + fromId + '"]').attr('disabled', 'disabled');
                
                // If the currently selected "to" is the same as the new "from", reset the "to" selection
                if ($('#toLocation').val() === fromId) {
                    $('#toLocation').val('');
                }
            });
            
            $('#toLocation').change(function() {
                var toId = $(this).val();
                $('#fromLocation option').removeAttr('disabled');
                $('#fromLocation option[value="' + toId + '"]').attr('disabled', 'disabled');
                
                // If the currently selected "from" is the same as the new "to", reset the "from" selection
                if ($('#fromLocation').val() === toId) {
                    $('#fromLocation').val('');
                }
            });
        });
    </script>
</body>
</html>