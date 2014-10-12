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

	$.ajax({
		url : "god/allUser",
		type : "GET",
		success : function(response) {
			var tr = "";
			console.log(response);
			$.each(response, function(index, value) {
				tr 	+= '<tr data-id="'+value.userId+'">'
					+ '		<td>'+value.nameUser+'</td>'
					+ '		<td>'+value.email+'</td>'
					+ '		<td>'+value.course+'</td>'
					+ '		<td style="text-align:center;"><span class="glyphicon glyphicon-wrench btnAddPermission" style="color: darkblue;cursor:pointer;"></span></td>'
					+ '</tr>'
			});
			
			$('.tbUsers').append(tr);
				
			$('.btnAddPermission').off('click');
			$('.btnAddPermission').on('click', function(){
				
				var idProject = $('.tbUsers').data('projectid');
				var idUser = $(this).closest('tr').data('id');
				
				window.location.href='http://localhost:8080/web-test/addUsersInProject.jsp?'+idUser+'/'+idProject;
				
			});
		}
	});
	
	$('.container').find('.btn-warning').off('click');
	$('.container').find('.btn-warning').on('click', function(){
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

	<div class="container" style="margin-top: 30px;">
		<div class="panel panel-default">
<!-- 			<div class="panel-heading"> -->
<!-- 			</div> -->

		<table class="table">
	        <thead>
	          <tr>
	            <th style="text-transform: uppercase;width: 30%;">Nome</th>
	            <th style="text-transform: uppercase;width: 30%;">Email</th>
	            <th style="text-transform: uppercase;width: 30%;">Curso</th>
	            <th style="text-transform: uppercase;width: 10%;">Permissões</th>
	          </tr>
	        </thead>
	        <tbody class="tbUsers" data-projectId="">
	        </tbody>
	      </table>
		</div>
		<button type="submit" class="btn btn-warning" style="margin-left: 15px;float: right;">Voltar</button>

	</div>

</body>
</html>