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
	
<title>Web - TCC</title>

<script type="text/javascript">

var SYSTEM_URL = "localhost:8080/web-test/";

// 	var projects = ${myProjects};
	
// 	var tr = "";
// 	$.each(projects, function (key, valor){
		
// 		console.log(valor);

// 	var title = ${myProjects.getTitle().toString()};
// 	var desc = ${myProjects.getDescription()};
// 	var data = ${myProjects.getDeliveryDate()};
		
		var tr  = 	'<tr> '
				+	'<td> VAZIO </td>'
				+	'<td> VAZIO </td>'
				+	'<td> VAZIO </td>'
				+	'<td> VAZIO </td>'
				+	'</tr>';
		
// 	});
	
	var table = $('#tableProject').find();
	table.append(tr);
	
		
</script>

</head>
<body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/logged.jsp">Web TCC</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          	<li><a href="${pageContext.request.contextPath}/project.jsp">Novo Projeto</a></li>
            <li><a href="${pageContext.request.contextPath}/myProjects">Meus Projetos</a></li>
            <li><a href="${pageContext.request.contextPath}/myAccount.jsp">Minha Conta</a></li>
            <li><a href="${pageContext.request.contextPath}/report">Relatórios</a></li>
          </ul>
          
          <ul class="nav navbar-nav" style="margin-left:520px;">
            <li style="margin-top: 15px;font-size: 15px;color: darkgray;">Olá, !</li>
          </ul>
          
          <ul class="final" style="margin-left:1070px;">
          <li>
          <div class="col-md-12">
          		<a class="navbar-brand glyphicon glyphicon-off" href="logout.jsp"></a>
          </div>
          </li>
          </ul>
        </div>
      </div>
    </div>

    <div class="container" style="margin-top: 30px;">
    
   		<h1 style="padding: 40px 15px;text-align: center;">
			Ferramenta Web de Acompanhamento e Versionamento de	Trabalhos Acadêmicos
		</h1>

		<div class="panel panel-default">
			<!-- Default panel contents -->
			<!-- Table -->
			<table class="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Description</th>
						<th>Data da Entrega</th>
					</tr>
				</thead>
				<tbody id="tableProject">
				</tbody>
			</table>
		</div>





	</div><!-- /.container -->

</body>
</html>