<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 <!-- footer -->
	<div class="footer">
		<div class="container">
			<h2><a href="index.html">Sped Fiscal</a></h2>
			<h3>(11) 4774 - 5288</h3>
			<form action="#" method="post">
				<input type="email" name="email" placeholder="Informe seu email e receba nossos newsletters" required="">
				<input type="submit" value="Enviar">
			</form>
			<div class="agileits_w3layouts_nav">
				<div class="agileits_w3layouts_nav_left">
					<ul>
						<li class="active"><a href="/SpedFiscal/">Home</a></li>
						<li><a href="<c:url value='/protected/sped/automatico'/>">SpedFiscal</a></li>
						<li><a href="<c:url value='/protected/produto/listar'/>"/>Produtos</a></li>
						<li><a href="<c:url value='/protected/produtor/listar'/>"/>Produtores</a></li>
						<li><a href="<c:url value='/protected/relatorios/processos'/>">Processos</a></li>
						<li><a href="<c:url value='/contato'/>">Entre em Contato</a></li>
					</ul>
				</div>
				<div class="agileits_w3layouts_nav_right">
					<ul>
						<li><a href="" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
						<li><a href="" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						<li><a href="" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<p>2017 Sped Fiscal Web Service.| Design by <a href="https://www.linkedin.com/in/roney-augusto-amorim-b94342100">Roney Amorim</a></p>
		</div>
	</div>
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