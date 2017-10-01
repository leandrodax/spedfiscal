<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
 
<c:import url="/resources/jspImport/head.jsp"></c:import>

<style>

.btn_cnpj{
	outline:none;
	border:none;
	background:#212121;
	color:#fff;
	font-size:14px;
	text-transform:uppercase;
	padding:10px 0;
	width:40%;
}
.btn_cnpj:hover{
	background:#1bd6f2;
	cursor:pointer;
}

</style>
<script> 
function consultaCnpj() {

    var cnpj = $("#cnpj").val().replace(/\D/g, '');

            //Verifica se campo cnpj possui valor informado.
            if (cnpj != "") {

                //Expressão regular para validar o CNPJ.
                var validacnpj = /^[0-9]/;

                //Valida o formato do CNPJ.
                if(validacnpj.test(cnpj)) {
				    $.ajax({
				        type: "GET",
				        url: "http://receitaws.com.br/v1/cnpj/"+ cnpj,
				        contentType: "application/json; charset=utf-8",
				        dataType: "jsonp",
				        success: function (dados) {
				                if (!("erro" in dados)) {
				                            //Atualiza os campos com os valores da consulta.
				                            $("#cnpj").val(dados.cnpj); 
				                            $("#razaoSocial").val(dados.nome);
				                            $("#fantasia").val(dados.fantasia);
				                            $("#logradouro").val(dados.logradouro);
				                            $("#complemento").val(dados.complemento);
				                            $("#bairro").val(dados.bairro);
				                            $("#numero").val(dados.numero);
				                            $("#cep").val(dados.cep);
				                            $("#cidade").val(dados.municipio);
				                            $("#estado").val(dados.uf);  
				                        } //end if.
				                        else {
				                            //Cnpj pesquisado não foi encontrado.
				                            limpa_formulário_cnpj();
				                            alert("CNPJ não encontrado.");
				                        }
				        },
				        error: function(e){
				            alert(e.statusText);  
				            return false;
				        }       
				    });

             
                } //end if.
                else {
                    //cnpj é inválido.
                    limpa_formulário_cnpj();
                    alert("Formato de CNPJ inválido.");
                    return false;
                }
            } //end if.
            else {
                
                
            }
            return false;
       
    }
</script>

</head>
	
<body>
<!-- banner -->
	<div class="banner">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1><a class="navbar-brand" href="/SpedFiscal/">Sped Fiscal <h4 style="float:right">WebService</h4></a></h1>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav class="cl-effect-13" id="cl-effect-13">
						<ul class="nav navbar-nav">
							<li class="active"><a href="/SpedFiscal/">Home</a></li>
							<li class=""><a href="<c:url value='/contato'/>">Entre em Contato</a></li>
						</ul>	
						<ul class="nav navbar-nav navbar-right">							
						<div class="w3_agile_login">
							<a href="#small-dialog" class="play-icon popup-with-zoom-anim"><i class="fa fa-user" aria-hidden="true"></i></a>
						</div> 
						</ul>
					</nav>
				</div>
			</nav>
			<div class="agileits_w3layouts_banner_info">
				<h2>Controle Contábil</h2><br><h2> em suas mãos</h2>  
			<!--
				<div class="agileits_w3layouts_banner_info_pos">
					<ul>
						<li><a href="#">Facebook</a></li>
						<li><a href="#">Instagram</a></li>
						<li><a href="#">Linkedin</a></li>
					</ul>
				</div>
				<div class="agileits_w3layouts_banner_info_pos1">
					<h4>spedfiscalwebservice@gmail.com</h4>
				</div>
			-->
			</div>
			<div class="thim-click-to-bottom">
				<a href="#about" class="scroll">
					<i class="fa  fa-chevron-down"></i>
				</a>
			</div>
		</div>
	</div>
<!-- //banner -->	

<!-- pop-up-box -->
	<div id="small-dialog" class="mfp-hide w3ls_small_dialog wthree_pop">
		<h3>Faça seu login</h3>		
		<div class="agileits_modal_body">
			<form action="/SpedFiscal/verificaAcesso" method="post">
				<div class="agileits_w3layouts_user">
					<i class="fa fa-user" aria-hidden="true"></i>
					<input  type="text" id="email" name="email"  placeholder="E-mail" required="">
				</div>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-key" aria-hidden="true"></i>
					<input type="password"id="senha" name="senha" placeholder="********" required="">
				</div>
				<div class="agile_remember">
					<div class="agile_remember_left">
						<div class="check">
							<label class="checkbox"><input type="checkbox" name="checkbox"><i> </i>Sempre me lembrar</label>
						</div>
					</div>
					<div class="agile_remember_right">
						<a href="#">Esqueceu sua senha?</a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<input type="submit" value="Acessar">
			</form>
			<h5>Não possui uma conta? <a href="#small-dialog1" class="play-icon popup-with-zoom-anim">Cadastre-se</a></h5>
		</div>
	</div>
	<div id="small-dialog1" class="mfp-hide w3ls_small_dialog wthree_pop">
		<h3>Cadastre-se</h3>		
		<div class="agileits_modal_body">
			<form action="/SpedFiscal/insereUsuario" method="POST">
				<h4>Informação do Perfil:</h4>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="cnpj" id="cnpj" placeholder="CNPJ" required="">					
				</div>
				<div class="agileits_w3layouts_user"> 				
					<a class="btn_cnpj" onclick="return consultaCnpj();"> Buscar por CNPJ </a>
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="razaoSocial" id="razaoSocial" placeholder="Razao Social" required="">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="fantasia" id="fantasia" placeholder="Nome Fantasia">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="logradouro" id="logradouro" placeholder="Logradouro" required="">

				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="numero" id="numero" placeholder="Número" required="">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="complemento" id="complemento" placeholder="Complemento">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="bairro" id="bairro" placeholder="Bairro" required="">
				</div><br> 
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="cep" id="cep" placeholder="CEP" required="">
				</div><br> 
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="cidade" id="cidade" placeholder="Cidade" required="">
				</div><br> 
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="estado"  id="estado" placeholder="Estado" required="">
				</div> 
				<br> 
				<h4>Informação do Login:</h4>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-user" aria-hidden="true"></i>
					<input type="text" name="representante" id="representante" placeholder="Representante" required="">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-envelope-o" aria-hidden="true"></i>
					<input type="email" name="email" id="email" placeholder="E-mail" required="">
				</div>
				<div class="agileits_w3layouts_user agileits_w3layouts_user_agileits">
					<i class="fa fa-key" aria-hidden="true"></i>
					<input type="password" name="senha" id="senha" placeholder="Senha" required="">
				</div>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-key" aria-hidden="true"></i>
					<input type="password" id="cSenha" placeholder="Confirme sua senha" required="">
				</div><br>
				<input type="submit" value="Confirmar">
			</form> 
		</div>
	</div>
<!-- //pop-up-box -->
<script>
	$(document).ready(function() {
	$('.popup-with-zoom-anim').magnificPopup({
		type: 'inline',
		fixedContentPos: true,
		fixedBgPos: false,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});
																	
	});
</script>
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<c:if test="${not empty msgErro}">
				<div class="modal fade" id="myModal">
					<div class="modal-dialog" >  
						<div class="alert alert-danger fade in alert-dismissable">
							<a href="#" class="close"  data-dismiss="modal" aria-label="close" title="close">
								<i class="fa fa-times" aria-hidden="true"></i>
							</a>
							<strong>Sessão Invalidada.</strong>
					        <hr class="message-inner-separator">
							<h4><c:out value="${msgErro}"></c:out></h4>
						</div>							  
					</div><!-- /.modal-dialog -->
			 	</div><!-- /.modal -->
			 	<script>
					$(document).ready(function(){
						$("#myModal").modal("show");  				 
					});
				</script>
			</c:if>		
			<c:if test="${not empty msgError}">
				<div class="modal fade" id="myModal">
					<div class="modal-dialog" >  
						<div class="alert alert-danger fade in alert-dismissable">
							<a href="#" class="close"  data-dismiss="modal" aria-label="close" title="close">
								<i class="fa fa-times" aria-hidden="true"></i>
							</a>
							<strong>Erro 192.03</strong>
					        <hr class="message-inner-separator">
							<h4><c:out value="${msgError}"></c:out></h4>
						</div>							  
					</div><!-- /.modal-dialog -->
			 	</div><!-- /.modal -->
			 	<script>
					$(document).ready(function(){
						$("#myModal").modal("show");  				 
					});
				</script>
			</c:if>		  
				
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
									<h4>Roney Amorim <span>Analista/ Desenvolvedor Java - Fullstack Enginer</span></h4>
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
<div class="footer">
		<div class="container">
			<h2><a href="index.html">Sped Fiscal WS</a></h2>
			<h3>(11) 4774 - 5288</h3>
			<form action="#" method="post">
				<input type="email" name="email" placeholder="Informe seu email e receba nossos newsletters" required="">
				<input type="submit" value="Enviar">
			</form>
			<div class="agileits_w3layouts_nav">
				<div class="agileits_w3layouts_nav_left">
					<ul>
						<li class="active"><a href="/SpedFiscal/">Home</a></li>
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
 