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
	var id = element[0];
	var view = element[1];
	var edit = element[2];
	
	if(edit == "false"){
		$('.noPermission').addClass('hidden');
		$('.btnSaveNote').addClass('hidden');
		$('.btnClean').addClass('hidden');
	}
	if(view == "false"){
		$('.table').addClass('hidden');
	}
	if(view == "false" && edit == "false"){
		$('.panel-default').append('<div class="col-md-12" style="height: 60px;margin-top: 30px;font-size:18px; text-align:center;">Suas permissões foram desativadas (visualização e/ou edição) neste projeto. Entre em contato com o responsável!</div>');
	}
	
	$('.container').data('projectid', id);
	$('#description').focus();
    
    $.ajax({
			url : "project/searchNotes/"+id,
			type : "GET",
			success : function(response) {
				console.log(response);
				var tr 	= '<tr>';
				var i = 1;
				$.each(response, function(index, value) {
					tr 	+= '	<td class="id">'+i+'</td>'
						+  '	<td class="name">'+value.userCreator+'</td>'
						+  '	<td class="data">'+value.dateCreated+'</td>'
						+  '	<td class="description" style="word-break: break-all;">'+value.description+'</td>'
						+  ' </tr>';
						i++;
				});
			
				$('.tbNotes').append(tr);
			}
		});
		
	
	$('.btnSaveNote').off('click');
	$('.btnSaveNote').on('click', function(){
		var projectId = $('.container').data('projectid');
		var description = $('.container').find('#description').val();
		var intProjectId = parseInt(projectId);
		var nextId = $( "tr:last" ).find('.id').text();
		nextId++;
		$.ajax({
			url : "project/createNote",
			type : "POST",
			data: { "projectId":intProjectId,
	            	"description":description},
			success : function(response) {
				var tr 	= '<tr>'
						+ '		<td class="id">'+nextId+'</td>'
						+ '		<td class="name">'+response.userCreator+'</td>'
						+ '		<td class="data">'+response.dateCreated+'</td>'
						+ '		<td class="description" style="word-break: break-all;">'+response.description+'</td>'
						+ '</tr>';
				$('.tbNotes').append(tr);
				$('#description').val('');
				$('#description').focus();
			},
			error : function(data){
				console.log(data);
			}
		});
	});
	
	$('.btnClean').off('click');
	$('.btnClean').on('click', function(){
		$('#description').val('');
		$('#description').focus();
	});
	
	$('.container').find('.btnBack').off('click');
	$('.container').find('.btnBack').on('click', function(){
			window.location.href='http://localhost:8080/web-test/myProjects.jsp';
	});
	
});
</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	<div class="container" style="margin-top: -30px" data-projectid="">
		<div class="titleTCC" style="width: 70%;margin: auto;">
	
			<h3 style="padding: 10px 15px;text-align: center;">
				Comentários do Projeto
			</h3>
		</div>
		<div class="col-md-12 panel panel-default" style="margin-top: 30px;">
			<table class="table">
				<thead>
					<tr>
						<th style="text-transform: uppercase;">#</th>
						<th style="text-transform: uppercase;">Usuário</th>
						<th style="text-transform: uppercase;">Data</th>
						<th style="text-transform: uppercase;width: 50%;">Comentários</th>
					</tr>
				</thead>
				<tbody class="tbNotes" data-projectId="">
				</tbody>
			</table>
		</div>
		
		<div class="row">
			<div class="col-md-12 noPermission">
				<span style="color: darkblue;font-style: italic;" id="coment">Comentários</span>
				<textarea rows="5" cols="200" maxlength="3000" class="form-control" id="description" name="description" style="width: 100%;margin-bottom: 15px;max-width: 100%;" placeholder="Descrição"></textarea>
			</div>
<!-- 			<div class="col-md-2"> -->
<!-- 				<span style="color: darkblue;font-style: italic;">Data</span> -->
<!-- 				<input id="dataCriacao" name="dataCriacao" type="date" class="form-control"> -->
<!-- 			</div> -->
		</div>
		<div class="form-group">
			<div class="col-md-12" style="margin-bottom: 20px">
				<div>
					<button type="submit" class="btn btn-success btnSaveNote">Salvar</button>
					<button type="submit" class="btn btn-warning btnClean">Limpar</button>
					<button type="submit" class="btn btn-warning btnBack" style="margin-left: 15px;float: right;">Voltar</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>