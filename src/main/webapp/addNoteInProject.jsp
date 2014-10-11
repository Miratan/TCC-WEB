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
	
	$('.container').data('projectid', id);
	
	var now = new Date();
    var today = now.getDate()  + '/' + (now.getMonth() + 1) + '/' + now.getFullYear();
    $('.container').find("#dataCriacao").val(today);
    
    
    $.ajax({
			url : "project/searchNotes/"+id,
			type : "GET",
			success : function(response) {
				console.log(response);
				var tr 	= '<tr>';
				$.each(response, function(index, value) {
					tr 	+= '	<td class="name">'+value.userCreator+'</td>'
						+  '	<td class="data">'+value.dateCreated+'</td>'
						+  '	<td class="description">'+value.description+'</td>'
						+  ' </tr>';
				});
			
				$('.tbNotes').append(tr);
			}
		});
    
	
// 	$('.btnSearchUser').off('click');
// 	$('.btnSearchUser').on('click', function(){
// 		var valueToSearch = $('#user').val();
// 		console.log(valueToSearch);
// 		$('.tbUsers').html('');
// 	 	$.ajax({
// 			url : "login/search/"+valueToSearch,
// 			type : "GET",
// 			success : function(response) {
// 				console.log(response);
// 				var tr = "";
// 				$.each(response, function(index, value) {
// 					tr 	+= '<tr data-idUser="'+value.userId+'" >'
// 						+ '		<td style="width: 20%;word-break: break-word;word-wrap: break-word;" class="name">'+value.nameUser+'</td>'
// 						+ '		<td style="width: 20%;word-break: break-word;word-wrap: break-word;" class="email">'+value.email+'</td>'
// 						+ '		<td style="width: 20%;word-break: break-word;word-wrap: break-word;" class="course">'+value.course+'</td>'
// 						+ ' 	<td style="width: 10%;word-break: break-word;word-wrap: break-word;text-align: center;"><input type="checkbox" name="edit"></td>'
// 						+ '		<td style="width: 10%;word-break: break-word;word-wrap: break-word;text-align: center;"><input type="checkbox" name="view"></td>'
// 						+ ' 	<td style="width: 10%;word-break: break-word;word-wrap: break-word;text-align: center;"><input type="checkbox" name="not"></td>'
// 						+ '</tr>'
// 				});
				
// 				$('.tbUsers').append(tr);
// 			}
// 		});
// 	});
	
	
	$('.btnSaveNote').off('click');
	$('.btnSaveNote').on('click', function(){
		var projectId = $('.container').data('projectid');
		var description = $('.container').find('#description').val();
		var intProjectId = parseInt(projectId);
		$.ajax({
			url : "project/createNote",
			type : "POST",
			data: { "projectId":intProjectId,
	            	"description":description},
			success : function(response) {
// 				console.log(reponse);
				var tr 	= '<tr>'
						+ '		<td class="name">'+response.userCreator+'</td>'
						+ '		<td class="data">'+response.dateCreated+'</td>'
						+ '		<td class="description">'+response.description+'</td>'
						+ '</tr>';
				$('.tbNotes').append(tr);
				
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
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	<div class="container" style="margin-top: -20px" data-projectid="">
		<div class="row">
			<div class="col-md-4">
				<span style="color: darkblue;font-style: italic;">Comentários</span>
				<textarea rows="4" cols="50" maxlength="255" class="form-control" id="description" name="description" style="width: 100%;margin-bottom: 15px;" placeholder="Descrição"></textarea>
			</div>
			<div class="col-md-2">
				<span style="color: darkblue;font-style: italic;">Data</span>
				<input id="dataCriacao" name="dataCriacao" type="date" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-12">
				<div>
					<button type="submit" class="btn btn-success btnSaveNote">Salvar</button>
					<button type="submit" class="btn btn-warning">Limpar</button>
				</div>
			</div>
		</div>

		<div class="col-md-12 panel panel-default" style="margin-top: 30px;">
			<table class="table">
				<thead>
					<tr>
						<th style="text-transform: uppercase;">Usuário</th>
						<th style="text-transform: uppercase;">Data</th>
						<th style="text-transform: uppercase;width: 50%;">Comentários</th>
					</tr>
				</thead>
				<tbody class="tbNotes" data-projectId="">
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>