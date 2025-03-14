 <%@ page import="java.sql.*" %>
    <%@ page import="com.example.dao.DBConnectionFactory" %>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
	<style>
	body{
		margin: 0;
    	padding: 0;
    	font-family: 'Arial', sans-serif;
    	background-color: white;
    	color: black;
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
	.head{
		margin-top: 300px;
		width: 400px;
		padding-left: 400px;
	}
	.review {
      background: #fff;
      border: 1px solid #ddd;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 5px;
      margin-top: 40px;
    }
     .rating {
      direction: rtl;
      unicode-bidi: bidi-override;
      display: inline-block;
    }
     .review-card {
        border: 1px solid #ddd;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
    }
	.rating input:checked ~ label,
    .rating label:hover,
    .rating label:hover ~ label {
      color: gold;
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

        /* Hamburger Menu for Mobile */
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
        
        
		
        
        
        
      
        .footer{
        background-color: black;
        padding: 20px 0;
        margin-top:200px;
        }
		 .footer-bottom {
    		text-align: center;
   
    		font-size: 0.8rem;
    		border-top: 1px solid #ffffff;

    		padding-top: 10px;
  		}
  		.footer-bottom p {
    		color: #7e0505;
  		}
  		
  		.int {
    		position: absolute;
    		left: 10%;
    		top: 60px; /* Adjust based on image */
    		width: 500px;
    		color: white;
		}

		.int h1 {
    		font-size: 30px;
    		margin-top: 20px;
		}

	

		.int p {
    		font-size: 15px;
    		margin-top: 40px;
    	
		}
		
		.int button{
			
  			box-sizing: border-box;
  			background-color:  black;
			width: 500px;
			height: 40px;
			 border: 2px solid transparent;
			border-radius: 5px;
			margin-left: 20px;
			margin-top: 40px;
			cursor: pointer;
			color: white;
			
		}
		.int button:hover{
			background-color: white;
			color: black;
		}
		.cust{
			text-decoration: none;
			color: white;
			font-size: 25px;
		}
		.cust:hover{
			color: black;
		}

		.service{
			text-align: center;
			padding: 50px 20px;
			background: #f5f5f5;
		}
		.service h3{
			font-size: 36px;
			margin-bottom: 20px;
			color: #333
		}
		
		.container{
			display:flex;
			justify-content: center;
			gap:20px;
			flex-wrap: wrap;
		}
		
		.container1{
			display:flex;
			justify-content: center;
			gap:20px;
			flex-wrap: wrap;
		}

		.box{
			width:250px;
			background: black;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
		}
		
		.box1{
			width:250px;
			background: white;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
		}
		
		
		.box h4{
			font-size: 22px;
			color: white;
			font-weight: bold;

		} 
		.box1 h4{
			font-size: 22px;
			color: black;
			font-weight: bold;

		} 
		
		
		.box p{
			font-size: 16px;
			color: white;
		}
		
		.box1 p{
			font-size: 16px;
			color: black;
		}
		.image{
			position: relative;
			display: inline-block;
			text-align: center;
		}		
		
		.image img{
			width: 1510px;
			height: 720px;
			margin-top: 3px;
			filter: brightness(50%);
		}
  	
        .dri h1{
        	font-size: 30px;
        	margin-top: 20px;
        }
        
        .dri{
        	position: absolute;
        	left: 10%;
        	top: 60px;
        	width: 500px;
        	color: white;
        }/
        
        .dri h3{
        	font-size: 20px;
        	margin-top: 20px;
        }
        .dri p{
        	font-size: 15px;
        	margin-top: 40px;
        }
        
        .dri button{
        	box-sizing: border-box;
        	background-color: white;
        	width:  500px;
        	height: 40px;
        	border: 2px solid transparent;
        	border-radius: 5px;
        	margin-left: 20px;
        	margin-top: 40px;
        	cursor: pointer;
        	color: black;
        }
        
        .dri button:hover{
        	background-color: black;
        	color: white;
        }
        
        .faq{
        	
        }
        .faq h4{
        
        	margin-left: 100px;
        	font-size: 30px;
        	margin-top: 100px
        
        }
        .faq-cont{
        	max-width: 600px;
        	margin: 20px auto;
        	background: #fff;
        	padding: 20px;
        	border-radius: 10px;
        	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        	margin-right: 30px;
        	margin-top: -150px
        }
        
        .faq-item{
        	border-bottom: 1px solid #ddd;
        }
        
        .faq-que{
        	 width: 100%;
            padding: 15px;
            text-align: left;
            background: #ecf0f1;
            border: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .answer{
        	display: none;
            padding: 15px;
            font-size: 14px;
            text-align: left;
            color: #34495e;
        }
        
        .faq-item.active .answer{
        	display: block;
        }
        
        .faq.item.active .faq-que{
        	background: #3498db;
        	color: white;
        }
        
        
        .adv h3{
        display: flex;
        	justify-content: center;
        	align-items: center;
        	
        	font-size: 50px;
        	margin-top: 100px;
        	
        }
        
        .adv img{
        	margin-top: -250px;
        	align-items: center;
        	height: 700px;
        	padding-left: 150px;
        	padding-right: 100px;
        	
        	
        }
        
       
        .cards {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-left: 890px;
            margin-top: -200px;
        }
        
         .cardss {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-top: -140px;
            margin-right: 890px;
        }
        
         .carrd {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-left: 890px;
            margin-top: -300px;
        }
        
         .cardsss {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-top: -140px;
            margin-right: 890px;
        }
        .card {
            background: transparent;
            border-radius: 10px;
            padding: 20px;
            margin-top: -30px;
            width: 270px;
            
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        .card h3 {
            color: black;
            font-size: 20px;
            font-weight: bold;
        }
        .card p {
            color: #555;
            font-size: 14px;
        }
        
        .cardi {
            background: transparent;
            border-radius: 10px;
            padding: 20px;
            margin-top: -30px;
            width: 270px;
            
            transition: transform 0.3s;
        }
        .cardi:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        .cardi h3 {
            color: black;
            font-size: 20px;
            font-weight: bold;
        }
        .cardi p {
            color: #555;
            font-size: 14px;
        }
        
        .carde {
            background: transparent;
            border-radius: 10px;
            padding: 20px;
            margin-top: -30px;
            width: 270px;
            
            transition: transform 0.3s;
        }
        .carde:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        .carde h3 {
            color: black;
            font-size: 20px;
            font-weight: bold;
        }
        .carde p {
            color: #555;
            font-size: 14px;
        }
        
        .cardt {
            background: transparent;
            border-radius: 10px;
            padding: 20px;
            margin-top: -30px;
            width: 270px;
            
            transition: transform 0.3s;
        }
        .cardt:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        .cardt h3 {
            color: black;
            font-size: 20px;
            font-weight: bold;
        }
        .cardt p {
            color: #555;
            font-size: 14px;
        }

      .footer-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  max-width: 1200px;
  margin: 0 auto;
}

.footer-container > div {
  flex: 1 1 200px;
  margin: 10px;
}

.footer-logo img {
  max-width: 150px;
}

.footer-contact h4,
.footer-nav h4,
.footer-legal h4,
.footer-social h4 {
  margin-bottom: 10px;
}

.footer-nav ul,
.footer-legal ul,
.footer-social ul {
  list-style: none;
  padding: 0;
}

.footer-nav li,
.footer-legal li,
.footer-social li {
  margin-bottom: 8px;
}

.footer-nav a,
.footer-legal a,
.footer-contact a,
.footer-social a {
  color: #fff;
  text-decoration: none;
}

.footer-social a {
  font-size: 18px;
}

.footer-cta {
  display: flex;
  align-items: center;
}

.btn-cta {
  background-color: #ffcc00;
  color: #222;
  padding: 10px 20px;
  text-decoration: none;
  font-weight: bold;
  border-radius: 5px;
}

.review {
      background: #fff;
      border: 1px solid #ddd;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 5px;
      margin-top: 40px;
    }
    
    .review-card {
        border: 1px solid #ddd;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
    }
    
      @media (max-width: 768px) {
            .menu {
                display: none;
                flex-direction: column;
                background: #444;
                width: 100%;
                position: absolute;
                top: 60px;
                left: 0;
            }
            .menu.active {
                display: flex;
            }
            .menu-toggle {
                display: block;
            }
            
            .adv{
            	margin-left: 50px
            }
        }
      
        
	</style>
</head>
<body>
<nav class="nav">
	<div class="logo"><img src="img/aa.png" alt="sample Image"></div>
 	<div class="hamburger" onclick="toggleMenu()">
            &#9776;
        </div>
	<ul class ="menu">
		<li><a href="" class="color" style=background-color:#e2e8f0>Home</a></li>
		
		
	</ul>
</nav>



<div class="image-container">
    <img src="img/25843.jpg" alt="Sample Image">
    <div class="intro">
        <div class="int">
            <h1>Welcome to Mega City Cab Service</h1>
            <p>Our Mega City Cab service is the best cab service trusted and connected by thousands of customers. 
            Anyone who joins our service can travel safely, reliably and as quickly as possible.</p>
            <p>Here is the web app that we introduce to you in our cab service to book a ride, 
            get details of the booked cab, manage the booking and calculate the fare.</p>
            
            
            <p>
            	After accessing our web app, a user must register by clicking the login button shown here before booking a ride, obtaining details of cabs, and obtaining booking order history.
            </p>
            <a href="reg/Login.jsp" class="cust"><button>SignIn</button></a>
        </div>
    </div>
</div>

<div class="service">
	<h3>Our Services</h3>
	<div class="container">
	<div class="box">
		<h4>Easy & Fast Cab Booking</h4>
		<p>You can hail a cab to your location or book a cab for your trip through our Mega City Cab service web app.</p>
	</div>
	<div class="box">
		<h4>VIP & Luxury Rides</h4>
		<p>Take advantage of our first-rate taxi services to travel in style.</p>
	</div>
	
	
	<div class="box">
		<h4>24/7 Customer Assitant</h4>
		<p>At any time, our support staff is available to help.</p>
	</div>
	
	
	<div class="box">
		<h4>Real-Time Cab Tracking</h4>
		<p>Track your cab in real-time and get accurate arrival time updates for better convenience.</p>
	</div>


</div>
</div>
<div class="service">
<h3>Why Choose Us:</h3>

	<div class="container1">
	<div class="box1">
		<h4>Secure & Safe Travel</h4>
		<p>Every time, safe and secure journeys are guaranteed by our reliable drivers.</p>
	</div>
	<div class="box1">
		<h4>Budget-Friendly Pricing</h4>
		<p>Take advantage of open, equitable fares free of hidden fees.</p>
	</div>
	
	
	<div class="box1">
		<h4>24/7 Customer Support.</h4>
		<p>Our committed customer service team is on hand around the clock to help you with any questions.</p>
	</div>
	
	
	<div class="box1">
		<h4>Quick & Easy Booking</h4>
		<p> Book your ride in seconds using our web app.</p>
	</div>


</div>
</div>



<div class="image">
	<img src="img/abc.jpg" alt="Sample Image">
	<div class="dri">
		<h1>Join Us: </h1>
		
		<h3>Are you an experienced driver looking for a reliable opportunity?</h3>
		
		<p>We are looking for talented and dedicated drivers to join our cab service. We offer flexible hours, competitive wages, and a great environment to help you succeed. Join the most trusted cab service in town and start your journey.</p>
		
		<p>Drivers can also add their own vehicles and must register. To do so, click the Join button below.</p>
		
		<a href="dri/DriverLog.jsp" class="cust"><button>Join Us</button></a>
	</div>
	
</div>



<div class=faq>
	<h4>Mega City Cab Service - FAQ</h4>
	<div class=faq-cont>
		<div class="faq-item active">
			<button class="faq-que">How do I book a cab with Mega City Cab Service?</button>
			<div class="answer"> Booking a cab with Mega City Cab Service is easy! You can book online through our website. Just enter your pickup location, destination, and preferred time, and we’ll handle the rest.</div>
		</div>
		
		<div class="faq-item ">
			<button class="faq-que">What are the advantages of using Mega City Cab Service to make a cab reservation?</button>
			<div class="answer">Our cab service offers safe, reliable and affordable rides throughout the city, and our service is available 24/7, and prices are inclusive. You can make cashless payments in some cases.</div>
		</div>
		
		<div class="faq-item ">
			<button class="faq-que">Can I schedule a ride in advance with Mega City Cab Service?</button>
			<div class="answer">Yes, you can pre-book your ride through our website by selecting your desired date and time. This ensures that a cab is ready for you when you need it.</div>
		</div>
		
		<div class="faq-item ">
			<button class="faq-que">How do I calculate my fare before booking?</button>
			<div class="answer">Our website's fare calculator calculates the cost by entering your pickup and drop-off locations and then generating a cost by distance.</div>
		</div>
		
		<div class="faq-item ">
			<button class="faq-que">Which forms of payment are accepted for rides in Mega City Cabs?</button>
			<div class="answer">We take cash, credit/debit cards, and mobile wallet payments, among other payment methods. When you reserve your ride, you can select the manner that you prefer.</div>
		</div>
		
		<div class="faq-item ">
			<button class="faq-que">How can I contact customer support if I have an issue?</button>
			<div class="answer">You can reach our customer support team via our 24/7 hotline, email, or live chat on our website. We are always here to assist you with any questions or concerns.</div>
		</div>


	</div>
	
</div>


<div >

<div class=adv>
	<h3>Our Main Advantages</h3>
	<img src="img/fffa.png" alt="sample-image">
</div>

<div class= "cards">
	<div class="cardi">
		<h3>&#x23F3; 24/7 Availability</h3>
		<p>Day or night, our cabs are always available for your rides.</p>
		
	</div>
</div>	
<div class= "cardss">
	<div class="card">
		<h3>&#x1F697; Multiple Car Options</h3>
		<p>Choose from economy, sedan, SUV, or luxury vehicles.</p>
		
	</div>
</div>


	
<div class="carrd">
	<div class="carde">
         <h3>&#x1F4B3; Multiple Payment Options</h3>
       	<p>Pay via cash, credit/debit cards, or mobile wallets.</p>
     </div>
</div>

<div class="cardsss">
     <div class="cardt">
         <h3>&#x1F4DE; 24/7 Customer Support</h3>
         <p>We’re always here to assist you with bookings and queries.</p>
     </div>
</div>

</div>



<div class="mt-4 head">
	
    <<section id="reviews">
    <div class="section-header">
        <h2>Customer Reviews</h2>
    </div>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnectionFactory.getConnection(); // Get DB Connection
            String sql = "SELECT name, rating, review_text, created_at FROM customer_reviews ORDER BY created_at DESC LIMIT 5";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
    %>
                <div class="review">
                    <h4><%= rs.getString("name") %> - <%= rs.getInt("rating") %> ⭐</h4>
                    <p><%= rs.getString("review_text") %></p>
                    <small><%= rs.getTimestamp("created_at") %></small>
                </div>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <p>Error loading reviews.</p>
    <%
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
</section>
</div>




<footer class="footer">
<div class="footer-container">
	<div class="footer-logo">
		<img src="img/aa.png" alt= "Cab Service Logo"/>
	</div>
	
	<div class="footer-contact">
		<h4>Contact Us</h4>
		<p>
			Call:  <a href=""tel:+94781886892">+94781886892</a>
		</p>
		<p>
			Email: 
			<a href="mailto:info@cabservice.com">info@cabservice.com</a>
		</p>
		</div>
		
		<div class="footer-nav">
    <h4>Quick Links</h4>
    <ul>
      <li><a href="reg/Login_jsp
      ">Boooking</a></li>
      <li><a href="services.html">Services</a></li>
      <li><a href="faq.html">REview</a></li>
      
    </ul>
  </div>
  
  <div class="footer-legal">
    <h4>Legal</h4>
    <ul>
      <li><a href="privacy.jsp">Privacy Policy</a></li>
      <li><a href="terms.jsp">Terms &amp; Conditions</a></li>
    </ul>
  </div>
  
   <div class="footer-cta">
    <a href="reg/Login.jsp" class="btn-cta">Book Now</a>
  </div>
</div>
<div class="footer-bottom">
<p>&copy; 2025. All Right Reserved.</p>
</div>
</footer>
<script>
function toggleMenu() {
    let menu = document.querySelector(".menu");
    menu.classList.toggle("active");
}
</script>
<script>
        const faqs = document.querySelectorAll('.faq-item');

        faqs.forEach(faq => {
            faq.querySelector('.faq-que').addEventListener('click', () => {
                faqs.forEach(item => item.classList.remove('active'));
                faq.classList.add('active');
            });
        });
    </script>
</body>
</html>
