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

	$(document).ready(function() {
		
		//GET CURRENT URL
		var currentURL = window.location.pathname;
		console.log(currentURL);
		
		setTimeout(function() {
			$('.msgErrorLogin').fadeOut('slow');
		}, 1500);
		
	});

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
          <a class="navbar-brand" href="${pageContext.request.contextPath}/logged.jsp">Web TCC</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="project.jsp">Novo Projeto</a></li>
            <li><a href="#myProjects">Meus Projetos</a></li>
            <li><a href="${pageContext.request.contextPath}/login/editUserLogged">Minha Conta</a></li>
            <li><a href="#contact">Relatórios</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

		<div class="container" style="margin-top: 30px;">

		<h1 style="padding: 40px 15px;text-align: center;">
			Ferramenta Web de Acompanhamento e Versionamento de	Trabalhos Acadêmicos
		</h1>
		
		<div class="textCenterAcess" style="text-align: center;">
			<div class="col-md-12">
				<form:form  method="post" action="/project/create">
					<div class="form-inline">
						<div class="col-md-4">
							<input id="title" maxlength="200" name="title" type="text" class="form-control" placeholder="Título">
						</div>
						<div class="col-md-4">
							<input id="description" maxlength="3000" name="description" type="text" class="form-control" placeholder="Descrição">
						</div>
						<div class="col-md-4">
							<input id="keyWords" maxlength="60" name="keyWords" type="text" class="form-control"	placeholder="Chaves">
						</div>
					</div>
					<div class="form-inline">
						<div class="col-md-4" style="margin-top:20px;">
							<input id="discipline" maxlength="30" name="discipline" type="text" class="form-control" placeholder="Disciplina">
						</div>
						<div class="col-md-4" style="margin-top:20px;">
							<input id="deliveryDate" name="deliveryDate" type="date" class="form-control"	placeholder="Data da Entrega">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div style="margin-top:20px;">
								<button type="submit" class="btn btn-success" value="send">Salvar</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
		
	</div>

</body>
</html>