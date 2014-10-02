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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Web - TCC</title>
<script type="text/javascript">
$(document).ready(function() {

	$.ajax({
		url : "login/user",
		type : "GET",
		success : function(response) {
			console.log(response);
			$('#name').val(response.name);
			$('#userName').val(response.nameUser);
			$('#email').val(response.email);
			$('#birthday').val(response.birthday);
			$('#city').val(response.city);
			$('#course').val(response.course);
			$('#semester').val(response.semester);
			$('#college').val(response.college);
		}
	});
	
	$(document).ready(function(){
		window.history.pushState(null, null, 'http://localhost:8080/web-test/myAccount.jsp');
	});
 
});

</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	
    <div class="container" style="margin-top: 30px;">
    
    	<div class="textCenterAcess" style="text-align: center;">
			<div class="col-md-12">
				<form:form  method="POST" action="/login/edit/${user.getId()}">
					<div class="form-inline">
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">Nome</span>
							</div>
							<div class="row">
								<input value="" id="name" name="name" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Usuário">
							</div>	
						</div>
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">Senha</span>
							</div>
							<div class="row">
							<input id="password" name="password" type="password" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Nova Senha">
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">E-mail</span>
							</div>
							<div class="row">
							<input value="" id="email" name="email" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="E-mail">
							</div>
						</div>
					</div>
					<div class="form-inline">
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">Usuário</span>
							</div>
							<div class="row">
							<input value="" id="userName" name="nameUser" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Nome Completo">
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">Data de Nascimento</span>
							</div>
							<div class="row">
							<input value="" id="birthday" name="birthday" type="date" class="form-control" style="margin:auto;margin-bottom: 15px;min-width: 197px;" placeholder="Data de Nascimento">
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">Cidade</span>
							</div>
							<div class="row">
							<input value="" id="city" name="city" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Cidade">
							</div>
						</div>
					</div>
						<div class="form-inline">
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">Curso</span>
							</div>
							<div class="row">
							<input value="" id="course" name="course" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Curso">
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">Semestre</span>
							</div>
							<div class="row">
							<input value="" id="semester" name="semester" type="number" min="1" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Semestre">
							</div>
						</div>
						<div class="col-md-4">
							<div class="row">
								<span style="color: darkblue;">Universidade</span>
							</div>
							<div class="row">
							<input value="" id="college" name="college" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Universidade">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div>
								<button type="submit" class="btn btn-success" value="send">Atualizar</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
    </div>

</body>
</html>