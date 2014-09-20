<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>Web - TCC</title>
<script type="text/javascript">
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
							<input value="${user.getName()}" id="name" name="name" type="text" class="form-control" placeholder="Usuário">
						</div>
						<div class="col-md-4">
							<input id="password" name="password" type="password" class="form-control" placeholder="Nova Senha">
						</div>
						<div class="col-md-4">
							<input value="${user.getEmail()}" id="email" name="email" type="text" class="form-control"	placeholder="E-mail">
						</div>
					</div>
					<div class="form-inline">
						<div class="col-md-4" style="margin-top:20px;">
							<input value="${user.getNameUser()}" id="userName" name="nameUser" type="text" class="form-control" placeholder="Nome Completo">
						</div>
						<div class="col-md-4" style="margin-top:20px;">
							<input value="${user.getBirthday()}" id="birthday" name="birthday" type="date" class="form-control" placeholder="Data de Nascimento">
						</div>
						<div class="col-md-4" style="margin-top:20px;">
							<input value="${user.getCity()}" id="city" name="city" type="text" class="form-control" placeholder="Cidade">
						</div>
					</div>
						<div class="form-inline">
						<div class="col-md-4" style="margin-top:20px;">
							<input value="${user.getCourse()}" id="course" name="course" type="text" class="form-control" placeholder="Curso">
						</div>
						<div class="col-md-4" style="margin-top:20px;">
							<input value="${user.getSemester()}" id="semester" name="semester" type="number" min="1" class="form-control" placeholder="Semestre">
						</div>
						<div class="col-md-4" style="margin-top:20px;">
							<input value="${user.getCollege()}" id="college" name="college" type="text" class="form-control" placeholder="Universidade">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div style="margin-top:20px;">
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