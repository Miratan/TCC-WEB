<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<title>Web - TCC</title>

<script type="text/javascript">

	var currentURL = window.location.pathname;
	setTimeout(function() {
		$('.msgErrorLogin').fadeOut('slow');
	}, 1500);
	
	
	$(document).ready(function(){
		window.history.pushState(null, null, 'http://localhost:8080/web-test/index.jsp');
	});
 
</script>

</head>
<body>
	<!--  CHAMADA MENU FIXO PARA USUÁRIO SEM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menu.jsp"/>
	</div>

<div class="container" style="margin-top: 40px;">
	<div class="textCenterAcess">
		<div class="col-md-12">
			<div class="row">
			<form:form method="post" action="/login">
				<div class="col-md-2 input-group" style="margin:auto;margin-bottom: 15px;">
					<input style="border-radius: 5px;width: 100%;!important" name="name" type="text"
						class="form-control" placeholder="Usuário">
				</div>
				<div class="col-md-2 input-group" style="margin:auto;margin-bottom: 15px;">
					<input style="border-radius: 5px;width: 100%;!important" name="password" type="password"
						class="form-control" placeholder="Senha">
				</div>
				<div class="col-md-2 input-group" style="margin:auto;text-align: center;margin-bottom: 15px;">
					<button type="submit" 
						class="btn btn-success dropdown-toggle buttonInputGroup" 
						value="send">Entrar
					</button>
				</div>
			</form:form>
			</div>
		</div>
	</div>
</div>

	<div class="msgErrorLogin" style="margin: auto; text-align: center; color: red;">
			${errorLogin}
	</div>

</body>
</html>