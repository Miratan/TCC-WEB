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
	var id = url.split("&");
	
	$('.tbUsers').data('projectid', id);
	
	$('input#user').focus();
	
	$('.btnClearAll').off('click');
	$('.btnClearAll').on('click', function(){
		$('.tbUsers').html('');
		$('input#user').val('');
		$('input#user').focus();
	});
	
	$('.btnSearchUser').off('click');
	$('.btnSearchUser').on('click', function(){
		var valueToSearch = $('#user').val();
		console.log(valueToSearch);
		$('.tbUsers').html('');
	 	$.ajax({
			url : "login/search/"+valueToSearch,
			type : "GET",
			success : function(response) {
				console.log(response);
				var tr = "";
				$.each(response, function(index, value) {
					tr 	+= '<tr data-idUser="'+value.userId+'" >'
						+ '		<td style="width: 20%;word-break: break-word;word-wrap: break-word;" class="name">'+value.nameUser+'</td>'
						+ '		<td style="width: 20%;word-break: break-word;word-wrap: break-word;" class="email">'+value.email+'</td>'
						+ '		<td style="width: 20%;word-break: break-word;word-wrap: break-word;" class="course">'+value.course+'</td>'
						+ ' 	<td style="width: 10%;word-break: break-word;word-wrap: break-word;text-align: center;"><input type="checkbox" name="edit"></td>'
						+ '		<td style="width: 10%;word-break: break-word;word-wrap: break-word;text-align: center;"><input type="checkbox" name="view"></td>'
						+ ' 	<td style="width: 10%;word-break: break-word;word-wrap: break-word;text-align: center;"><input type="checkbox" name="not"></td>'
						+ '</tr>'
				});
				
				$('.tbUsers').append(tr);
			}
		});
	});
	
	
	$('.btnSavePermissions').off('click');
	$('.btnSavePermissions').on('click', function(){
		var editPermission = $('.tbUsers').find('tr').find("input[name='edit']").is(':checked');
		var viewPermission = $('.tbUsers').find('tr').find("input[name='view']").is(':checked');
		var userId = $('.tbUsers').find('tr').data('iduser');
		var projectId = $('.tbUsers').data('projectid');
		var intProjectId = parseInt(projectId);
		$.ajax({
			url : "project/updateUserPermissions",
			type : "POST",
			data: { "edit":editPermission,
	            	"view":viewPermission,
	            	"idUser":userId,
	            	"projectId":intProjectId},
			success : function(response) {
				console.log(reponse);
			},
			error : function(data){
				console.log(data);
			}
		});
	});
	
	
});
</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USU�RIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-5" style="text-align: center;">
				<input id="user" name="user" maxlength="60" type="text" class="form-control user" style="width: 100%; margin-bottom: 15px;" placeholder="Pesquise por Usu�rios">
				<div class="form-group">
					<div class="col-md-12" style="text-align: center;">
						<div>
							<button type="submit" class="btn btn-info btnSearchUser" style="width: 150px">Buscar</button>
							<button type="submit" class="btn btn-warning btnClearAll" style="margin-left: 15px;">Limpar</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12 panel panel-default" style="margin-top: 30px;">
			<table class="table">
				<thead>
					<tr>
						<th style="text-transform: uppercase;">Nome do Usu�rio</th>
						<th style="text-transform: uppercase;">E-mail</th>
						<th style="text-transform: uppercase;">Curso</th>
						<th style="text-transform: uppercase;text-align: center;">Edi��o</th>
						<th style="text-transform: uppercase;text-align: center;">Vizualiza��o</th>
						<th style="text-transform: uppercase;text-align: center;">N�o sei</th>
					</tr>
				</thead>
				<tbody class="tbUsers" data-projectId="">
				</tbody>
			</table>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div>
					<button type="submit" class="btn btn-success btnSavePermissions">Salvar</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>