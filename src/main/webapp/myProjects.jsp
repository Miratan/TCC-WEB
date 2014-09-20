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
	
    <div class="container" style="margin-top: 30px;">
		<div class="panel panel-default">
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
	</div>

</body>
</html>