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
						
						<h3 class="w3_agile_head">Lista  de Produtos</h3>
						<p class="augue_agile"></p>
						<div class="table-responsive">
							<table class="table table-striped" id="dataTable">
								<thead>
									<tr>
										<th>Codigo Produto</th>
										<th>Descrição Produto</th>
										<th>Data de Produção</th>
										<th>Data Saída Estoque</th>
										<th>Quantidade Produto</th>
										<th>Quantidade Produzida</th>
										<th>Tipo do Produto</th>
										<th>Posse</th>
										<th>Ordem de Produção</th>  
										<th>Produtor</th>
										<th>Usuário</th>
										<th colspan="2">Ação</th>
	 
									</tr>
								</thead>
								<tbody>
									<c:forEach var="produto" items="${produtos}" varStatus="id">
										<tr>
														
											<td>${produto.codProduto}</td>
											<td>${produto.descricao}</td>
											<td>${produto.dataProducaoFormatada}</td>
											<td>${produto.dataSaidaEstoqueFormatada}</td>
											<td>${produto.qtdEstoque}</td>
											<td>${produto.qtdProduzida}</td>
											<td>${produto.tipoProduto}</td>
											<td>${produto.posse}</td>
											<td>${produto.ordemProducao}</td>  
											<td>${produto.produtor.nome}</td>
											<td>${produto.usuario.represReduzido}</td>
											<td><h4><a href="/SpedFiscal/protected/produto/altera?id=${produto.id}"><i class="fa fa-edit" aria-hidden="true"></i></a></h4></td>
											<td><h4><a href="/SpedFiscal/protected/produto/deletar?id=${produto.id}"><i class="fa fa-times" aria-hidden="true"></i></a></h4></td>
										</tr>
													
									</c:forEach>
								</tbody>
							</table>
						</div>	
						<div class="panel-footer text-left">
							 <a href="/SpedFiscal/protected/produto/adicionar"> <input type="submit"
								value=" Inserir novo produto" style="margin: 0px; background: #5cb85c; color: #fff; font-size: 14px;"
								onmouseover="this.style.background='#212121'" onmouseout="this.style.background='#5cb85c'">
							</a>
							<a href="/SpedFiscal/protected/home"> <input type="submit"
								value="Voltar oa menu principal" style="margin: 0px; background: #5cb85c; color: #fff; font-size: 14px;"
								onmouseover="this.style.background='#212121'" onmouseout="this.style.background='#5cb85c'">
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>  
		
 
	<c:import url="/resources/jspImport/footer.jsp" />
	

</body>
</html>