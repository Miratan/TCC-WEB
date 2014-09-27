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
	<div id="header">
    	<jsp:include page="menuGodMode.jsp"/>
	</div>

	<div class="container">

		<form:form method="POST" action="/file" enctype="multipart/form-data">
			<div class="inputFile">
				<span>Selecione um arquivo</span> 
				<input type="file" name="file" id="file" />
			</div>
			<div class="inputFile">
				<span>Descrição</span> 
				<input type="text" name="description" id="description" />
			</div>
			<div class="col-md-2 input-group"
				style="margin: auto; text-align: center; margin-bottom: 15px;">
				<button type="submit"
					class="btn btn-success dropdown-toggle buttonInputGroup"
					value="send">Salvar</button>
			</div>
		</form:form>

	</div>
</body>
</html>