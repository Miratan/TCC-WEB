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
		
		<div class="row">
			<div class="panel panel-default col-md-9">
				<table class="table">
					<thead>
						<tr>
							<th style="text-transform: uppercase; width: 75%">Descrição</th>
							<th style="text-transform: uppercase;">Data da Entrega</th>
						</tr>
					</thead>
					<tbody class="tbProjects">
						<tr>
							<td>Trabalho de Conclusão de Curso apresentado ao Curso de Graduação em Sistemas de Informação da Universidade do Sul de Santa Catarina, como requisito parcial à obtenção do título de Bacharel em Sistemas de Informação</td>
							<td>14/11/2014</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="panel panel-default col-md-2" style="margin-left: 10px;">
				<table class="table">
					<thead>
						<tr>
							<th style="text-transform: uppercase;">Colaboradores</th>
						</tr>
					</thead>
					<tbody class="tbColaboradores">
						<tr>
							<td>Carlos Alberto</td>
						</tr>
						<tr>
							<td>Gustavo Borges</td>
						</tr>
						<tr>
							<td>John John Florence</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<div class="row" style="margin-top: 20px;">
			<div class="panel panel-default col-md-7">
				<table class="table">
					<thead>
						<tr>
							<th style="text-transform: uppercase; width: 50%">Comentários</th>
							<th style="text-transform: uppercase; width: 25%">Usuário</th>
							<th style="text-transform: uppercase; width: 25%">Data</th>
						</tr>
					</thead>
					<tbody class="tbProjects">
						<tr>
							<td style="width: 50%">Professor, versão 5 disponível!</td>
							<td style="width: 25%">John John Florence</td>
							<td style="width: 25%">18/10/2014</td>
						</tr>
						<tr>
							<td style="width: 50%">Informo que o prazo está chegando e gostaria de uma versão atualizada com as correções mencionadas no comentário do dia 10/10/2014.</td>
							<td style="width: 25%">Gustavo Borges</td>
							<td style="width: 25%">17/10/2014</td>
						</tr>
						<tr>
							<td style="width: 50%">Realizar mudanças no Capítulo 4. Detalhes no arquivo AJUSTES_CAP_4.</td>
							<td style="width: 25%">Gustavo Borges</td>
							<td style="width: 25%">10/10/2014</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="panel panel-default col-md-4" style="margin-left: 10px;">
				<table class="table">
					<thead>
						<tr>
							<th style="text-transform: uppercase; width: 80%">Arquivos</th>
							<th style="text-transform: uppercase;">Data</th>
						</tr>
					</thead>
					<tbody class="tbColaboradores">
						<tr>
							<td>TCC_CARLOS_JOHN_CAP_5</td>
							<td>18/10/2014</td>
						</tr>
						<tr>
							<td>AJUSTES_CAP_4</td>
							<td>10/10/2014</td>
						</tr>
						<tr>
							<td>TCC_CARLOS_JOHN_CAP_4</td>
							<td>21/09/2014</td>
						</tr>
						<tr>
							<td>AJUSTES_CAP_3</td>
							<td>05/09/2014</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		

	</div>
</body>
</html>