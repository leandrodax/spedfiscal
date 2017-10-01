<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Sped Fiscal Web Service - Login</title>
<c:import url="/resources/jspImport/publica_head.jsp"></c:import>
<style>
hr.message-inner-separator
{
    clear: both;
    margin-top: 10px;
    margin-bottom: 13px;
    border: 0;
    height: 1px;
    background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
    background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
    background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
    background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}

</style>
</head>
<body>

<c:import url="/resources/jspImport/publica_header.jsp" />
<!-- Conteúdo--> 
	
	<div id="main-container" style="width:100%; margin:auto;"> 
		<div class="login-wrapper">		
			<div class="tab-pane fade in active" id="research">
				<div class="panel panel-default table-responsive"> 
					<div class="login-widget animation-delay1">	
						<div class="panel panel-default">
							<div class="panel-heading clearfix">
					            <div class="alert alert-danger">
					                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
					                    ×</button>
					                <i class="fa fa-times" aria-hidden="true"></i> <strong>Sessão Invalidada.</strong>
					                <hr class="message-inner-separator">
					                <p>
					                    Sua sessão foi expirada ou foi efetuada uma requisição sem ter realizado o login.</p>
					                <a href="/SpedFiscal/" title="index Sped Fiscal">
					                    click aqui para realizar o login.</a>
					            </div>
		        			</div>   
		        		</div>   
		        	</div>   
		        </div>   
        	</div>   
        </div>   
    </div>   
	<!-- /main-container --> 
</body>
</html>