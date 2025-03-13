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
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

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
    background: linear-gradient(145deg, #3a6186, #89253e);
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
    color: #fff;
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
  background-color: black;
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



 a{
	text-decoration: none;
	color: black;
}

p{
	color: white;
}
.nav{
		display: flex;
    	justify-content: space-between;
    	align-items: center;
    	padding: 15px 20px;
    	background: transparent;
   		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
   		position: relative;
	}
	.logo img{
		width: 100px;
		
	}
	 .menu {
        display: flex;
        gap: 20px;
        padding-right: 20px;
    }

        .menu li {
            list-style: none;
        }

        .menu a {
            font-size: 18px;
            text-decoration: none;
            color: black;
        }

        .menu a:hover {
            color: gold;
        }
        
        .hamburger {
            display: none;
            flex-direction: column;
            cursor: pointer;
            padding-right: 20px;
        }

        .hamburger div {
            width: 30px;
            height: 4px;
            background-color: black;
            margin: 5px;
            transition: 0.4s;
        }
        .image-container {
            position: relative;
            display: inline-block;
            text-align: center;
        }
        
        .image-container img {
            width: 1510px;
            height: 720px;
            margin-top: 3px;
            filter: brightness(50%);
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

	<div class="container">
	<h1>Customer Login</h1>
	<form action="login" method="post">
		<label>Email: </label>
		<input type="email" name="email" required>
		
		<label>Password:</label>
		<input type="password" name="password" required>
		
		<button type="submit" >Login</button>
		
		 <p >Don't have an account? <a href="Register.jsp">Register</a></p>
		 <p > <a href="../index.jsp">Back To Home Page</a></p>
	</form>
	</div>
</body>
</html>