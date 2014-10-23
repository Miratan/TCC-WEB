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
	
	//GET - PROJETOS DO USUÁRIO LOGADO
	$.ajax({
		url : "project/findUserLogged",
		type : "GET",
		success : function(response) {
			var tr = "";
			console.log(response);
			$.each(response, function(index, value) {
				
				var data = value.deliveryDate;
				var res = data.split("-");
				var dataFinal = res[2]+'/'+res[1]+'/'+res[0];
				
				tr 	+= '<tr data-id="'+value.projectId+'">'
					+ '		<td style="width: 25%;word-break: break-word;word-wrap: break-word;" class="name">'+value.title+'</td>'
					+ '		<td style="width: 40%;word-break: break-word;word-wrap: break-word;" class="desc">'+value.description+'</td>'
					+ '		<td class="date">'+dataFinal+'</td>'
					+ ' 	<td><span class="glyphicon glyphicon-comment btnAddNote" style="color: coral;cursor:pointer;"></span></td>'
					+ ' 	<td><span class="glyphicon glyphicon-user btnAddUser" style="color: darkgreen;cursor:pointer;"></span></td>'
					+ '		<td><span class="glyphicon glyphicon-pencil btnEdit" style="color: darkblue;cursor:pointer;"></span></td>'
					+ ' 	<td><span class="glyphicon glyphicon-remove btnDelete" style="color: red;cursor:pointer;"></span></td>'
					+ '</tr>'
			});
				$('.tbProjects').append(tr);
				
				$('#myModal').find('#myModalLabel').html('PROJEToOOo!');
				
				$('.tbProjects').find('.btnEdit').off('click');
				$('.tbProjects').find('.btnEdit').on('click', function(){
						var $tr = $(this).closest('tr');
						var idTr = $tr.data('id');
						window.location.href='http://localhost:8080/web-test/editProjectGeneric.jsp?'+idTr+'';
				});
				
				$('.tbProjects').find('.btnAddNote').off('click');
				$('.tbProjects').find('.btnAddNote').on('click', function(){
						var $tr = $(this).closest('tr');
						var idTr = $tr.data('id');
						window.location.href='http://localhost:8080/web-test/addNoteInProject.jsp?'+idTr+'';
				});
				
				$('.tbProjects').find('.btnAddUser').off('click');
				$('.tbProjects').find('.btnAddUser').on('click', function(){
						var $tr = $(this).closest('tr');
						var idTr = $tr.data('id');
						window.location.href='http://localhost:8080/web-test/users.jsp?'+idTr+'';
				});
				
				
				$('.tbProjects').find('.btnDelete').off('click');
				$('.tbProjects').find('.btnDelete').on('click', function(){
					console.log("delete projeto");
					var $trRemove = $(this).closest('tr');
					var idRemove = $trRemove.data('id');
					console.log("ID: "+ idRemove);
					
					$.ajax({
					    url: 'project/deleteProject/'+idRemove,
					    type: 'DELETE',
					    success: function(result) {
					    	console.log(result);
					    }
					}).done(function() {
						location.reload();
					}).fail(function(par1, par2, par3) {
					}).always(function() {
					});
					
				});
				
			}
		});
	
	
	//GET - PROJETOS QUE USUÁRIO COLABORA
	$.ajax({
		url : "project/collaborativeProjects",
		type : "GET",
		success : function(response) {
				console.log(response);
				var tr = "";
				$.each(response, function(index, value) {
					
					var projectId = value.projectId;
					var userId = -10;
					
					var data = value.deliveryDate;
					var res = data.split("-");
					var dataFinal = res[2]+'/'+res[1]+'/'+res[0];
					
					tr 	+= '<tr data-id="'+value.projectId+'">'
						+ '		<td style="width: 25%;word-break: break-word;word-wrap: break-word;" class="name">'+value.title+'</td>'
						+ '		<td style="width: 40%;word-break: break-word;word-wrap: break-word;" class="desc">'+value.description+'</td>'
						+ '		<td class="date">'+dataFinal+'</td>';
						
					var tds;
					$.ajax({
						url : "project/permission/"+projectId+"/"+userId,
						type : "GET",
						success : function(response) {
								console.log(response);
								if(response.edit == true){
									tr	+= ' 	<td data-editpermission="'+response.edit+'"><span class="glyphicon glyphicon-comment btnAddNote" style="color: coral;cursor:pointer;"></span></td>';
								}else
									if(response.view == true){
										tr	+= ' 	<td data-viewpermission="'+response.view+'"><span class="glyphicon glyphicon-comment btnAddNote" style="color: coral;cursor:pointer;"></span></td>';
										
									}else{
										tr	+= ' 	<td></td>';
									}
								tr += ' 	<td></td>'
									+ ' 	<td></td>'
									+ ' 	<td></td>';
								tr	+= '</tr>';
								$('.tbProjects').append(tr);
								
								$('.tbProjects').find('.btnAddNote').off('click');
								$('.tbProjects').find('.btnAddNote').on('click', function(){
										var $tr = $(this).closest('tr');
										var idTr = $tr.data('id');
										window.location.href='http://localhost:8080/web-test/addNoteInProject.jsp?'+idTr+'';
								});
								
							}
						});
					
				});
			}
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
				Meus Projetos
			</h3>
		</div>
		<div class="panel panel-default">
<!-- 			<div class="panel-heading"> -->
<!-- 			</div> -->

		<table class="table">
	        <thead>
	          <tr>
	            <th style="text-transform: uppercase;">Título</th>
	            <th style="text-transform: uppercase;">Descrição</th>
	            <th style="text-transform: uppercase;">Data da Entrega</th>
	            <th style="width: 5%;"></th>
	            <th style="width: 5%;"></th>
	            <th style="width: 5%;"></th>
	            <th style="width: 5%;"></th>
	          </tr>
	        </thead>
	        <tbody class="tbProjects">
	        </tbody>
	      </table>
		</div>

	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Edição de Projetos</h4>
				</div>
				<div class="modalBody">
				
				
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-primary">Salvar</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>