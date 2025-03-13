<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2{
		display: flex;
		justify-content: center;
		align-item:center;
	}
	
	form{
		box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
		width: 800px;
		height: 1000px;
		margin-left: 300px;
		
		
		
	}
	
	label{
		padding-left: 100px;
		
	}
	input{
		margin-top: 70px;
		border-radius: 8px;
		
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
	
	
	button{
		margin-left: 300px;
		margin-top: 50px;
		width: 30%;
		background: black;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		height: 30px;
		
	}
</style>
</head>
<body>
	 <h2>Driver Verification Questions</h2>
    <form action="submitQA" method="post">
        <input type="hidden" name="driverId" value="1"> <!-- Assume driver ID is 1 -->

        <label>1. Do you have a valid driving license?</label>
        <input type="hidden" name="questions" value="Do you have a valid driving license?">
        <input type="text" name="answers" required><br>

        <label>2. Do you have National ID or Passport port?</label>
        <input type="hidden" name="questions" value="Do you have National ID or Passport port??">
        <input type="text" name="answers" required><br>
        
        <label>3. How many years of driving experience do you have?</label>
        <input type="hidden" name="questions" value="How many years of driving experience do you have?">
        <input type="text" name="answers" required><br>
        
        <label>4. Have you ever worked as a taxi or ride-hailling driver before? </label>
        <input type="hidden" name="questions" value="How many years of driving experience do you have?">
        <input type="text" name="answers" required><br>
        
        <label>5. Are you familiar with GPS navigation systems and ride-hailling apps?  </label>
        <input type="hidden" name="questions" value="How many years of driving experience do you have?">
        <input type="text" name="answers" required><br>

        <label>6. Are you comfortable driving at night  ?</label>
        <input type="hidden" name="questions" value="Are you comfortable driving at night?">
        <input type="text" name="answers" required><br>
        
         <label>7. Do you own vehicale? </label>
        <input type="hidden" name="questions" value="How many years of driving experience do you have?">
        <input type="text" name="answers" required><br>
        
         <label>8. Do you plan to drve full-time or part-time? </label>
        <input type="hidden" name="questions" value="How many years of driving experience do you have?">
        <input type="text" name="answers" required><br>
        
         <label>9. How do you ensure passenger safety during a ride? </label>
        <input type="hidden" name="questions" value="How many years of driving experience do you have?">
        <input type="text" name="answers" required><br>
        
         <label>10. Why do you want to work with Mega city Cab? </label>
        <input type="hidden" name="questions" value="How many years of driving experience do you have?">
        <input type="text" name="answers" required><br>

        <button type="submit">Submit Answers</button>
    </form>
</body>
</html>