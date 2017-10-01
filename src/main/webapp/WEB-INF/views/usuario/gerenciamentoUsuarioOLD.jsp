<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<c:import url="/resources/jspImport/head.jsp"></c:import>
</head>
<body>

<c:import url="/resources/jspImport/header.jsp" />
		<div id="main-container">
			<div id="breadcrumb">
				<ul class="breadcrumb">
					 <li><i class="fa fa-home" class="active"></i><a href="index.html"> Configurações</a></li> 
				</ul>
			</div><!--breadcrumb-->
			
			<div class="padding-md">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="tab-content">
							<div class="tab-pane fade in active" id="research"> 
									<div class="panel-heading">
                                          <h3> CONFIGURAÇÕES GERAIS DE CONTA</h3>
									</div>
										<form class="no-margin" id="formValidate2" data-validate="parsley" novalidate>
											<div class="panel-heading">
												
											<h4>Dados de Usuário</h4>

											</div>
											<div class="panel-body">
												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">E-mail</label>
															<input type="text"  class="form-control input-sm" data-required="true">
														</div>
													</div><!-- /.col -->
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">Confirmar E-mail</label>
															<input type="text"  class="form-control input-sm" data-required="true">
														</div>
													</div><!-- /.col -->
												</div>
												<div class="row">
													<div class="col-md-2">
														<div class="form-group">
															<label class="control-label">Senha</label>
															<input type="text"  class="form-control input-sm" data-required="true">
														</div>
													</div><!-- /.col -->
													<div class="col-md-2">
													</div><!-- /.col -->
													<div class="col-md-2">
														<div class="form-group">
															<label class="control-label">Confirmar Senha</label>
															<input type="text" class="form-control input-sm" data-required="true">
														</div>
													</div><!-- /.col -->
												</div>
												<div class="row">
													<div class="panel-footer text-left">
														<button class="btn btn-success" type="submit">Confirmar</button>
														<button class="btn btn-success" type="submit">Cancelar</button>
													</div>
												</div>
											</div>
										</form>
	 
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
