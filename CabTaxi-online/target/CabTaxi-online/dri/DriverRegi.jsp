<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	

*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Roboto", sans-serif;
	
}

body{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height:100vh;
	
}

.container{
	background: linear-gradient(145deg, #3a6186, #89253e);
	padding: 30px;
	  backdrop-filter: blur(10px);
    border-radius: 12px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
    width: 400px;
    text-align: center;
}

h1{
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 20px;
	color: #000000;
	
}


label{
	display: block;
	text-align: left;
	font-size: 14px;
	font-weight: 500;
    color: #000000;
    margin: 10px 0 5px
}

input {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 8px;
    font-size: 10px;
    outline: none;
    transition: 0.3s;
    background:rgba(255, 255, 255, 0.2);
    color: #fff;
}
input:focus {
    background: rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(5px);
    border: 1px solid #fff;
}

button {
	width: 100%;
  background: #4facfe;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  transition: 0.3s;
  margin-top: 10px
}

button:hover {
  background: #FFFFED; 
  color: black;/* Slightly darker blue */
}

@media (max-width: 450px) {
    body {
        padding: 10px;
    }
    
    .container {
        width: 100%;
        padding: 20px;
    }

    h1 {
        font-size: 22px
    }

    input {
        font-size: 14px;
        padding: 10px;
    }

    button {
        font-size: 14px;
        padding: 12px;
    }
}
	
</style>
</head>
<body>
	<div class="container"><h1>Driver Register Form</h1>
	<form action="driverlog" method="post">
		<label for="name">Full Name</label>
		<input type="text" id="name" name="name" required>
		
		<label for="email">Email Address</label>
		<input type="email" id="email" name="email" required>
		
		<label for="phone">Contact number</label>
		<input type="text" id="phone" name="phone" required>
		
		<label for="password">Password</label>
		<input type="password" id="password" name="password" required>
		
		<label for="password">Confirm Password</label>
		<input type="password" id="password" name="confirm_password" required> 
		
		<label for="address">Address</label>
		<input type="text" id="address" name="address" required>
		
		<label>Licened Number</label>
		<input type="text" id="licen" name="licened_number" required>
		
		
		
		<label >Date of Birth</label>
		<input type="date" id="dob" name="dob" required>
		
		<label >NIC</label>
		<input type="text" id="nic" name="nic" required>
		
		<button type="submit">Register Driver</button>
		
		
		
		
	</form></div>
</body>
</html>