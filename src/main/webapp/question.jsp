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
	
	
	$('.container').find('.btnSabeQuestions').off('click');
	$('.container').find('.btnSabeQuestions').on('click', function(){
		
		var data = $('form').serialize()+ "&idade="+$('#idade option:selected').val()+"&curso="+$('#curso option:selected').val();
		console.log(data);
		
		$.ajax({
			url : "question",
			type : "POST",
			data: data,
			success : function(response) {
				
			},
			error : function(data){
				console.log(data);
			}
		});
		
		
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
	
		<div class="textCenterAcess" style="text-align: center;">
			<form>
				<div class="col-md-12">
					<div class="form-inline">
						<div class="col-md-4 col-md-offset-2">
						<div class="row">
							<span>Faixa etária</span>
						</div>
							<select id="idade" class="form-control" required title="Selecione">
							  <option>Selecione..</option>
							  <option value="17">De 17 a 25 anos</option>
							  <option value="26">De 26 a 35 anos</option>
							  <option value="36">De 36 a 45 anos</option>
							  <option value="45">Maior de 45 anos</option>
							</select>
						</div>
						<div class="col-md-4">
						<div class="row">
							<span>Caso estudante, qual curso?</span>
						</div>
							<select id="curso" class="form-control" required title="Selecione">
							  <option>Selecione..</option>
							  <option value="ci">Ciência da Computação</option>
							  <option value="si">Sistemas de Informação</option>
							  <option value="other">Outros</option>
							</select>
						</div>
					</div>
					
					<div class="col-md-8 col-md-offset-2" style="margin-top: 40px;">
						<h5 style="padding: 10px 15px;text-align: center;font-size: initial;">
							Agora, gostaríamos de saber sobre a sua percepção quanto ao sistema.<br>
							Por favor, avalie o sistema WEB TCC analisando as afirmações abaixo, 
							tendo como referência nas seguintes opções:<br><br> 
							<span style="font-style: italic;">1 - Discordo totalmente</span><br>
							<span style="font-style: italic;">2 - Discordo parcialmente</span><br>
							<span style="font-style: italic;">3 - Indiferente</span><br>
							<span style="font-style: italic;">4 - Concordo parcialmente</span><br>
							<span style="font-style: italic;">5 - Concordo totalmente</span> 
						</h5>
					</div>
					
					<div class="form-inline">
						<div class="col-md-8 col-md-offset-2" style="margin-top: 20px;">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 70%">Considerações</th>
										<th style="width: 30%; text-align: center;">Avaliação</th>
									</tr>
								</thead>
								<tbody class="tbQuestion">
									<tr style="font-weight: bold;">
										<td colspan="2">Desempenho do sistema</td>
										<td></td>
									</tr>
									<tr style="text-align: left;">
										<td>O sistema responde rapidamente aos meus comandos (clicar em links, botões, opções de menu, etc). </td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="um" name="um"></td>
									</tr>
									<tr style="text-align: left;">
										<td>Encontro rapidamente as informações que procuro no sistema.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="dois" name="dois"></td>
									</tr>
									
									<tr style="font-weight: bold;">
										<td colspan="2">Usabilidade</td>
										<td></td>
									</tr>
									<tr style="text-align: left;">
										<td>Considero descomplicado criar um novo usuário.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="tres" name="tres"></td>
									</tr>
									<tr style="text-align: left;">
										<td>Consigo facilmente criar um novo projeto.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="quatro" name="quatro"></td>
									</tr>
									<tr style="text-align: left;">
										<td>Consigo adicionar integrantes no projeto sem dificuldade.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="cinco" name="cinco"></td>
									</tr>
									<tr style="text-align: left;">
										<td>Adiciono comentários ao projeto de forma descomplicada.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="seis" name="seis"></td>
									</tr>
									
									<tr style="font-weight: bold;">
										<td colspan="2">Comunicação</td>
										<td></td>
									</tr>
									<tr style="text-align: left;">
										<td>A comunicação entre os integrantes do projeto é simples.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="sete" name="sete"></td>
									</tr>
									<tr style="text-align: left;">
										<td>A comunicação entre acadêmico e orientador é simples.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="oito" name="oito"></td>
									</tr>
									<tr style="text-align: left;">
										<td>Visualizo as informações facilmente.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="nove" name="nove"></td>
									</tr>
									
									<tr style="font-weight: bold;">
										<td colspan="2">Arquivo</td>
										<td></td>
									</tr>
									<tr style="text-align: left;">
										<td>Consigo disponibilizar os arquivos do trabalho para todos os integrantes.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="dez" name="dez"></td>
									</tr>
									<tr style="text-align: left;">
										<td>Posso controlar facilmente as versões dos arquivos.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="onze" name="onze"></td>
									</tr>
									<tr style="text-align: left;">
										<td>Consigo realizar Upload e Download de arquivos sem dificuldade.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="doze" name="doze"></td>
									</tr>
									<tr style="text-align: left;">
										<td>Consigo visualizar os arquivos existentes.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="treze" name="treze"></td>
									</tr>
									
									
									<tr style="font-weight: bold;">
										<td colspan="2">Processo</td>
										<td></td>
									</tr>
									<tr style="text-align: left;">
										<td>Este sistema oferece todas as informações necessárias para eu gerenciar meu projeto.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="quatorze" name="quatorze"></td>
									</tr>
									
									
									<tr style="font-weight: bold;">
										<td colspan="2">Aplicabilidade</td>
										<td></td>
									</tr>
									<tr style="text-align: left;">
										<td>Com certeza este sistema seria útil para outros projetos acadêmicos.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="quinze" name="quinze"></td>
									</tr>
									
									
									<tr style="font-weight: bold;">
										<td colspan="2">Em relação ao sistema</td>
										<td></td>
									</tr>
									<tr style="text-align: left;">
										<td>Eu recomendaria a outros colegas.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="dezeseis" name="dezeseis"></td>
									</tr>
									<tr style="text-align: left;">
										<td>De forma geral, estou satisfeito com o sistema.</td>
										<td><input type="number" min="1" style="width: 100%;" maxlength="1" max="5" class="form-control" id="dezessete" name="dezessete"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					
					<div class="col-md-8 col-md-offset-2" style="margin-top: 20px;">
						<h5 style="padding: 10px 15px;text-align: center;font-size: initial;">
							Caso você tenha algum comentário, critica, e/ou sugestão sobre este sistema, registre-o neste espaço.
							<textarea  rows="5" cols="200" maxlength="255" class="form-control" id="description" name="description" style="margin-top: 20px;width: 100%;margin-bottom: 15px;max-width: 100%;" placeholder="Descrição"></textarea> 
						</h5>
					</div>
					<div class="col-md-6 col-md-offset-2">
						<button type="submit" class="btn btn-success btnSabeQuestions">Salvar</button>
						<button type="submit" class="btn btn-warning btnBack" style="margin-left: 15px;float: right;">Voltar</button>
					</div>
					
				</div>
			</form>
		</div>
		
	</div>
</body>
</html>