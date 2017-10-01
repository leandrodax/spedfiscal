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
						
						<h3 class="w3_agile_head">Lista de Produtores</h3>
						<p class="augue_agile"> </p>
						<table class="table table-striped" id="dataTable">
							<thead>
								<tr>
									<th>Identificador</th> 
									<th>Codigo</th> 
									<th>Nome</th> 
									<th colspan="2">Ação</th> 
								</tr>
							</thead>
							<tbody>
							<c:forEach var="produtor" items="${produtor}" varStatus="id">
								<tr>
									<td>${produtor.id}</td>
									<td>${produtor.codProdutor}</td>
									<td>${produtor.nome}</td>
									<td><h4><a href="/SpedFiscal/protected/produtor/alterar?id=${produtor.id}"><i class="fa fa-edit" aria-hidden="true"></i></a></h4></td>
									<td><h4><a href="/SpedFiscal/protected/produtor/deletar?id=${produtor.id}"><i class="fa fa-times" aria-hidden="true"></i></a></h4></td>	
										
								</tr>
							</c:forEach> 
							</tbody>
						</table> 
						<div class="panel-footer text-left">
							 <a href="/SpedFiscal/protected/produtor/adicionar"> <input type="submit"
								value=" Inserir novo produtor" style="margin: 0px; background: #5cb85c; color: #fff; font-size: 14px;"
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
