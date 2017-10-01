<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:import url="/resources/jspImport/head.jsp"></c:import>
<title>404 - Page not found</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<style>
  
</style>
<body>

<div class="container">

  <div class="row">
    <div class="col-md-6 col-md-offset-3 text-center">
      <br>
      <h4>
      	<h2 class="fadeInUp animation-delay8" style="font-weight:bold"> 
      		</h4><h1><a class="navbar-brand" href="<c:url value='/protected/home'/>">Sped Fiscal <h4 style="float:right">Web Service</h4></a></h1>
		</h2>
				
      <p><div class="brand">
			<a href="<c:url value='/SpedFiscal/'/>"><img
				src="<c:url value='/resources/img/404-darth-vader.jpg'/>" class="pull-center"
				style="padding-left: 10px; padding-right: 10px;"></a>
		</div> </p>

      <h2><i class="fa fa-exclamation-triangle" style="color:red"></i>
     
 		Page not found <small>404 error</small></h2>
      <p>Well, this is embarrassing.

        <br>
      </p>

      <p><a href="/SpedFiscal/">Click here</a> to visit our home page</p>

      <p>
        <a href="/SpedFiscal/">SpedFiscalWebService.com.br</a></p>

    </div>

  </div> 
</div>
</body>
</html>