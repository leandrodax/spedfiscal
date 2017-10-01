<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/resources/jspImport/publica_head.jsp"></c:import>
<script>
$(document).ready(function(){
$("#formPessoaFisica").hide();
$("#formPessoaJuridica").hide();	
});
function filtro() {
	if($("#filtro").val()== 1){
		$("#formPessoaJuridica").hide();
		$("#formPessoaFisica").show();
	}else if($("#filtro").val()== 2){
		$("#formPessoaFisica").hide();
		$("#formPessoaJuridica").show();
	}
}
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

<c:import url="/resources/jspImport/publica_header.jsp" />
<!-- Conteúdo--> 
  	<div id="breadcrumb">
		<ul class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="index.jsp">
					Login</a></li>
		</ul>
	</div>
	<div class="login-wrapper">
		<div class="tab-pane fade in active" id="research">
			<div class="panel panel-default table-responsive">
				<div class="text-center">  
					<h2 class="fadeInUp animation-delay8" style="font-weight:bold">
					<span class="text-success">Sped Fiscal</span> <span style="color:#ccc; text-shadow:0 1px #fff">Web Service</span>
					</h2>
				</div>
				<div class="login-widget animation-delay1">	
					<div class="panel panel-default">
						<div class="panel-heading clearfix">
							<div class="pull-left">
								<i class="fa fa-lock fa-lg"></i> Cadastro de Usuário
							</div> 
							<div class="panel-body">
								<label>Selecione um Formulário</label>
								<select id="filtro" onchange="filtro()" class="form-control input-sm">
									<option value="">Selecione...</option>
									<option value="1">Pessoa Física</option>
									<option value="2">Pessoa Jurídica</option>
								</select>
								<form class="form-login" id="formPessoaFisica" action="/SpedFiscal/insereUsuario" method="POST">
									<div class="form-group">
										<label>Nome</label>
										<input type="text" name="nome" placeholder="Digite seu nome" class="form-control input-sm" >
									</div>
									<div class="form-group">
										<label>CPF</label>
										<input type="number" name="cpf" placeholder="Digite seu CPF" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Data de Nascimento</label>
										<input type="date" name="dtNascimento" placeholder="Digite a data de nascimento" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>E-mail</label>
										<input type="email" name="email" placeholder="Digite seu e-mail" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Senha</label>
										<input type="password" name="senha" placeholder="Digite sua senha" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Confirme Senha</label>
										<input type="password" name="conf_senha" placeholder="Confirme a sua senha" class="form-control input-sm">
									</div>
									  
									<hr/>
										
									
									<input type="submit" class="btn btn-success btn-sm pull-right" value="Confirmar"/>
									<a class="btn btn-success login-link pull-left" href="/SpedFiscal/"><i class="fa fa-sign-out"></i> Cancelar</a>
								</form> 
								<form class="form-login" id="formPessoaJuridica" action="/SpedFiscal/insereUsuario" method="POST">
									<div class="form-group">
										<label>CNPJ</label>
										<input type="text" name="cnpj" id="cnpj" placeholder="Digite o CNPJ" class="form-control input-sm" >
										<br>
										<button onclick="return consultaCnpj();" class="btn btn-success btn-sm pull-left">Buscar Por CNPJ</button>
									</div> 
									<br>
									<div class="form-group">
										<label>Razão Social</label>
										<input type="text" name="razaoSocial" id="razaoSocial" placeholder="Digite a Razão Social" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Nome Fantasia</label>
										<input type="text" name="fantasia" id="fantasia" placeholder="Digite o Nome Fantasia" class="form-control input-sm">
									</div>							
									<div class="form-group">
										<label>Logradouro</label>
										<input type="text" name="logradouro" id="logradouro" placeholder="Digite a Logradouro" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Número</label>
										<input type="text" name="numero" id="numero" placeholder="Digite o Número" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Complemento</label>
										<input type="text" name="complemento" id="complemento" placeholder="Digite o Complemento" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Bairro</label>
										<input type="text" name="bairro" id="bairro" placeholder="Digite o Bairro" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Cep</label>
										<input type="text" name="cep" id="cep" placeholder="Digite o CEP" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Cidade</label>
										<input type="text" name="cidade" id="cidade" placeholder="Digite a Cidade" class="form-control input-sm">
									</div>
									
									<div class="form-group">
										<label>Estado</label>
										<input type="text" name="estado" id="estado" placeholder="Digite o Estado" class="form-control input-sm">
									</div> 
									<hr/>
									<div class="form-group">
										<label>Representante</label>
										<input type="text" name="representante" placeholder="Digite seu nome" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>E-mail</label>
										<input type="email" name="email" placeholder="Digite seu e-mail" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Senha</label>
										<input type="password" name="senha" placeholder="Digite sua senha" class="form-control input-sm">
									</div>
									<div class="form-group">
										<label>Confirme Senha</label>
										<input type="password" name="conf_senha" placeholder="Confirme a sua senha" class="form-control input-sm">
									</div>
									  
									<hr/>
										
									
									<input type="submit" class="btn btn-success btn-sm pull-right" value="Confirmar"/>
									<a class="btn btn-success btn-sm pull-left" href="/SpedFiscal/"><i class="fa fa-sign-out"></i> Cancelar</a>
								</form>
							</div>
						</div><!-- /panel -->
					</div><!-- /login-widget -->
				</div>
			</div> 
		</div>  
  </body>
</html>
