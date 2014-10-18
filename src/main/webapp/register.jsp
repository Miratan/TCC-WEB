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
		console.log(currentURL);
	});
</script>
</head>
<body>
	<!--  CHAMADA MENU FIXO PARA USUÁRIO SEM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menu.jsp"/>
	</div>
	
	<div class="container" style="margin-top: -30px;">
	
	<div class="titleTCC" style="width: 70%;margin: auto;">

		<h3 style="padding: 10px 15px;text-align: center;">
			Cadastro de Usuário
		</h3>
	</div>
	
	
		<div class="textCenterAcess" style="text-align: center;">
			<div class="col-md-12">
				<form:form  method="post" action="/login/create">
				
					<div class="form-inline">
						<div class="col-md-4 col-md-offset-2">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">Usuário</span>
							</div>
							<input id="name" name="name" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="Usuário">
						</div>
						<div class="col-md-4 col-md-offset-0">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">Senha</span>
							</div>
							<input id="password" name="password" type="password" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="Senha">
						</div>
					</div>
					
					<div class="form-inline">
						<div class="col-md-4 col-md-offset-2">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">Nome Completo</span>
							</div>
							<input id="userName" name="nameUser" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="Nome Completo">
						</div>
						<div class="col-md-4 col-md-offset-0">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">E-mail</span>
							</div>
							<input id="email" name="email" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="E-mail">
						</div>
					</div>
					
					<div class="form-inline">
						<div class="col-md-4 col-md-offset-2">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">Data de Nascimento</span>
							</div>
							<input id="birthday" name="birthday" type="date" class="form-control" style="margin:auto;margin-bottom:15px;min-width: 197px;text-align: right;" placeholder="Data Nascimento">
						</div>
						<div class="col-md-4 col-md-offset-0">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">Curso</span>
							</div>
							<input id="course" name="course" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="Curso">
						</div>
					</div>
					<div class="form-inline">
						<div class="col-md-4 col-md-offset-2">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">Semestre</span>
							</div>
							<input id="semester" name="semester" type="number" min="1" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="Semestre">
						</div>
						<div class="col-md-4 col-md-offset-0">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">Universidade</span>
							</div>
							<input id="college" name="college" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="Universidade">
						</div>
					</div>
					<div class="form-inline">
						<div class="col-md-4 col-md-offset-2">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">Cidade</span>
							</div>
							<input id="city" name="city" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="Cidade">
						</div>
						<div class="col-md-4 col-md-offset-0">
							<div class="row">
								<span style="color: darkblue;font-style: italic;">País</span>
							</div>
							<input id="country" name="country" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;text-align:center;" placeholder="País">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12"  style="margin-bottom: 100px;">
							<button type="submit" class="btn btn-success" value="send">Salvar</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>