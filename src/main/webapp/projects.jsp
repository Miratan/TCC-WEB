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
		url : "god/allProject",
		type : "GET",
		success : function(response) {
			var tr = "";
			console.log(response);
			$.each(response, function(index, value) {
				
				var data = value.deliveryDate;
				var res = data.split("-");
				var dataFinal = res[2]+'/'+res[1]+'/'+res[0];
				
				tr 	+= '<tr>'
					+ '		<td>'+value.id+'</td>'
					+ '		<td style="width: 25%;word-break: break-word;word-wrap: break-word;">'+value.title+'</td>'
					+ '		<td style="width: 40%;word-break: break-word;word-wrap: break-word;">'+value.description+'</td>'
					+ '		<td>'+dataFinal+'</td>'
					+ '		<td data-id="'+value.id+'"><span class="glyphicon glyphicon-pencil btn-edit" style="color: darkblue;"></span><span class="glyphicon glyphicon-remove btn-remove" style="color: red;float: right;"></span></td>'
					+ '</tr>'
			});
				$('.tbProjects').append(tr);
			}
		});
	
		$('.btn-edit').on('click', function() {
			console.log("edição");
		});

	});
</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuGodMode.jsp"/>
	</div>

	<div class="container" style="margin-top: 30px;">
		<div class="panel panel-default">
<!-- 			<div class="panel-heading"> -->
<!-- 			</div> -->

		<table class="table">
	        <thead>
	          <tr>
	            <th>ID</th>
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

</body>
</html>