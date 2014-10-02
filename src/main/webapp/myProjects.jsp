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
					+ '		<td style="width: 25%;word-break: break-word;word-wrap: break-word;">'+value.title+'</td>'
					+ '		<td style="width: 40%;word-break: break-word;word-wrap: break-word;">'+value.description+'</td>'
					+ '		<td>'+dataFinal+'</td>'
					+ '		<td><span data-toggle="modal" data-target="#myModal" class="glyphicon glyphicon-pencil btn-edit myModal" style="color: darkblue;cursor:pointer;"></span><span class="glyphicon glyphicon-remove btnDelete" style="color: red;float: right;cursor:pointer;"></span></td>'
					+ '</tr>'
			});
				$('.tbProjects').append(tr);
				
				
				
				$('.tbProjects').find('.btnDelete').off('click');
				$('.tbProjects').find('.btnDelete').on('click', function(){
					console.log("delete projeto");
					var idRemove = $('.tbProjects').find('tr').data('id');
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
	
	
	});
</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
		
    	<div class="container" style="margin-top: 30px;">
		<div class="panel panel-default">
<!-- 			<div class="panel-heading"> -->
<!-- 			</div> -->

		<table class="table">
	        <thead>
	          <tr>
	            <th style="text-transform: uppercase;">Título</th>
	            <th style="text-transform: uppercase;">Descrição</th>
	            <th style="text-transform: uppercase;">Data da Entrega</th>
	            <th style="width: 10%;"></th>
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
				<div class="modal-body">
				
				
				
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