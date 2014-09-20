<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>

<title>Web - TCC</title>

<script type="text/javascript">
	$(document).ready(function() {
		//GET CURRENT URL
		var currentURL = window.location.pathname;
		setTimeout(function() {
			$('.msgErrorLogin').fadeOut('slow');
		}, 1500);
		
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
				<div class="col-md-2 input-group" style="margin:auto;text-align: center;">
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

	<div class="msgErrorLogin" style="margin-top: 30px; margin-right: 50px; text-align: center; color: red;">
			${errorLogin}
	</div>

</body>
</html>