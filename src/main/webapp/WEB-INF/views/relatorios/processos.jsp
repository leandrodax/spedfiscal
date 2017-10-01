<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/resources/jspImport/head.jsp"></c:import>
</head>
<body>
<body>

	<c:import url="/resources/jspImport/header.jsp" />

	<div class="container">


		<c:import url="/resources/jspImport/msg.jsp" />

		<div class="w3_agile_mail_grids_agile">
			<div class="col-md-12 w3_agile_mail_left">
				<div class="agileits_mail_grid_right1 agile_mail_grid_right1">

					<h3 class="w3_agile_head">Relatório de Processos</h3>
					<p class="augue_agile">Confira os arquivos processados e gerados</p>
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label class="control-label">Filtro Tipo de Processo:</label> <select
									class="form-control input-sm" name="filtroTipoProcesso"
									id="filtroTipoProcesso" data-required="true">
									<option value="0">Selecione...</option>
									<option value="1">Emissão Manual</option>
									<option value="2">Emissão Automática</option>
								</select>
							</div>
						</div> 
					</div> 
					<!-- /.col -->
					<div class="row">
						<div class="table-responsive">
							<table class="table table-striped" id="dataTable">
								<thead>
		
									<tr style="text-align: center;">
										<th style="text-align: center;">Data de Emissão</th>
										<th style="text-align: center;">XML</th>
										<th style="text-align: center;">Produtos</th>
										<th style="text-align: center;">Sped Fiscal</th>
		
		
									</tr>
		
								</thead>
								<tbody id="processosManuais">
									<c:forEach var="processo" items="${processosManuais}"
										varStatus="id">
										<tr>
		
											<td>${processo.dataProcessamentoFormatada}</td>
											<td>${processo.nomeFileTXT}</td>
											<td>
												<a data-toggle="modal" data-target="#myModal-${processo.id}"> <input
													type="submit" value="Produtos"
													style="margin: 0px; width: 220px; background: #337ab7; color: #fff; font-size: 14px;"
													onmouseover="this.style.background='#212121'"
													onmouseout="this.style.background='#337ab7'">
												</a>
											</td>
											<td>
												<form action="/SpedFiscal/protected/processos/download/"
													method="POST">
													<input type="hidden" name="arquivo"
														value="${processo.pathTXT}" /> <input type="submit"
														value=" Gerar Sped "
														style="margin: 0px;width: 120px; background: #337ab7; color: #fff; font-size: 14px;"
														onmouseover="this.style.background='#212121'"
														onmouseout="this.style.background='#337ab7'">
		
												</form>
											</td>
										</tr>
		
									</c:forEach>
								</tbody>
								<tbody id="processosAutomaticos">
									<c:forEach var="processo" items="${processosAutomaticos}"
										varStatus="id">
										<tr>
											<td>${processo.dataProcessamentoFormatada}</td>
											<td><a href="">${processo.nomeFileXML}</a></td>
											<td>${processo.nomeFileTXT}</td>
											<td>
												<form action="/SpedFiscal/protected/processos/download/"
													method="POST">
													<input type="hidden" name="arquivo"
														value="${processo.pathTXT}" /> <input type="submit"
														value=" Gerar Sped "
														style="margin: 0px;width: 120px; background: #337ab7; color: #fff; font-size: 14px;"
														onmouseover="this.style.background='#212121'"
														onmouseout="this.style.background='#337ab7'">
		
												</form>
											</td>
										</tr>
		
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				<div class="panel-footer text-left"> 
					<a href="/SpedFiscal/protected/home"> <input type="submit"
						value="Voltar oa menu principal" style="margin: 0px; background: #5cb85c; color: #fff; font-size: 14px;"
						onmouseover="this.style.background='#212121'" onmouseout="this.style.background='#5cb85c'">
					</a>
				</div>
				</div>
				<!-- /.padding-md -->
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<br>
	<c:if test="${not empty processosManuais}">
		<c:forEach var="processo" items="${processosManuais}" varStatus="id">
			<div class="modal fade" id="myModal-${processo.id}">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header"
							style="background-color: #428bca; border-color: #357ebd;">
							<h3 class="modal-title" style="color: white">Produtos</h3>
						</div>
						<div class="modal-body"> 
							<div class="table-responsive">
								<table id="tableRegistros" class="table table-striped">
									<thead>
										<tr class="filters"> 
											<th>Código do Produto</th>
											<th>Descrição do Produto</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach var="produto" items="${processo.produtos}"
												varStatus="idproduto">
												<tr>
													<td>${produto.codProduto}</td>
													<td>${produto.descricao}</td>
												</tr>
											</c:forEach>
									</tbody>
								</table> 
							</div>
						</div>
						<!--modal body-->
						<div class="modal-footer">
							<button type="button" class="btn btn-default " data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</c:forEach>
	</c:if>
	<c:import url="/resources/jspImport/footer.jsp" />
</body>
<script>
	$(document).ready(function() {
		$("#processosManuais").hide();
		$("#processosAutomaticos").hide();

		$("#filtroTipoProcesso").click(function() {
			if ($("#filtroTipoProcesso").val() == "1") {
				$("#processosManuais").show();
				$("#processosAutomaticos").hide();
			} else if ($("#filtroTipoProcesso").val() == "2") {
				$("#processosManuais").hide();
				$("#processosAutomaticos").show();
			} else {
				$("#processosManuais").hide();
				$("#processosAutomaticos").hide();
			}
		});
	});
</script>
</html>
