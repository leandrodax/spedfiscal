 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/resources/jspImport/head.jsp"></c:import>
</head>
<body>

<c:import url="/resources/jspImport/header.jsp" />
		<div class="container">
			 
		<c:import url="/resources/jspImport/msg.jsp" />

			<div class="w3_agile_mail_grids_agile">
				<div class="col-md-12 w3_agile_mail_left">
					<div class="agileits_mail_grid_right1 agile_mail_grid_right1"> 
						
						<h3 class="w3_agile_head">Cadastro  de Produtos</h3>
						<p class="augue_agile">Preencha o formulário abaixo
						<br>e cadastre seu produto</p>
						
						<form class="no-margin" id="formValidate2" data-validate="parsley" method="POST" action="/SpedFiscal/protected/produto/inserir">
							<input type="hidden" name="blocoTipoProduto" id="blocoTipoProduto">
							<div class="panel-body">
								<div class="row">								  
									<div class="col-md-2">
										<div class="form-group" id="inicial">
							   				<label for="codigo_produto">Codigo Produto:</label>
							    			<input type="text" class="form-control" id="codProduto" name="codProduto" >
								  		</div>
									</div>
								</div>	
								<div class="row">	
									<div class="col-md-4">	
								  		<div class="form-group">
									   		<label for="desc_produto">Descrição Produto:</label>
									    	<input type="text" class="form-control" name="descricao" id="descricao" >
									  	</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="control-label">Tipo do Produto:</label>
											<select class="form-control input-sm" name="tipoProduto" id="tipoProduto" data-required="true">
												<option value="0">Mercadoria para Revenda</option>
												<option value="1">Matéria-Prima</option>
												<option value="2">Embalagem</option>
												<option value="3">Produto em Processo</option>
												<option value="4">Produto Acabado</option>
												<option value="5">Subproduto</option>
												<option value="6">Produto Intermediário</option>
												<option value="7">Material de Uso e Consumo</option>
												<option value="8">Ativo Imobilizado</option>
												<option value="9">Serviços</option>
												<option value="10">Outros Insumos</option>
												<option value="99">Outras</option> 
											</select>
										</div>
									</div><!-- /.col -->
									<div class="col-md-4">
										<div class="form-group">
											<label class="control-label">Posse:</label>
											<select class="form-control input-sm" name="posse" id="posse" data-required="true">
												<option value="0">Propriedade do informante/posse do informante</option>
												<option value="1">Propriedade de informante/posse do terceiros</option>
												<option value="2">Propriedade do terceiros/posse de informante</option>
											</select>
										</div>
									</div><!-- /.col -->
								</div>		
								<div class="row">									
									<div class="col-md-3" id="dataProducaoDiv">
										  <div class="form-group"> 
										    <label for="data_producao">Data de Produção:</label>
										    <input type="date" class="form-control" name="dataProducao" id="dataProducao">
										  </div>
									</div> 
									<div class="col-md-3" id="dataSaidaEstoqueDiv"> 
										  <div class="form-group">
										    <label for="data_estoque_atual">Data de Saída do Estoque:</label>
										    <input type="date" class="form-control" name="dataSaidaEstoque" id="dataSaidaEstoque" >
										  </div>
									</div>
								</div> 
								<div class="row"> 
									<div class="col-md-3">
										  <div class="form-group">
										    <label for="qtd_produto">Quantidade em Estoque:</label>
										    <input type="number" class="form-control" id="qtdEstoque" name="qtdEstoque" >
										  </div>
									</div>
									<div class="col-md-3">
										  <div class="form-group">
										    <label for="desc_produto">Quantidade Produzida:</label>
										    <input type="number" class="form-control" name="qtdProduzida" id="qtdProduzida" >
										  </div>
									</div> 
								</div>
								<div class="row"> 
									<div class="col-md-3" id="codItemDestinoDiv">
										  <div class="form-group"> 
										    <label for="ali_ipi">Código do Item Destino:</label>
										    <input type="text" class="form-control" id="codItemDestino" name="codItemDestino" >
										  </div>
									</div>
									<div class="col-md-3" id="ordemProducaoDiv">
										  <div class="form-group"> 
										    <label for="ali_ipi">Ordem de Produção:</label>
										    <input type="text" class="form-control" id="ordemProducao" name="ordemProducao" >
										  </div>
									</div>
								</div><!-- /.row -->
								<div class="row" id="produtorRow">  
									<div class="col-md-2">
										<div class="form-group">
											<label class="control-label">Produtor:</label>
											<select class="form-control input-sm" data-required="true" name="codProdutor">
												<option value="1">Selecione...</option>
												<c:forEach var="produtor" items="${produtores}" varStatus="id">
													<option value="${produtor.id}">${produtor.codProdutor} - ${produtor.nome}</option>
												</c:forEach>
											</select>
										</div>
									</div><!-- /.col -->
									<div class="col-md-2">
										<div class="form-group">
											<label class="control-label"><br></label>
											<div class="button-link" style=" float:left">
												<a href="/SpedFiscal/protected/produtor/adicionar"  style="margin: 0px; width:380px;background:#5cb85c;color: #fff;font-size: 14px;"
												onmouseover="this.style.background='#212121'"  onmouseout="this.style.background='#5cb85c'">&nbsp &nbsp &nbsp &nbsp Cadastrar novo produtor &nbsp &nbsp &nbsp &nbsp</a>
										  	</div>  
										</div>
									</div><!-- /.col --> 
								</div> 
							</div>
							<div class="panel-footer text-left">
								<input type="submit" value="Salvar" style="margin: 0px;background:#5cb85c;color: #fff;font-size: 14px;"
								onmouseover="this.style.background='#212121'"  onclick="return save();" onmouseout="this.style.background='#5cb85c'">
					   		</div>		
						</form>
					</div><!-- /.padding-md -->
			 	</div>
			</div>			 
		<div class="clearfix"> </div>
	</div> 
	<br> 
	<c:import url="/resources/jspImport/footer.jsp" />
	<script>
	$(document).ready(function(){
  
		$("#dataSaidaEstoqueDiv").hide();  
		$("#ordemProducaoDiv").hide();
		$("#codItemDestinoDiv").hide();
		$("#produtorRow").hide();
		
		$("#posse").change(function(){
			if($("#posse").val() == "0"){    
				$("#dataSaidaEstoqueDiv").hide(); 
				$("#ordemProducaoDiv").hide();
				$("#codItemDestinoDiv").hide();		
				$("#produtorRow").hide();
				
				$("#blocoTipoProduto").val("k235");
			}else if($("#posse").val() == "1"){  
				$("#dataSaidaEstoqueDiv").show();  
				$("#ordemProducaoDiv").hide();
				$("#codItemDestinoDiv").hide(); 
				$("#produtorRow").show();
				
				$("#blocoTipoProduto").val("k255");
			}else if($("#posse").val() == "2"){ 
				$("#codItemDestinoDiv").show(); 
				$("#ordemProducaoDiv").show();  
				$("#dataSaidaEstoqueDiv").hide(); 	
				$("#produtorRow").show();
				
				$("#blocoTipoProduto").val("k230");
			} 
		});
	});
	function validaform(){
		var flag = false;
		$("input, select").each(function(){
			if($(this).val()==""){
				$(this).css("border","solid 1px red");
				flag = true;
			}else{
				$(this).css("border","solid 1px green");
			}
		});	
		if(flag){
			alert("Campos Obrigatórios *")
			return false;
		}
	}
	</script>
	

</body>
</html>