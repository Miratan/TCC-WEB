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
		url : "file/allFiles",
		type : "GET",
		success : function(response) {
			var tr = "";
			console.log(response);
			$.each(response, function(index, value) {
				
				tr 	+= '<tr>'
					+ '		<td>'+value.id+'</td>'
					+ '		<td style="width: 70%;word-break: break-word;word-wrap: break-word;">'+value.description+'</td>'
					+ '		<td data-id="'+value.id+'"><span class="glyphicon glyphicon-pencil btn-edit" style="color: darkblue;"></span><span class="glyphicon glyphicon-remove btn-remove" style="color: red;float: right;"></span></td>'
					+ '</tr>'
				
				value.description;
				value.id;
			});
				$('.tbFiles').append(tr);
			}
		});
	

	});
</script>

</head>
<body>
	<div id="header">
    	<jsp:include page="menuGodMode.jsp"/>
	</div>

	<div class="container">
		<div class="panel panel-default">
			<table class="table">
		        <thead>
		          <tr>
		            <th>ID</th>
		            <th style="text-transform: uppercase;">Descrição</th>
		            <th style="width: 10%;"></th>
		          </tr>
		        </thead>
		        <tbody class="tbFiles">
		        </tbody>
		      </table>
		</div>
	</div>
</body>
</html>