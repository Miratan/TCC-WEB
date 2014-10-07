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
// 					var data = value.deliveryDate;
// 					var res = data.split("-");
// 					var dataFinal = res[2]+'/'+res[1]+'/'+res[0];
					tr 	+= '<tr>'
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
	
// 	console.log('ID PROJETO: '+id);
// 	$('#selectUser').attr('idProject', id);
	
// 	$.ajax({
// 		url : "god/allUser",
// 		type : "GET",
// 		success : function(response) {
// 			console.log(response);
// 			$('#selectUserAvailable').attr('size', response.length);
// 			$.each(response, function(index, value) {
// 				$('#selectUserAvailable').append('<option data-id="'+value.userId+'" value="'+value.nameUser+'">'+value.nameUser+'</option>');
// 			});
// 		}
// 	});
	
	
	
// 	$('.btnAddUser').off('click');
// 	$('.btnAddUser').on('click', function(){
// 		var valueText = $('#selectUserAvailable').val();
// 		var idValue = $("#selectUserAvailable option:selected").data('id');
// 		$( "#selectUserAvailable option:selected" ).remove();
// 		if(valueText){
// 			$('#selectUser').append('<option data-id="'+idValue+'">'+valueText+'</option>');
// 		}
// 	});
	
});
</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-5" style="text-align: center;">
				<input id="user" name="user" maxlength="60" type="text" class="form-control user" style="width: 100%; margin-bottom: 15px;" placeholder="Pesquise por Usuários">
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
						<th style="text-transform: uppercase;">Nome do Usuário</th>
						<th style="text-transform: uppercase;">E-mail</th>
						<th style="text-transform: uppercase;">Curso</th>
						<th style="text-transform: uppercase;text-align: center;">Edição</th>
						<th style="text-transform: uppercase;text-align: center;">Vizualização</th>
						<th style="text-transform: uppercase;text-align: center;">Não sei</th>
					</tr>
				</thead>
				<tbody class="tbUsers">
				</tbody>
			</table>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div>
					<button type="submit" class="btn btn-success btnSavePermissions" value="send">Salvar</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>