<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
 
<c:import url="/resources/jspImport/head.jsp"></c:import>
</head>
	
<body>

<c:import url="/resources/jspImport/header.jsp"></c:import>
  
<!-- mail 
	<div class="map">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3654.9930629574787!2d-46.72469593507033!3d-23.640419470401582!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce5116b59b5a09%3A0x11c3bbea465870!2sCompany+Business+Towers+-+V%C3%A1rzea+de+Baixo%2C+S%C3%A3o+Paulo+-+SP%2C+Brazil!5e0!3m2!1sen!2sin!4v1473675527894" style="border:0"></iframe>
	</div>
-->
	<div class="mail">
		<div class="container">
			<h3 class="w3_agile_head">Mail Us</h3>
			<p class="augue_agile">Vivamus eget augue bibendum, molestie lacus</p>

			<div class="w3_agile_mail_grids_agile">
				<div class="col-md-8 w3_agile_mail_left">
					<div class="agileits_mail_grid_right1 agile_mail_grid_right1">
						<form action="#" method="post">
							<span>
								<i>Name</i>
								<input type="text" name="Name" placeholder=" " required="">
							</span>
							<span>
								<i>Email</i>
								<input type="email" name="Email" placeholder=" " required="">
							</span>
							<span>
								<i>Subject</i>
								<input type="text" name="Subject" placeholder=" " required="">
							</span>
							<span>
								<i>Message</i>
								<textarea name="Message" placeholder=" " required=""></textarea>
							</span>
							<input type="submit" value="Submit Now">
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-4 w3_agile_mail_right">
				<div class="w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1">
						<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>Mail Us</h3>
						<a href="mailto:info@example.com">info@example.com</a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1">
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>Address</h3>
						<p>PO Box 97845 Baker , Brazil</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="w3layouts_mail_grid_left">
					<div class="w3layouts_mail_grid_left1">
						<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
					</div>
					<div class="w3layouts_mail_grid_left2">
						<h3>Phone</h3>
						<p>+(0121) 121 121</p>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //mail -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<h2><a href="index.html">Monetary</a></h2>
			<h3>(+000) 123 456 789</h3>
			<form action="#" method="post">
				<input type="email" name="email" placeholder="Your email..." required="">
				<input type="submit" value="Subscribe">
			</form>
			<div class="agileits_w3layouts_nav">
				<div class="agileits_w3layouts_nav_left">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="services.html">Services</a></li>
						<li><a href="portfolio.html">Portfolio</a></li>
						<li class="active"><a href="mail.html">Mail Us</a></li>
					</ul>
				</div>
				<div class="agileits_w3layouts_nav_right">
					<ul>
						<li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<p>� 2017 Monetary. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
		</div>
	</div>
<!-- //footer -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smooth-scrolling -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
</body>
</html>