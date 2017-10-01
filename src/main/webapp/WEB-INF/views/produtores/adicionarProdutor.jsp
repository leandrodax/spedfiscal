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
						
						<h3 class="w3_agile_head">Cadastro de Produtores</h3>
						<p class="augue_agile"> </p>
						<form class="no-margin" id="formValidate2" action="/SpedFiscal/protected/produtor/insere" data-validate="parsley" method="POST">
							<div class="panel-heading">
							</div>
							<div class="panel-body">
								<div class="row">								  
									<div class="col-md-3">
										<div class="form-group">
							   				<label for="codigo_produto">Codigo do Produtor:</label>
							    			<input type="text" class="form-control" id="codProdutor" name="codProdutor" >
								  		</div>
									</div>
								 
									<div class="col-md-3">
										  <div class="form-group">
										    <label for="data_estoque_atual">Nome do Produtor:</label>
										    <input type="text" class="form-control" id="nome"  name="nome" >
										  </div>
									</div> 
								</div><!-- /.row -->
							</div>
							<div class="panel-footer text-left">
								<input type="submit" value="Salvar" style="margin: 0px;background:#5cb85c;color: #fff;font-size: 14px;"
								onmouseover="this.style.background='#212121'"  onclick="return save();" onmouseout="this.style.background='#5cb85c'">
					   		</div>	
						</form>	
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>  
	<c:import url="/resources/jspImport/footer.jsp" />
	
  </body>
</html>
