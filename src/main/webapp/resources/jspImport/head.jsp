<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	 <title>Sped Fiscal Web Service</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="keywords" content="Monetary Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<c:url value='/resources/resource_monetery/css/bootstrap.css'/>" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/resources/resource_monetery/css/style.css'/>" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="<c:url value='/resources/resource_monetery/js/jquery-2.1.4.min.js'/>"></script>
<!-- //js -->
<link rel="stylesheet" href="<c:url value='/resources/resource_monetery/css/flexslider.css'/>" type="text/css" media="screen" property="" />
<link href="<c:url value='/resources/resource_monetery/css/popuo-box.css'/>" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link rel="stylesheet" href="<c:url value='/resources/resource_monetery/css/font-awesome.min.css'/>" />
<!-- //font-awesome icons -->
<script src="<c:url value='/resources/resource_monetery/js/jquery.magnific-popup.js'/>" type="text/javascript"></script>
<script defer src="<c:url value='/resources/resource_monetery/js/jquery.flexslider.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/resource_monetery/js/jquery.glide.min.js'/>"></script>
				
<!-- //footer -->
<!-- for bootstrap working -->
<script src="<c:url value='/resources/resource_monetery/js/bootstrap.js'/>"></script>
<!-- //for bootstrap working -->
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="<c:url value='/resources/resource_monetery/js/move-top.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/resource_monetery/js/easing.js'/>"></script>
<script> 
function consultaCnpj() {

    var cnpj = $("#cnpj").val().replace(/\D/g, '');

            //Verifica se campo cnpj possui valor informado.
            if (cnpj != "") {

                //Expressão regular para validar o CNPJ.
                var validacnpj = /^[0-9]/;

                //Valida o formato do CNPJ.
                if(validacnpj.test(cnpj)) {
				    $.ajax({
				        type: "GET",
				        url: "http://receitaws.com.br/v1/cnpj/"+ cnpj,
				        contentType: "application/json; charset=utf-8",
				        dataType: "jsonp",
				        success: function (dados) {
				                if (!("erro" in dados)) {
				                            //Atualiza os campos com os valores da consulta.
				                            $("#cnpj").val(dados.cnpj); 
				                            $("#razaoSocial").val(dados.nome);
				                            $("#fantasia").val(dados.fantasia);
				                            $("#logradouro").val(dados.logradouro);
				                            $("#complemento").val(dados.complemento);
				                            $("#bairro").val(dados.bairro);
				                            $("#numero").val(dados.numero);
				                            $("#cep").val(dados.cep);
				                            $("#cidade").val(dados.municipio);
				                            $("#estado").val(dados.uf);  
				                        } //end if.
				                        else {
				                            //Cnpj pesquisado não foi encontrado.
				                            limpa_formulário_cnpj();
				                            alert("CNPJ não encontrado.");
				                        }
				        },
				        error: function(e){
				            alert(e.statusText);  
				            return false;
				        }       
				    });

             
                } //end if.
                else {
                    //cnpj é inválido.
                    limpa_formulário_cnpj();
                    alert("Formato de CNPJ inválido.");
                    return false;
                }
            } //end if.
            else {
                
                
            }
            return false;
       
    }
</script>