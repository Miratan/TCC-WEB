<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Web - TCC</title>
<script type="text/javascript">
	
</script>
</head>
<body>

	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
		<jsp:include page="menuUserLogged.jsp" />
	</div>

	<div class="container" style="margin-top: -20px; margin-bottom: 100px;">
		<div class="col-md-12">
			<form method="POST" action="file" enctype="multipart/form-data">
					<div class="form-inline">
						<div class="col-md-4">
							<input type="file" name="file" id="file">
						</div>
						<div class="col-md-6">
							<span>Nome do Arquivo</span>
							<input class="form-control" type="text" name="name" id="name" style="width: 75%;">
						</div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-success" value="send">Enviar</button>
						</div>
					</div>
			</form>
		</div>

		<div class="panel panel-default col-md-12" style="margin-top: 40px;">
			<table class="table">
				<thead>
					<tr>
						<th style="text-transform: uppercase; width: 50%">Arquivos</th>
						<th style="text-transform: uppercase; width: 40%">Usuário</th>
						<th style="text-transform: uppercase;">Data</th>
					</tr>
				</thead>
				<tbody class="tbColaboradores">
					<tr>
						<td>TCC_CARLOS_JOHN_CAP_5</td>
						<td>Carlos Alberto</td>
						<td>18/10/2014</td>
					</tr>
					<tr>
						<td>AJUSTES_CAP_4</td>
						<td>Gustavo Borges</td>
						<td>10/10/2014</td>
					</tr>
					<tr>
						<td>TCC_CARLOS_JOHN_CAP_4</td>
						<td>Carlos Alberto</td>
						<td>21/09/2014</td>
					</tr>
					<tr>
						<td>AJUSTES_CAP_3</td>
						<td>Gustavo Borges</td>
						<td>05/09/2014</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>