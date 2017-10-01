<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<c:if test="${not empty msgSuccess}">
	<div class="modal fade" id="myModal">
		<div class="modal-dialog" >  
			<div class="alert alert-success fade in alert-dismissable">
				<a href="#" class="close"  data-dismiss="modal" aria-label="close" title="close">
					<i class="fa fa-times" aria-hidden="true"></i>
				</a>
				<h3><strong>Sucesso:</strong></h3><h4><c:out value="${msgSuccess}"></c:out></h4>
			</div>							 
		 	<a  id="linkModal" data-toggle="modal" data-target="#myModal" style="display:none"></a>
		</div><!-- /.modal-dialog -->
 	</div><!-- /.modal -->
</c:if>	

<c:if test="${not empty msgErro}">
	<div class="modal fade" id="myModal">
		<div class="modal-dialog" >  
			<div class="alert alert-danger fade in alert-dismissable">
				<a href="#" class="close"  data-dismiss="modal" aria-label="close" title="close">
					<i class="fa fa-times" aria-hidden="true"></i>
				</a>
				<h3><strong>Erro:</strong></h3><h4><c:out value="${msgErro}"></c:out></h4>
			</div>							 
		 	<a  id="linkModal" data-toggle="modal" data-target="#myModal" style="display:none"></a>
		</div><!-- /.modal-dialog -->
 	</div><!-- /.modal -->
</c:if>				
<script>
	$(document).ready(function(){
		$("#linkModal").click(); 
		$("#download").css("cursor","pointer");    				 
	});
</script>