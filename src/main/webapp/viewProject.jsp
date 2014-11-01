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
	
// 	if(edit == "false"){
// 	}
	if(view == "false"){
		$('.table').addClass('hidden');
	}
	if(view == "false" && edit == "false"){
		$('.subContainer').append('<div class="col-md-12" style="height: 60px;margin-top: 30px;font-size:18px; text-align:center;">Suas permissões foram desativadas (visualização e/ou edição) neste projeto. Entre em contato com o responsável!</div>');
	}
	
	
	
	$.ajax({
		url : "project/viewProjectInfo/"+id,
		type : "GET",
		success : function(response) {
				console.log(response);
				var trInfoProject = "";
				var trNoteProject = "";
				var trUsersProject = "";
				var trFilesProject = "";
				$.each(response, function(index, value) {
				var data = value.deliveryDate;
				var res = data.split("-");
				var dataFinal = res[2]+'/'+res[1]+'/'+res[0];
				
				trInfoProject += '	<tr>'
							  +	 '	<td style="width: 30%">'+value.title+'</td>'
							  +	 '	<td style="width: 50%">'+value.description+'</td>'
							  +	 '	<td>'+dataFinal+'</td>'
							  +	 '	</tr>';
							  
				$.each(value.note, function(index, val){
					
					trNoteProject += '	<tr>'
								  +	 '		<td style="width: 50%">'+val.description+'</td>'
								  +	 '		<td style="width: 25%">'+val.userCreator+'</td>'
								  +	 '		<td style="width: 25%">'+val.dateCreated+'</td>'
								  +	 '	</tr>';
					
				});
				
				$.each(value.user, function(index, val){
					
					trUsersProject+= '	<tr>'
								  +	 '		<td style="text-transform: uppercase;">'+val+'</td>'
								  +	 '	</tr>';
					
				});
				
				$.each(value.file, function(index, val){
					
					trFilesProject+= '	<tr data-fileid="'+val.fileId+'" data-projectid="'+val.projectId+'" data-filepath="'+val.filePath+'">'
								  +	 '		<td>'+val.nameFile+'</td>'
								  +	 '		<td>'+val.userCreator+'</td>'
								  +	 '		<td>'+val.dateCreated+'</td>'
								  +	 '		<td>'+val.description+'</td>'
								  +  '		<td style="color: forestgreen;"><span class="glyphicon glyphicon-download downloadFile"></span></td>'
								  +  '		<td style="color: red;"><span class="glyphicon glyphicon-remove deleteFile"></span></td>'
								  +	 '	</tr>';
					
				});
							  
							  
				});
			$('.tbFiles').append(trFilesProject);
			$('.tbColaboradores').append(trUsersProject);
			$('.tbProjects').append(trInfoProject);
			$('.tbNotes').append(trNoteProject);
			
			
			
			$('.deleteFile').off('click');
			$('.deleteFile').on('click', function(){
				var $tr = $(this).closest('tr');
				console.log($tr.data('fileid'));
				var fileIdToDelete = $tr.data('fileid');
				var projectId = $tr.data('projectid');
				
				window.location.href='http://localhost:8080/web-test/file/deleteFile/'+fileIdToDelete;
				
			});
			
			
			
			
			$('.downloadFile').off('click');
			$('.downloadFile').on('click', function(){
				var $tr = $(this).closest('tr');
				var projectId = $tr.data('projectid');
				var file = $tr.data('filepath');
				var character = file.split("\\");
				var id = character[0];
				var view = character[1];
				var edit = character[2];
				var filePath = character[3];
				
				var characterExtensao = filePath.split(".");
				var filePathSend = characterExtensao[0];
				var format = characterExtensao[1];
				
				window.location.href='http://localhost:8080/web-test/file/download/'+projectId+'/'+filePathSend+'/'+format;
				
// 				$.ajax({
// 					url : "file/download/"+projectId+"/"+filePath,
// 					type : "GET",
// 					success : function(response) {
// 						window.location.href='http://localhost:8080/web-test/viewProject.jsp?'+projectId+'/'+view+'/'+edit;
// 					}
// 				});
				
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

	<div class="container" style="margin-top: -20px; margin-bottom: 100px;">
		
		<div class="row subContainer">
			<div class="panel panel-default col-md-9">
				<table class="table">
					<thead>
						<tr>
							<th style="text-transform: uppercase; width: 30%">Título</th>
							<th style="text-transform: uppercase; width: 50%">Descrição</th>
							<th style="text-transform: uppercase;">Data da Entrega</th>
						</tr>
					</thead>
					<tbody class="tbProjects">
<!-- 						<tr> -->
<!-- 							<td>Trabalho de Conclusão de Curso apresentado ao Curso de Graduação em Sistemas de Informação da Universidade do Sul de Santa Catarina, como requisito parcial à obtenção do título de Bacharel em Sistemas de Informação</td> -->
<!-- 							<td>14/11/2014</td> -->
<!-- 						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="panel panel-default col-md-3">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-transform: uppercase;">Colaboradores</th>
						</tr>
					</thead>
					<tbody class="tbColaboradores">
<!-- 						<tr> -->
<!-- 							<td>Carlos Alberto</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>Gustavo Borges</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>John John Florence</td> -->
<!-- 						</tr> -->
					</tbody>
				</table>
			</div>
		</div>


		<div class="row" style="margin-top: 20px;">
			<div class="panel panel-default col-md-12" style="margin-bottom: 70px;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-transform: uppercase; width: 20%">Arquivo</th>
							<th style="text-transform: uppercase; width: 20%">Usuário</th>
							<th style="text-transform: uppercase; width: 10%">Data</th>
							<th style="text-transform: uppercase; width: 40%">Comentário</th>
							<th style="width: 5%"></th>
							<th style="width: 5%"></th>
						</tr>
					</thead>
					<tbody class="tbFiles">
<!-- 						<tr> -->
<!-- 							<td>TCC_CARLOS_JOHN_CAP_5</td> -->
<!-- 							<td>18/10/2014</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>AJUSTES_CAP_4</td> -->
<!-- 							<td>10/10/2014</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>TCC_CARLOS_JOHN_CAP_4</td> -->
<!-- 							<td>21/09/2014</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>AJUSTES_CAP_3</td> -->
<!-- 							<td>05/09/2014</td> -->
<!-- 						</tr> -->
					</tbody>
				</table>
			</div>
			<div class="panel panel-default col-md-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-transform: uppercase; width: 50%">Comentários</th>
							<th style="text-transform: uppercase; width: 25%">Usuário</th>
							<th style="text-transform: uppercase; width: 25%">Data</th>
						</tr>
					</thead>
					<tbody class="tbNotes">
<!-- 						<tr> -->
<!-- 							<td style="width: 50%">Professor, versão 5 disponível!</td> -->
<!-- 							<td style="width: 25%">John John Florence</td> -->
<!-- 							<td style="width: 25%">18/10/2014</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td style="width: 50%">Informo que o prazo está chegando e gostaria de uma versão atualizada com as correções mencionadas no comentário do dia 10/10/2014.</td> -->
<!-- 							<td style="width: 25%">Gustavo Borges</td> -->
<!-- 							<td style="width: 25%">17/10/2014</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td style="width: 50%">Realizar mudanças no Capítulo 4. Detalhes no arquivo AJUSTES_CAP_4.</td> -->
<!-- 							<td style="width: 25%">Gustavo Borges</td> -->
<!-- 							<td style="width: 25%">10/10/2014</td> -->
<!-- 						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
		
		

	</div>
</body>
</html>