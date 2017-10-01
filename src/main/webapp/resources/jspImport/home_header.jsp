<!-- Overlay Div -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h1><a class="navbar-brand" href="<c:url value='/protected/home'/>">Sped Fiscal <h4 style="float:right">WebService</h4></a></h1>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav class="cl-effect-13" id="cl-effect-13">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Sped Fiscal <b class="caret"></b></a>
								<ul class="dropdown-menu agile_short_dropdown">
									<li><a href="<c:url value='/protected/sped/manual'/>/">Emitir Manual</a></li>
									<li><a href="<c:url value='/protected/sped/automatico'/>">Emitir Automático</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Produtos<b class="caret"></b></a>
								<ul class="dropdown-menu agile_short_dropdown">
									<li><a href="<c:url value='/protected/produto/listar'/>">Listar</a></li>
									<li><a href="<c:url value='/protected/produto/adicionar'/>">Inserir</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Produtores<b class="caret"></b></a>
								<ul class="dropdown-menu agile_short_dropdown">
									<li><a href="<c:url value='/protected/produtor/listar'/>">Listar</a></li>
									<li><a href="<c:url value='/protected/produtor/adicionar'/>">Inserir</a></li>
								</ul>
							</li>  
							<li><a href="<c:url value='/protected/relatorios/processos'/>">Processos</a></li> 
						</ul> 
						<div class="w3_agile_login"> 
							<a href="#small-dialog" title="${usuario.representante}" class="play-icon popup-with-zoom-anim"><h5><b>${usuario.represReduzido}</b></h5><center><i class="fa fa-user" aria-hidden="true"></i></center></a>
						</div> 
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
		<h3>Olá ${usuario.representante}</h3>		
		<div class="agileits_modal_body"> 
				<div class="agileits_w3layouts_user">  
					${usuario.razaoSocial}    
				</div>
				<div class="agileits_w3layouts_user">
					${usuario.email}
				</div> 
				<div class="agileits_w3layouts_user"> 
					<a href="#small-dialog1" class="play-icon popup-with-zoom-anim">
						<input type="submit" value="Gerenciar Perfil">
					</a>
					<a href="/SpedFiscal/usuario/fazerLogoff">				
						<input type="submit" value="Sair" style="background:#e74c3c;color: #fff;font-size: 14px;"
						onmouseover="this.style.background='#212121'" onmouseout="this.style.background='#e74c3c'">
					</a>  
				</div>  
		</div>
	</div>
	<div id="small-dialog1" class="mfp-hide w3ls_small_dialog wthree_pop">
		<h3>Cadastre-se</h3>		
		<div class="agileits_modal_body">
			<form action="#" method="post">
				<h4>Informação do Perfil:</h4>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="cnpj" id="cnpj" placeholder="CNPJ" value="${usuario.cnpj}">					
				</div>
				<div class="agileits_w3layouts_user"> 				
					<input type="submit" value="Buscar por CNPJ" onclick="return consultaCnpj();">	 
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="razaoSocial" id="razaoSocial" placeholder="Razao Social" value="${usuario.razaoSocial}">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="fantasia" id="fantasia" placeholder="Nome Fantasia" value="${usuario.fantasia} ">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="logradouro" id="logradouro" placeholder="Logradouro" value="${usuario.logradouro} ">

				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="numero" id="numero" placeholder="Número" value="${usuario.numero} ">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="complemento" id="complemento" placeholder="Complemento" value="${usuario.complemento} ">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="bairro" id="bairro" placeholder="Bairro" value="${usuario.bairro} ">
				</div><br> 
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="cep" id="cep" placeholder="CEP" value="${usuario.cep} ">
				</div><br> 
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="cidade" id="cidade" placeholder="Cidade" value="${usuario.cidade} ">
				</div><br> 
				<div class="agileits_w3layouts_user">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
					<input type="text" name="estado"  id="estado" placeholder="Estado" value="${usuario.estado} ">
				</div> 
				<br> 
				<h4>Informação do Login:</h4>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-user" aria-hidden="true"></i>
					<input type="email" name="representante" id="representante" placeholder="Representante" value="${usuario.representante} ">
				</div><br>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-envelope-o" aria-hidden="true"></i>
					<input type="email" name="email" id="email" placeholder="E-mail" value="${usuario.email} ">
				</div>
				<div class="agileits_w3layouts_user agileits_w3layouts_user_agileits">
					<i class="fa fa-key" aria-hidden="true"></i>
					<input type="password" name="senha" id="senha" placeholder="Nova Senha" required="">
				</div>
				<div class="agileits_w3layouts_user">
					<i class="fa fa-key" aria-hidden="true"></i>
					<input type="password" id="cSenha" placeholder="Confirme sua senha" required="">
				</div><br>
				<input type="submit" value="Register">
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