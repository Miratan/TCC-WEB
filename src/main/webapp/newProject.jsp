<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>Web - TCC</title>
<script type="text/javascript">
</script>
</head>
<body>
	
	<!--  CHAMADA MENU FIXO PARA USUÁRIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	
    <div class="container">
    
    	<div class="textCenterAcess" style="text-align: center;">
			<div class="col-md-12">
				<form:form  method="post" action="/project/create">
					<div class="form-inline">
						<div class="col-md-12">
							<input id="title" maxlength="200" name="title" type="text" class="form-control" style="width: 100%;margin-bottom: 15px;" placeholder="Título">
						</div>
						<div class="col-md-6">
							<textarea rows="4" cols="50" maxlength="255" class="form-control" id="description" name="description" style="width: 100%;margin-bottom: 15px;" placeholder="Descrição"></textarea>
<!-- 							<input id="description" name="description" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Descrição"> -->
						</div>
						<div class="col-md-6">
							<input id="keyWords" name="keyWords" maxlength="200" type="text" class="form-control" style="width: 100%;margin-bottom: 15px;" placeholder="Palavras Chaves">
						</div>
						<div class="col-md-6">
							<input id="discipline" name="discipline" maxlength="200" type="text" class="form-control" style="width: 100%;margin-bottom: 15px;margin-top: 10px;" placeholder="Disciplina">
						</div>
						<div class="col-md-12" style="text-align: left;">
							<div>
								<span style="color: darkblue;font-style: italic;">Data Estimada da Entrega</span>
							</div>
							<input id="deliveryDate" name="deliveryDate" type="date" class="form-control" style="margin:auto;margin-bottom: 15px;min-width: 197px;" placeholder="Data da Entrega">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12">
							<div>
								<button type="submit" class="btn btn-success" value="send">Salvar</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
    </div>

</body>
</html>