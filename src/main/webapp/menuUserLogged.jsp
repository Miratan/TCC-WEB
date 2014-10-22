<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$.ajax({
		url : "authentication/userLogged",
		type : "GET",
		success : function(response) {
			console.log(response);
			$('.nameInfo').html("Olá, "+response);
		}
	});
});

</script>



<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">Web TCC</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="myProjects.jsp">Meus Projetos</a></li>
				<li><a href="newProject.jsp">Novo Projeto</a></li>
				<li><a href="myAccount.jsp">Meus Dados</a></li>
				<li><a href="othersProjects.jsp">Outros Projetos</a></li>
            	<li class="nameInfo" style="margin-top: 15px;font-size: 15px;color: darkgray;margin-left: 300px;"></li>
          		<li style="margin-left: 5px;"><a class="navbar-brand glyphicon glyphicon-off" href="${pageContext.request.contextPath}/authentication/logout"></a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>

<div class="titleTCC" style="width: 70%;margin: auto;">

	<h1 style="padding: 60px 15px;text-align: center;">
		Ferramenta Web de Acompanhamento e Versionamento de	Trabalhos Acadêmicos
	</h1>
</div>
