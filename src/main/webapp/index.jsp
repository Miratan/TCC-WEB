<!DOCTYPE html>
<html>
<head>
<title>Web - TCC</title>

<script type="text/javascript">

	var currentURL = window.location.pathname;
	setTimeout(function() {
		$('.msgErrorLogin').fadeOut('slow');
	}, 1500);
 
</script>

</head>
<body>
	<!--  CHAMADA MENU FIXO PARA USUÁRIO SEM ACESSO E SCRIPT/LINK BOOTSTRAP E JQUERY -->
	<div id="header">
    	<jsp:include page="menu.jsp"/>
	</div>

	<div class="container">
		<div class="starter-template">
			<div class="col-md-12">
				<div class="row">
					<h1>Sua primeira vez aqui?</h1>
					<div class="textSize">
						<div class="textInfo">
							<span>Para usar a Ferramenta você precisa criar uma conta de acesso.
							</span>
						</div>
						<div class="textInfo">
							<span>Clique no botão abaixo e preencha o formulário.</span>
						</div>
						<div class="textInfo">
							<span>O acesso a Ferramenta será realizado a 
								  partir do Usuário e Senha cadastrados a seguir.
							</span>
						</div>
					</div>
					<div style="margin-top: 10px;">
						<a href="register.jsp">
							<button type="button" class="btn btn-primary dropdown-toggle buttonInputGroup">Cadastrar
							</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="msgErrorLogin" style="margin: auto; text-align: center; color: red;">
			${errorLogin}
	</div>
</body>
</html>