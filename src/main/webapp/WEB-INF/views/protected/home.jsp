<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/resources/jspImport/head.jsp"></c:import>
</head>
	
<body>

<c:import url="/resources/jspImport/home_header.jsp"></c:import>
 
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<div class="w3_agileits_banner_bottom_grids">
				<div class="col-md-6 w3_agileits_banner_bottom_grid">
					<h3>Pontos Importantes <span>SPED FISCAL WS</span></h3>
					<div class="wthree_banner_btm_grid">
						<div class="wthree_banner_btm_grid1">
							<h4>Usabilidade</h4>
							<p>Possui menus e telas intuitivas proporcionando uma boa usabilidade e
							facilitando aos usuários.</p>
							<div class="wthree_banner_btm_grid1_pos">
								<i class="fa fa-cogs" aria-hidden="true"></i>
							</div>
						</div>
						<div class="wthree_banner_btm_grid1">
							<h4>Responsivo</h4>
							<p>Site adaptado com ferramentas de ótima qualidade para qualquer usuário
							possa acessar de qualquer plataforma.</p>
							<div class="wthree_banner_btm_grid1_pos">
								<i class="fa fa-desktop" aria-hidden="true"></i>
							</div>
						</div>
						<div class="wthree_banner_btm_grid1">
							<h4>Suporte</h4>
							<p>Equipe de suporte epecializada disponível 24h para atendimento ao cliente.
							Contatos por telefone, email, videoconferência e chat.</p>
							<div class="wthree_banner_btm_grid1_pos">
								<i class="fa fa-comments fa-5x" aria-hidden="true"></i>
							</div>
						</div>
						<div class="wthree_banner_btm_grid1">
							<h4>Confiabilidade</h4>
							<p>Sistema autenticado com informações e fontes retiradas diretamente da Receita Federal.</p>
							<div class="wthree_banner_btm_grid1_pos">
								<i class="fa fa-file" aria-hidden="true"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 w3_agileits_banner_bottom_grid_right">
					<div class="slider">
						<ul class="slides">
							<li class="slide">
								<figure>
									<img src="<c:url value='/resources/resource_monetery/images/sped_fiscal/entenda-o-sped.jpg'/>" alt=" " class="img-responsive" />
								</figure>
							</li>
							<li class="slide">
								<figure>
									<img src="<c:url value='/resources/resource_monetery/images/sped_fiscal/modelo_efd.jpg'/>" alt=" " class="img-responsive" />
								</figure>
							</li>
							<li class="slide">
								<figure>
									<img src="<c:url value='/resources/resource_monetery/images/SPED-2.jpg'/>" alt=" " class="img-responsive" />
								</figure>
							</li>
							<li class="slide">
								<figure>
									<img src="<c:url value='/resources/resource_monetery/images/sped_fiscal/mentorias.jpg'/>" alt=" " class="img-responsive" />
								</figure>
							</li>						
							<li class="slide">
								<figure>
									<img src="<c:url value='/resources/resource_monetery/images/spedB.jpg'/>" alt=" " class="img-responsive" />
								</figure>
							</li>						
							<li class="slide">
								<figure>
									<img src="<c:url value='/resources/resource_monetery/images/Noticia_Bloko K_ICMS_NFE_e-SOCIAL_2017.jpg'/>" alt=" " class="img-responsive" />
								</figure>
							</li>
						</ul>
					</div> 
				</div>
				<div class="clearfix"></div>
				<script type="text/javascript">
					$(function(){
					  $('.slider').glide({
						autoplay: 3500,
						hoverpause: true, // set to false for nonstop rotate
						arrowRightText: '&rarr;',
						arrowLeftText: '&larr;'
					  });
					});
				</script>
			</div>
		</div>
	</div>
<!-- //banner-bottom -->
<!-- about -->
	<div class="about" id="about">
		<div class="col-md-6 agileinfo_about_left">	
			<img src="<c:url value='/resources/resource_monetery/images/6.jpg'/>" alt=" " class="img-responsive" />
		</div>
		<div class="col-md-6 agileinfo_about_right">
			<h3>Quem somos nós</h3>
			<p>Grupo acadêmico com interesse em entrar para o mercado com um produto desenvolvido a 
			partir de um projeto de TCC. A ideia de criar Serviço Web de emissão de Sped Fiscal partiu 
			de um dos integrantes que possui experiência em desenvolvimento de softwares na área contábil. 
			Com contribuições de cada um dos integrantes o projeto iniciou-se no mês de agosto de 2016  
			tendo como finalidade, automatizar o trabalho realizado pela contabilidade, proporcionando maior 
			exatidão ao fazer uma declaração à Receita Federal.</p>
		</div>
		<div class="clearfix"> </div>
	</div>
<!-- //about -->

<!-- testimonials -->
	<div class="testimonials">
		<div class="container">
			<h3 class="w3_agile_head">Desenvolvedores</h3>
			<p class="augue_agile"></p>
			<div class="w3_agileits_testimonial_grids">
				<section class="slider">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div class="w3_agileits_testimonial_grid">
									<p><i class="fa fa-quote-right" aria-hidden="true"></i>Nascido em São Paulo, 1993, é graduado em Análise e 
									Desenvolvimento de Sistemas. Aos 18 anos se formou no curso Técnico de Informática pela ETEC onde modelou 
									e desenvolveu pequenas aplicações mobile e web. Atua na área de TI como Analista/Desenvolvedor de Sistemas atendendo 
									demandas de grandes empresas como Itaú, Honda, Alelo, entre outras.</p>
									<img src="<c:url value='/resources/resource_monetery/images/roney.png'/>" alt=" " class="img-responsive" />
									<h4>Roney Amorim <span>Analista/ Desenvolvedor Java</span></h4>
								</div>
							</li>
							<li>
								<div class="w3_agileits_testimonial_grid">
									<p><i class="fa fa-quote-right" aria-hidden="true"></i> Nascido em São Paulo, 1992,
									 é graduado em analise e desenvolvimento de sistemas, começou a carreira profissional
									  na área de vendas e marketing digital. Atualmente ocupa o cargo de supervisor 
									  administrativo atuando na área de transportes e mobilidade urbana, prestando suporte
									   a serviços e atendimento as empresas parceiras tanto do setor privado como Uber, 
									   99, Azul e do setor público como transpass e transkuba.</p>
									<img src="<c:url value='/resources/resource_monetery/images/joaci.png'/>" alt=" " class="img-responsive" />
									<h4>Joaci Reis<span>Analista/ Desenvolvedor Java</span></h4>
								</div>
							</li> 
						</ul>
					</div>
				</section>
				<!-- flexSlider -->

					<script type="text/javascript">
					$(window).load(function(){
					  $('.flexslider').flexslider({
						animation: "slide",
						start: function(slider){
						  $('body').removeClass('loading');
						}
					  });
					});
				  </script>
				<!-- //flexSlider -->
			</div>
		</div>
	</div>
<!-- //testimonials -->


<c:import url="/resources/jspImport/footer.jsp"></c:import>
