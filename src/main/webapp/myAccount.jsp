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

// 	$(document).ready(function() {
		
// 		//GET CURRENT URL
// 		var currentURL = window.location.pathname;
// 		console.log(currentURL);
		
// 		var myDate = new Date();
// 		var displayDate = (myDate.getMonth()+1) + '/' + (myDate.getDate()) + '/' + myDate.getFullYear() + ' - ' + myDate.getHours() + ':' + myDate.getMinutes() + ':' + myDate.getSeconds();
// 		$("#dateCurrent").append("<h4>DATA: "+displayDate+"</h4>");
		
// 	});

</script>

</head>
<body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="logged.jsp">Web TCC</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#myProjects">Meus Projetos</a></li>
            <li><a href="myAccount.jsp">Minha Conta</a></li>
            <li><a href="#contact">Relatórios</a></li>
          </ul>
          
          <ul class="nav navbar-nav" style="margin-left:520px;">
            <li style="margin-top: 15px;font-size: 15px;color: darkgray;">Olá, !</li>
          </ul>
          
          <ul class="final" style="margin-left:1070px;">
          <li>
          <div class="col-md-12">
          		<a class="navbar-brand glyphicon glyphicon-off" href="logout.jsp"></a>
          </div>
          </li>
          </ul>
        </div>
      </div>
    </div>

    <div class="container" style="margin-top: 30px;">
    
   		<h1 style="padding: 40px 15px;text-align: center;">
			Ferramenta Web de Acompanhamento e Versionamento de	Trabalhos Acadêmicos
		</h1>
    
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

<!--     	<div class="starter-template" style="margin-top:150px;"> -->
      
<!--       			<div class="col-md-12"> -->
<!-- 					<div id="dateCurrent" class="row dateCurrent"> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
<!-- 		</div> -->

    </div><!-- /.container -->

</body>
</html>