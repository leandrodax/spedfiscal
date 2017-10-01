<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="/resources/jspImport/head.jsp"></c:import>
</head>
<body>

<c:import url="/resources/jspImport/header.jsp" />
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
							 
							<div class="panel-body">
								 
							</div>
						</div><!-- /panel -->
					</div><!-- /login-widget -->
				</div>
			</div> 
		</div>  
	<!-- /main-container --> 
	
	<c:import url="/resources/jspImport/logout.jsp" />
	
</body>
</html>