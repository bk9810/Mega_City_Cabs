<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* Google Font */


* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    
    padding: 20px;
}

.container {
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
    width: 400px;
    text-align: center;
    transition: 0.3s ease-in-out;
}

h1 {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #000000;
}

label {
    display: block;
    text-align: left;
    font-size: 14px;
    font-weight: 500;
    color: #000000;
    margin: 10px 0 5px;
}

input {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    outline: none;
    transition: 0.3s;
    background: rgba(255, 255, 255, 0.2);
     color: #000000;
}

input::placeholder {
    color: rgba(255, 255, 255, 0.7);
}

input:focus {
    background: rgba(255, 255, 255, 0.3);
    border: 1px solid #fff;
}

button {
	width: 100%;
  background: black;
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
  background: white; 
  color: black;/* Slightly darker blue */
}

.register-link {
    margin-top: 15px;
    font-size: 14px;
    color: #fff;
}

a{
	text-decoration: none;
	color: black;
}

p{
	color: black;
}



/* 📱 Mobile View (Screens < 450px) */
@media (max-width: 450px) {
    body {
        padding: 10px;
    }
    
    .container {
        width: 100%;
        padding: 20px;
    }

    h1 {
        font-size: 22px;
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
	<div class="container"><h1>Driver login</h1>
	<form action="log" method="post">
		<label for="email">Email: </label>
		<input type="email" id="email" name="email" required>
		
		<label for="password">Password: </label>
		<input type="password" id="password" name="password" required> 
		
		<button type="submit">Join Us</button>
		
		<p >Don't have an account? <a href="DriverRegi.jsp">Register</a></p>
	</form></div>
</body>
</html>