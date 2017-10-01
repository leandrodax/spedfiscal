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
						
						<h3 class="w3_agile_head">Emitir Sped Fiscal Automático</h3>
						<p class="augue_agile">Importe suas Notas fiscais
						<br>e gere seu sped fiscal</p>
						
						<form class="no-margin" id="formValidate2" action="/SpedFiscal/protected/sped/emissao/automatico" method="POST" enctype="multipart/form-data">
							  
							<div class="row">											
								<div class="panel-body">
								<div class="row">		
									<label class="control-label">Apuração</label>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group" id="inicial">
							   				<label for="codigo_produto">De:</label>
							    			<input type="date" class="form-control" name="dataInicio" id="dataInicio" >
								  		</div>
									</div>
									<div class="col-md-4">	
								  		<div class="form-group">
									   		<label for="desc_produto">Até:</label>
									    	<input type="date" class="form-control" name="dataFim" id="dataFim" >
									  	</div>
									</div>	
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label class="control-label">Importar Nota Fiscal do Computador</label>
											<label class="btn btn-primary" for="xml">
				 										<input id="xml" type="file" name="file" style="display:none" onchange="$('#upload-file-info').html($(this).val());">
															Importar</input>
											</label>
										</div> 
									</div><!-- /.col -->
									<div class="col-md-4"> 
										<div class="form-group">
											<br>
											<label class='label label-info' id="upload-file-info"></label>
										</div>
									</div><!-- /.col -->  
								</div>
								<br> 
									<!-- 
										<div class="col-md-4">
											<div class="form-group">
												<label class="control-label">
													Importar Nota Fiscal da Receita Federal
												</label> 
												<input type="text" class="form-control input-sm" data-required="true" placeholder="Número da Nota Fiscal">
											</div>
										</div>
	                                             <div class="col-md-4">
											<div class="form-group">
												<br>
												<input class="btn btn-success" type="submit" value="Importar">
											</div>
										</div>
									</div>
									 -->
								</div>
							</div>
							<div class="panel-footer text-left"> 			
								<input type="submit" value=" Emitir Sped Fiscal" style="margin: 0px;background:#5cb85c;color: #fff;font-size: 14px;"
								onmouseover="this.style.background='#212121'" onmouseout="this.style.background='#5cb85c'">
							</div> 
						</form>
					</div>
				</div>
			</div> 
	 	 
		<c:if test="${not empty msgSuccessDownload}">
			<div class="modal fade" id="myModal">
				<div class="modal-dialog" >  
					<div class="alert alert-success fade in alert-dismissable">
						<a href="#" class="close"  data-dismiss="modal" aria-label="close" title="close">
							<i class="fa fa-times" aria-hidden="true"></i>
						</a>
						<h3><strong>Sucesso:</strong></h3><h4><c:out value="${msgSuccessDownload}"></c:out></h4>
						<br> 
		 				<a href="" data-dismiss="modal" id="download"><i class="glyphicon glyphicon-download-alt"></i> Click aqui para realizar o Download</a>
						 
					</div>							 
				</div><!-- /.modal-dialog -->
		 	</div><!-- /.modal -->
		 	<script>
    			$(document).ready(function(){
    				$("#myModal").modal("show");
    				$("#download").css("cursor","pointer");    				 
    			});
    		</script>
		</c:if>						
  
			<div class="clearfix"> </div>
		</div>  
		<br> 
	<c:import url="/resources/jspImport/footer.jsp" />				
				
<script>
    $('#download').on('click', function(){       
       	var content = '<c:out value='${sped}'/>';
       	var arr = content.split(" - ");
	   	var element = document.createElement('a');
	   	var text = "";	   	
	   	for(i = 0; i < arr.length; i++){
	   		text += arr[i]+"\r\n"; 
	      }
	    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
	    element.setAttribute('download', "BlocoK.txt");
	
	    element.style.display = 'none';
	    document.body.appendChild(element);
	
	    element.click();
	
	    document.body.removeChild(element);
        
    }); 
</script>
	
<script>
$(document).ready(function(){
	$("#taSped").hide();
	$("#btnDownload").hide();
	$("#btnDownload").css("cursor","pointer");
	$("#disableSped").css("cursor","pointer");
	$("#disableSped").click(function(){
		$("#taSped").toggle();
		$("#disableSped").toggle();
		$("#btnDownload").toggle();
	});
});

function location(path){
	window.location = path;
	return false;
}
 
</script>
</body></html>


