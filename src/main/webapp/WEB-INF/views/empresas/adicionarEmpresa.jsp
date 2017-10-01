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
		<div id="main-container">
			<div id="breadcrumb">
				<ul class="breadcrumb">
					 <li><i class="fa fa-home" class="active"></i><a href="index.html"> Empresa</a></li> 
				</ul>
			</div><!--breadcrumb-->
			
			<div class="padding-md">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="research">

								<div class="panel panel-default table-responsive">
									<div class="panel-heading">
										CADASTRO DE EMPRESA
									</div>
									<div class="padding-md clearfix">
										

										<form class="no-margin" id="formValidate2" data-validate="parsley" novalidate>
										<div class="panel-heading">
											
										MODELO DE FORMULÁRIO
										</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-md-3">
													<div class="form-group">
														<label class="control-label">CNPJ</label>
														<input type="text"  class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
												<div class="col-md-4">
													<div class="form-group">
														<br>
														<input class="btn btn-success" type="submit" value="Consultar"/>
													</div>
												</div><!-- /.col -->
											</div>
											<div class="row">
												<div class="col-md-3">
													<div class="form-group">
														<label class="control-label">Inscrição Estadual</label>
														<input type="text"  class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
												<div class="col-md-4">
													<div class="form-group">
														<label class="control-label">Razão Social</label>
														<input type="text"  class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
												<div class="col-md-4">
													<div class="form-group">
														<label class="control-label">Nome Fantasia</label>
														<input type="text" class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
											</div>
											<div class="row">	
												<div class="col-md-4">
													<div class="form-group">
														<label class="control-label">Logradouro</label>
														<input type="text" class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
												<div class="col-md-1">
													<div class="form-group">
														<label class="control-label">Numero</label>
														<input type="text" class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
												<div class="col-md-2">
													<div class="form-group">
														<label class="control-label">Complemento</label>
														<input type="text" class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
												<div class="col-md-4">
													<div class="form-group">
														<label class="control-label">Bairro</label>
														<input type="text" class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
											</div>
											<div class="row">
												<div class="col-md-2">
													<div class="form-group">
														<label class="control-label">CEP</label>
														<input type="text" class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
												<div class="col-md-4">
													<div class="form-group">
														<label class="control-label">Cidade</label>
														<input type="text" class="form-control input-sm" data-required="true">
													</div>
												</div><!-- /.col -->
												<div class="col-md-2">
													<div class="form-group">
														<label class="control-label">Estado</label>
														<Select type="text" class="form-control input-sm" data-required="true">
															<option>Selecione</option>
														</select>
													</div>
												</div><!-- /.col -->
											</div><!-- /.row -->
										</div>
									</form>
										<div class="panel-footer text-left">
											<button class="btn btn-success" type="submit">Salvar</button>
											<button class="btn btn-success" type="submit"> Voltar ao menu principal</button>
										</div>
									</div><!-- /.padding-md -->
								</div><!-- /panel -->	
							</div><!-- /tab2 -->
							
						</div><!-- /tab-content -->
					</div><!-- /.col -->
				</div><!-- /.row -->		
							
			</div><!-- /.padding-md -->
			
		</div><!-- /main-container -->
	</div><!-- /wrapper -->
 
	<c:import url="/resources/jspImport/logout.jsp" />
	
     
  </body>
</html>
