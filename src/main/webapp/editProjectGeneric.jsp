<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<title>Web - TCC</title>

<script type="text/javascript">
$(document).ready(function(){
	var url   = window.location.search.replace("?", "");
	window.history.pushState(null, null, 'http://localhost:8080/web-test/indexUser.jsp');
	
	var id = url.split("&");
	
	$.ajax({
		url : "project/findById/"+id,
		type : "GET",
		success : function(response) {
			var tr = "";
				var data = response.deliveryDate;
				var res = data.split("-");
				var dataFinal = res[2]+'/'+res[1]+'/'+res[0];
				
				tr 	+= '<tr data-id="'+response.projectId+'">'
					+ '		<td style="width: 25%;word-break: break-word;word-wrap: break-word;" class="name">'+response.title+'</td>'
					+ '		<td style="width: 40%;word-break: break-word;word-wrap: break-word;" class="desc">'+response.description+'</td>'
					+ '		<td class="date">'+dataFinal+'</td>'
					+ '		<td><span class="glyphicon glyphicon-pencil btnEdit" style="color: darkblue;cursor:pointer;"></span><span class="glyphicon glyphicon-remove btnDelete" style="color: red;float: right;cursor:pointer;"></span></td>'
					+ '</tr>';
					
			$('.tbProjects').append(tr);
				
			}
		});
	
	
	
});
</script>

</head>
<body>
	<!--  CHAMADA MENU FIXO PARA USUÁRIO SEM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
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

</body>
</html>