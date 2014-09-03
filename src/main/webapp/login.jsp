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
          <a class="navbar-brand" href="index.jsp">Web TCC</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="login.jsp">Acesso ao Sistema</a></li>
            <li><a href="register.jsp">Cadastrar</a></li>
            <li><a href="criar.jsp">Contato</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

		<div class="container" style="margin-top: 30px;">

		<h1 style="padding: 40px 15px;text-align: center;">
			Ferramenta Web de Acompanhamento e Versionamento de	Trabalhos Acadêmicos
		</h1>
		
		<div class="textCenterAcess">
			<div class="col-md-12" style="text-align: center;padding: 60px 0px 0px 460px;">
<!-- 				<div class="row"> -->
					<form:form  method="post" action="/login">
<!-- 					<div class="input-group"> -->
						<div class="col-md-3 input-group" style="text-align: center;">
							<input style="border-radius: 5px;" name="name" type="text" class="form-control" placeholder="Usuário">
						</div>
						<div class="col-md-3 input-group"  style="margin-top: 15px;">
							<input style="border-radius: 5px;" name="password" type="password" class="form-control" placeholder="Senha">
						</div>
						<div class="col-md-3 input-group"  style="margin-top: 15px;">
							<button type="submit" class="btn btn-success dropdown-toggle buttonInputGroup" value="send">Entrar</button>
						</div>
<!-- 					</div> -->
					</form:form>
				</div>
			</div>
		</div>
		
		<div class="msgErrorLogin" style="margin-top: 30px;margin-right: 50px;text-align: center;color:red;">${errorLogin}</div>
<!-- 	</div> -->

</body>
</html>