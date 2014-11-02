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
		window.history.pushState(null, null, 'http://localhost:8080/web-test/');
	});
 
</script>

</head>
<body>
	<!--  CHAMADA MENU FIXO PARA USUÁRIO SEM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menu.jsp"/>
	</div>

	<div class="container" style="margin-top: 45px;">
		<div class="starter-template">
			<div class="col-md-6">
				<div class="row">
					<h1>Sua primeira vez aqui?</h1>
					<div class="textSize">
						<div class="textInfo">
							<span>Para usar a Ferramenta voc&ecirc; precisa criar uma conta de acesso.
							</span>
						</div>
						<div class="textInfo">
							<span>Clique no bot&atilde;o abaixo e preencha o formul&aacute;rio.</span>
						</div>
						<div class="textInfo">
							<span>O acesso a Ferramenta ser&aacute; realizado a 
								  partir do Usu&aacute;rio e Senha cadastrados a seguir.
							</span>
						</div>
					</div>
					<div style="margin-top: 10px;">
						<a href="register.jsp">
							<button type="button" class="btn btn-primary dropdown-toggle buttonInputGroup">Cadastrar
							</button>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-6" style="margin-top: 40px;">
				<div class="row">
					<form:form method="post" action="http://localhost:8080/web-test/authentication">
						<div class="col-md-4 input-group" style="margin: auto; margin-bottom: 15px;">
							<input style="border-radius: 5px; width: 100%;!important"
								name="username" type="text" class="form-control"
								placeholder="Usu&aacute;rio">
						</div>
						<div class="col-md-4 input-group"
							style="margin: auto; margin-bottom: 15px;">
							<input style="border-radius: 5px; width: 100%;!important"
								name="password" type="password" class="form-control"
								placeholder="Senha">
						</div>
						<div class="col-md-2 input-group"
							style="margin: auto; text-align: center; margin-bottom: 15px;">
							<button type="submit"
								class="btn btn-success dropdown-toggle buttonInputGroup"
								value="send">Entrar</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="msgErrorLogin" style="margin: auto; text-align: center; color: red;">
				${errorLogin}
		</div>
		<div class="about" style="margin-top: 300px;">
			<div class="row">
				<div class="proposta col-md-6">
					<h1>Proposta</h1>
					<h5>O objetivo deste trabalho &eacute; desenvolver um sistema Web que permita contribuir na comunica&ccedil;&atilde;o entre os integrantes,
					 e oferecer a possibilidade de gerenciar os arquivos produzidos durante o Trabalho de Conclus&atilde;o de Curso do curso de 
					 Sistemas de Informa&ccedil;&atilde;o da Universidade do Sul de Santa Catarina &mdash; UNISUL.</h5>
					 
					 <h1>Orientadora</h1>
					 <h5><spam style="font-style: italic;font-family: -webkit-pictograph;font-size: 26px;">Prof&ordf;. Daniella Vieira, MEng.</spam><br>
						Professora de Computa&ccedil;&atilde;o e Sistemas de Informa&ccedil;&atilde;o<br>
						vieira.daniella@gmail.com
					 </h5>
				</div>
				<div class="proposta col-md-6" style="text-align: -webkit-right;">
					<h1>Autores</h1>
					<h5><spam style="font-style: italic;font-family: -webkit-pictograph;font-size: 26px;">Alexsandro Valdez Rospide Capra</spam><br>
						Acad&ecirc;mico do Curso de Sistemas de Informa&ccedil;&atilde;o<br>
						Universidade do Sul de Santa Catarina &mdash; UNISUL<br>
						alexrospide@gmail.com
					</h5>
					<br>
					<h5><spam style="font-style: italic;font-family: -webkit-pictograph;font-size: 26px;">Miratan Lehmkuhl da Silva</spam><br>
						Acad&ecirc;mico do Curso de Sistemas de Informa&ccedil;&atilde;o<br>
						Universidade do Sul de Santa Catarina &mdash; UNISUL<br>
						miratansc@gmail.com
					</h5>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>