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
	
	
});
</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>

	<div class="container" style="margin-top: -20px; margin-bottom: 100px;">
	
		<div class="textCenterAcess" style="text-align: center;">
			<div class="col-md-12">
				<div class="form-inline">
					<div class="col-md-4 col-md-offset-2">
					<div class="row">
						<span>Faixa etária</span>
					</div>
						<select required title="Selecione">
						  <option>Selecione..</option>
						  <option value="17">De 17 a 25 anos</option>
						  <option value="26">De 26 a 35 anos</option>
						  <option value="36">De 36 a 45 anos</option>
						  <option value="45">Maior de 45 anos</option>
						</select>
					</div>
					<div class="col-md-4">
					<div class="row">
						<span>Profissão</span>
					</div>
						<input type="radio" name="profissao" value="estudante">Estudante<br>
						<input type="radio" name="profissao" value="professor">Professor<br>
						<input type="radio" name="profissao" value="other">Outros
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>