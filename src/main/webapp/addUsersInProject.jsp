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
	
	var url   = window.location.search.replace("?", "");
	window.history.pushState(null, null, 'http://localhost:8080/web-test/indexUser.jsp');
	var element = url.split("/");
	var idUser = element[0];
	var idProject = element[1];
	
	$.ajax({
		url : "login/userId/"+idUser,
		type : "GET",
		success : function(response) {
			var tr = "";
			console.log(response);
			tr 	+= '<tr data-id="'+response.userId+'">'
				+ '		<td>'+response.nameUser+'</td>'
				+ '		<td>'+response.email+'</td>'
				+ '		<td>'+response.course+'</td>'
				+ ' 	<td style="width: 10%;word-break: break-word;word-wrap: break-word;text-align: center;"><input type="checkbox" name="edit"></td>'
				+ '		<td style="width: 10%;word-break: break-word;word-wrap: break-word;text-align: center;"><input type="checkbox" name="view"></td>'
				+ '</tr>';
			$('.tbUsers').append(tr);
		}
	});
	
	$('.container').find('.btn-warning').off('click');
	$('.container').find('.btn-warning').on('click', function(){
			window.location.href='http://localhost:8080/web-test/users.jsp';
	});
	
});
</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	 <div class="container" style="margin-top: -30px;">
	
		<div class="titleTCC" style="width: 70%;margin: auto;">
	
			<h3 style="padding: 10px 15px;text-align: center;">
				Permissões no Projeto
			</h3>
		</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-5" style="text-align: center;"> -->
<!-- 				<input id="user" name="user" maxlength="60" type="text" class="form-control user" style="width: 100%; margin-bottom: 15px;" placeholder="Pesquise por Usuários"> -->
<!-- 				<div class="form-group"> -->
<!-- 					<div class="col-md-12" style="text-align: center;"> -->
<!-- 						<div> -->
<!-- 							<button type="submit" class="btn btn-info btnSearchUser" style="width: 150px">Buscar</button> -->
<!-- 							<button type="submit" class="btn btn-warning btnClearAll" style="margin-left: 15px;">Limpar</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<div class="col-md-12 panel panel-default" style="margin-top: 30px;">
			<table class="table">
				<thead>
					<tr>
						<th style="text-transform: uppercase;">Nome do Usuário</th>
						<th style="text-transform: uppercase;">E-mail</th>
						<th style="text-transform: uppercase;">Curso</th>
						<th style="text-transform: uppercase;text-align: center;">Edição</th>
						<th style="text-transform: uppercase;text-align: center;">Visualização</th>
					</tr>
				</thead>
				<tbody class="tbUsers" data-projectId="">
				</tbody>
			</table>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div>
					<button type="submit" class="btn btn-warning btnBack" style="float: right;">Voltar</button>
					<button type="submit" class="btn btn-success btnSavePermissions" style="float: right;margin-right: 15px;">Salvar</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>