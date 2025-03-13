<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
    <p style="color: red;"><%= message %></p>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Driver Own Vehicale Details</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            background: #28a745;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background: #218838;
        }
    </style>
</head>
<body>
	<div class="container">
		<h2>Vehicale Registration</h2>
		<form action="vehicle" method="POST" enctype="multipart/form-data">
			<label for="registration_number">Vehicle Registration Number:</label>
            <input type="text" id="registration_number" name="registration_number" required>
            
            
            <label for="plate_number">Plate Number:</label>
            <input type="text" id="plate_number" name="plate_number" required>

            <label for="registration_date">Registration Date:</label>
            <input type="date" id="registration_date" name="registration_date" required>
            
            <label for="cab_type">Cab Type:</label>
            <select name="cab_type" id="cab_type" required>
                <option value="Standard">Standard Cab</option>
                <option value="Mini">Mini cab</option>
                <option value="Luxury">Luxury Cab</option>
                <option value="Luxury">Suv Cab</option>
                <option value="Luxury">Electric Cab</option>
            </select>
            
            <label for="seating_capacity">Seating Capacity:</label>
            <input type="text" id="seating_capacity" name="seating_capacity" required>

            <label for="fuel_type">Fuel Type:</label>
            <select name="fuel_type" id="fuel_type" required>
                <option value="Petrol">Petrol</option>
                <option value="Diesel">Diesel</option>
                <option value="Electric">Electric</option>
                <option value="Hybrid">Hybrid</option>
            </select>
            
            <label for="manufacturing_year">Manufacturing Year:</label>
            <input type="number" id="manufacturing_year" name="manufacturing_year" required>
            
             <button type="submit">Register Vehicle</button>
		</form>
	</div>
</body>
</html>