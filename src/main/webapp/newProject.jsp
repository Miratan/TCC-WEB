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
	
	<!--  CHAMADA MENU FIXO PARA USU�RIO COM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menuUserLogged.jsp"/>
	</div>
	
    <div class="container" style="margin-top: 30px;">
    
    	<div class="textCenterAcess" style="text-align: center;">
			<div class="col-md-12">
				<form:form  method="post" action="/project/create">
					<div class="form-inline">
						<div class="col-md-4">
							<input id="title" name="title" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="T�tulo">
						</div>
						<div class="col-md-4">
							<input id="description" name="description" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Descri��o">
						</div>
						<div class="col-md-4">
							<input id="keyWords" name="keyWords" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Chaves">
						</div>
					</div>
					<div class="form-inline">
						<div class="col-md-4">
							<input id="discipline" name="discipline" type="text" class="form-control" style="margin:auto;margin-bottom: 15px;" placeholder="Disciplina">
						</div>
						<div class="col-md-4">
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