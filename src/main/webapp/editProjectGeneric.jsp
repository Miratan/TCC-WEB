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
			
			$('.textCenterAcess').find('.name').val(response.title);
			$('.textCenterAcess').find('.description').val(response.description);
			$('.textCenterAcess').find('.keyWords').val(response.keyWords);
			$('.textCenterAcess').find('.discipline').val(response.discipline);
			$('.textCenterAcess').find('.deliveryDate').val(response.deliveryDate);
				
			}
		});
	
	$('.textCenterAcess').find('.btn-warning').off('click');
	$('.textCenterAcess').find('.btn-warning').on('click', function(){
			window.location.href='http://localhost:8080/web-test/myProjects.jsp';
	});
});
</script>

</head>
<body>
	<!--  CHAMADA MENU FIXO PARA USUÁRIO SEM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	
	<div class="container" style="margin-top: -30px;">
<!-- 		<div class="panel panel-default"> -->

<!-- 		<table class="table"> -->
<!-- 	        <thead> -->
<!-- 	          <tr> -->
<!-- 	            <th style="text-transform: uppercase;">Título</th> -->
<!-- 	            <th style="text-transform: uppercase;">Descrição</th> -->
<!-- 	            <th style="text-transform: uppercase;">Data da Entrega</th> -->
<!-- 	            <th style="width: 10%;"></th> -->
<!-- 	          </tr> -->
<!-- 	        </thead> -->
<!-- 	        <tbody class="tbProjects"> -->
<!-- 	        </tbody> -->
<!-- 	      </table> -->
<!-- 		</div> -->
		
		<div class="textCenterAcess" style="text-align: center;">
			<div class="col-md-12">
				<form:form  method="post" action="/project/create">
					<div class="form-inline">
						<div class="col-md-12">
							<input id="title" maxlength="200" name="title" type="text" class="form-control name" style="width: 100%;margin-bottom: 15px;">
						</div>
						<div class="col-md-6">
							<textarea rows="4" cols="50" maxlength="3000" class="form-control description" id="description" name="description" style="width: 100%;margin-bottom: 15px;" placeholder="Descrição"></textarea>
<!-- 							<input id="description" name="description" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Descrição"> -->
						</div>
						<div class="col-md-6">
							<input id="keyWords" name="keyWords" maxlength="200" type="text" class="form-control keyWords" style="width: 100%;margin-bottom: 15px;" placeholder="Palavras Chaves">
						</div>
						<div class="col-md-6">
							<input id="discipline" name="discipline" maxlength="200" type="text" class="form-control discipline" style="width: 100%;margin-bottom: 15px;margin-top: 10px;" placeholder="Disciplina">
						</div>
						<div class="col-md-12" style="text-align: left;">
							<div>
								<span style="color: darkblue;font-style: italic;">Data Estimada da Entrega</span>
							</div>
							<input id="deliveryDate" name="deliveryDate" type="date" class="form-control deliveryDate" style="margin:auto;margin-bottom: 15px;min-width: 197px;" placeholder="Data da Entrega">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div>
								<button type="submit" class="btn btn-success" style="width:150px">Salvar</button>
								<button type="submit" class="btn btn-warning" style="margin-left: 15px;">Voltar</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>

	</div>

</body>
</html>