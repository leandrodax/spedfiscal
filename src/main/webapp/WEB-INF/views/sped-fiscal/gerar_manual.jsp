<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/resources/jspImport/head.jsp"></c:import>
<style>
	.filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
}
	
 

#listProdutos > thead,
#listProdutos> tbody,
#listProdutos > thead > tr,
#listProdutos > tbody > tr,
#listProdutos > thead > tr > th,
#listProdutos > tbody > tr > td {
    display: block;
}

#listProdutos > tbody > tr:after,
#listProdutos > thead > tr:after {
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
}

#listProdutos > tbody {
    overflow-y: auto;
    height: 150px;
}
#listProdutos > tbody > tr > td,
#listProdutos > thead > tr > th {
    width:33%;
    float: left;
}
 
 
 
</style>
</head>
<body>

<c:import url="/resources/jspImport/header.jsp" />
	
		<div class="container">
			 

		<c:import url="/resources/jspImport/msg.jsp" />
	
			<div class="w3_agile_mail_grids_agile">
				<div class="col-md-12 w3_agile_mail_left">
					<div class="agileits_mail_grid_right1 agile_mail_grid_right1"> 
						
						<h3 class="w3_agile_head">Emitir Sped Fiscal Manual</h3>
						<p class="augue_agile">Preencha o formulário abaixo
						<br>e gere seu sped fiscal</p>
						
						<form class="no-margin" id="formValidate2" method="POST" action="/SpedFiscal/protected/sped/emissao/manual">
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
								 
								<div class="row" id="rowProduto">
									<div class="col-md-5">
										<div class="form-group">
											<label class="control-label">Produtos:</label>
											<table id="listProdutos"  class="table table-striped">
											<thead>
										        <tr> 
										            <th>Código</th>
										            <th>Descrição</th> 
										            <th>Ação</th>
										        </tr>
										    </thead>
						    				<tbody>
											</tbody>
											</table> 
										</div>
									</div><!-- /.col -->
									<input type="hidden" id="produto" name="produtos" value=""/>
									
									<div class="col-md-2" id="btnAddProduto">
										<div class="form-group">
											<label class="control-label"><br></label> 
											
											<a data-toggle="modal" data-target="#myModal"> 
												<input type="submit" value="Incluir produto a lista" style="margin:0px;width:220px;background:#337ab7;color: #fff;font-size: 14px;"
												onmouseover="this.style.background='#212121'" onmouseout="this.style.background='#337ab7'">
										 	</a>
											
										</div>
									</div><!-- /.col --> 
								</div> 
								<div class="row">
									<div class="col-md-2">
										<div class="form-group">
											<label class="control-label"><br></label> 
											 
											<div class="button-link" style=" float:left">
												<a href="/SpedFiscal/protected/produto/adicionar"  style="margin: 0px; width:380px;background:#5cb85c;color: #fff;font-size: 14px;"
												onmouseover="this.style.background='#212121'"  onmouseout="this.style.background='#5cb85c'">&nbsp &nbsp &nbsp &nbsp Cadastrar novo produto &nbsp &nbsp &nbsp &nbsp</a>
										  	</div> 
										</div>
									</div><!-- /.col -->
								</div>
							</div>
						<div class="panel-footer text-left"> 			
							<input type="submit" value=" Emitir Sped Fiscal" style="margin: 0px;background:#5cb85c;color: #fff;font-size: 14px;"
							onmouseover="this.style.background='#212121'"  onclick="return save();" onmouseout="this.style.background='#5cb85c'">
						</div>
					</form>
					</div>
				</div>
			</div>
			 
			<div class="clearfix"> </div>
		</div> 
		<br>
		<div class="modal fade" id="myModal">
			<div class="modal-dialog" >
		      <div class="modal-content">
		      	<div class="modal-header" style="background-color: #428bca;border-color: #357ebd;">
		          <h3 class="modal-title" style="color:white">Produtos</h3>
		        </div>
		        <div class="modal-body">
		       		<div class="container"> 
		      			<div class="row">
		        			<div class="col-md-5">
		          				<div class="panel panel-primary filterable">
					            	<div class="panel-heading">
					                  	<h3 class="panel-title"><button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtrar</button></h3>
					              	</div>
									<table id="tableRegistros" class="table table-striped">
									    <thead>
									        <tr class="filters">
									            <th></th>
									            <th><input type="text" class="form-control" placeholder="Código do Produto" disabled></th>
									            <th><input type="text" class="form-control" placeholder="Descrição do Produto" disabled></th> 
									        </tr>
									    </thead>
									    <tbody>
									    	<c:forEach var="produto" items="${produtos}" varStatus="id">
												<tr>
									      			<td><input type="checkbox"></td>
													<td>${produto.codProduto}</td>
													<td>${produto.descricao}</td>
												</tr>
											</c:forEach>
									    </tbody>
									</table>
						        </div>
						    </div>
						</div>
					</div>         
				</div><!--modal body-->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default " data-dismiss="modal">Close</button>
		          <button type="button" class="btn btn-primary" onclick="selectProdutos()" data-dismiss="modal">Incluir Produtos</button>
		        </div>		
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
	    </div><!-- /.modal --> 
	 	 
		<c:if test="${not empty msgSuccessDownload}">
			<div class="modal fade" id="modalDownload">
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
    				$("#modalDownload").modal("show");
    				$("#download").css("cursor","pointer");    				 
    			});
    		</script>
		</c:if>						
   
	<c:import url="/resources/jspImport/footer.jsp" />
	

<script> 
$(document).ready(function(){
	$('#download').on('click', function(){       
	   	var content = '<c:out value='${sped}'/>';
	   	var arr = content.split(" - ");
	   	var element = document.createElement('a');
	   	var text = "";	   	
	   	for(i = 0; i < arr.length; i++){
	   		text += arr[i]+" \r\n"; 
	      }
	    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
	    element.setAttribute('download', "BlocoK.txt");
	
	    element.style.display = 'none';
	    document.body.appendChild(element);
	
	    element.click();
	
	    document.body.removeChild(element);
	    
	}); 
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});
function selectProdutos(){
	$('#tableRegistros tbody tr td input:checked').each(function(){
		 var codProd = $(this).closest('tr').find('td')[1].innerHTML;
		 var descProd = $(this).closest('tr').find('td')[2].innerHTML;
		 var row = '<tr><td>'+ codProd +'</td><td>'+ descProd +'</td>'
		 + '<td><a href="" onclick="removeItemListProdutos(this);"><i class="fa fa-times" aria-hidden="true"></i></a></td></tr>';
		 $('#listProdutos tbody').append(row);
		 $(this).closest('tr').remove();
		 $('#myModal').display = 'none';
	});
 
}
function removeItemListProdutos(btnRmv){
	event.preventDefault();
	
	var tr = btnRmv.closest('tr');
	var codProd = tr.getElementsByTagName('td')[0].innerHTML;
	var descProd = tr.getElementsByTagName('td')[1].innerHTML;
	
	var row = '<tr><td><input type="checkbox"></td><td>'+ codProd +'</td><td>'+ descProd +'</td></tr>'
 
 
	$('#tableRegistros tbody').append(row)
	tr.remove(); 
}
function save(){
	 $('#listProdutos tbody tr').each(function(){
		 $('#produto').val($('#produto').val() + $(this).find('td')[0].innerHTML + ';'); 
	 });
}
 
</script>
</body></html>